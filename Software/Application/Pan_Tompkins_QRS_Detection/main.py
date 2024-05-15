import math

from  QRS_SC import  *
# global bpass
# global der
# global sqr
# global mwin
#@title Choose ECG Signal { form-width: "16%", display-mode: "both" }
signal_number = 9 #@param {type:"slider", min:0, max:9, step:1}
import wfdb
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# matplotlib.use('TkAgg')

def generateFigure(data_1,data_2,saveName , dpi ,dataLabel1, dataLabel2, xLabel , yLabel, title):
    plt.figure(figsize=(40, 6), dpi=dpi)
    # plt.xticks(np.arange(0, len(data_1) + 1, 150))
    start = 32 if title!='Moving Window Integrated Signal' else 100
    plt.xticks(np.arange(0, 3501, 500),fontsize=34)
    y_min, y_max = plt.ylim()
    num_ticks = 5
    # plt.yticks(np.linspace(y_min, y_max, num_ticks), fontsize=16)
    # plt.yticks(np.arange(700, 1161, 100))

    # plt.yticks(np.linspace(start, len(data_1) - 2, num=10, dtype=int),fontsize=16)
    plt.yticks(np.linspace(math.floor(min(min(data_1), min(data_2))), math.ceil(max(max(data_1), max(data_2))),dtype=int), fontsize=34)
    plt.plot(data_1[start:len(data_1) - 2], color='blue', label=dataLabel1 ,linestyle='solid', linewidth=4,)
    plt.plot(data_2[start:len(data_2) - 2], color='red',  label=dataLabel2 ,linestyle='dashed', linewidth=2, )
    # plt.plot(data_3[start:len(data_3) - 2], color='green', label=dataLabel3 ,linestyle='dotted', linewidth=2, )
    plt.xlabel(xLabel, fontsize=34)
    plt.ylabel(yLabel, fontsize=34)
    # plt.gca().spines['bottom'].set_position(('data', 0))
    # plt.gca().spines['bottom'].set_position(('data', 700))
    plt.title(title, fontsize = 30)
    plt.legend(fontsize = 34 , loc='lower right')

    # plt.savefig(saveName,dpi=dpi)
    plt.savefig(saveName, dpi=dpi, bbox_inches='tight', pad_inches=0.1)
    plt.show()



filename = f'./DataSet/{str(100 + signal_number)}'
# filename = f'/content/mit-bih-arrhythmia-database-1.0.0/{str(100 + signal_number)}'
record = wfdb.rdrecord(filename, sampfrom=340, sampto=4000,)
annotation = wfdb.rdann(filename, 'atr', sampfrom=340, sampto=4000,shift_samps=True)

wfdb.plot_wfdb(record=record, annotation=annotation, time_units='seconds',figsize=(15,8))

ecg = pd.DataFrame(np.array([list(range(len(record.adc()))),record.adc()[:,0]]).T,columns=['TimeStamp','ecg'])
QRS_SC_detector_32 = Pan_Tompkins_QRS_SC()
QRS_SC_detector_64 = Pan_Tompkins_QRS_SC_64()
QRS_Exact_detector = Pan_Tompkins_QRS()
SC_bpass_32 , SC_der_32 , SC_sqr_32 ,SC_mwin_32  = QRS_SC_detector_32.solve(ecg,annotation)
SC_bpass_64 , SC_der_64 , SC_sqr_64 ,SC_mwin_64  = QRS_SC_detector_64.solve(ecg,annotation)
Exact_bpass , Exact_der , Exact_sqr ,Exact_mwin  = QRS_Exact_detector.solve(ecg,annotation)

# Plotting bandpassed signal
# plt.figure(figsize = (16,4), dpi = 100)
# plt.xticks(np.arange(0, len(SC_bpass)+1, 150))
# plt.plot(SC_bpass[32:len(SC_bpass)-2],color = 'blue',label='SC-Version')
# plt.plot(Exact_bpass[32:len(Exact_bpass)-2],color = 'red',label='Exact-Version')
# plt.xlabel('Samples')
# plt.ylabel('MLIImV')
# plt.title("Bandpassed Signal")
# plt.savefig('Bandpassed-Signal.png')
# generateFigure(data_1= SC_bpass_64 ,data_2=Exact_bpass ,saveName='1.png' , dpi=500,dataLabel1= 'SC-CGRA' , dataLabel2= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Bandpassed Signal')
generateFigure(data_1= SC_der_64   ,data_2=Exact_der ,saveName='2.png' , dpi=500,dataLabel1= 'SC-CGRA' , dataLabel2= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Derivative Signal')
# generateFigure(data_1= SC_sqr_64   ,data_2=Exact_sqr ,saveName='3.png' , dpi=500,dataLabel1= 'SC-CGRA' , dataLabel2= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Squared Signal')
# generateFigure(data_1= SC_mwin_64  ,data_2=Exact_mwin ,saveName='4.png' , dpi=500,dataLabel1= 'SC-CGRA' , dataLabel2= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Moving Window Integrated Signal')
#
# generateFigure(data_1= SC_bpass_32 ,data_2= SC_bpass_64 ,data_3=Exact_bpass ,saveName='1.png' , dpi=300,dataLabel1= 'SC-CGRA' ,dataLabel2= 'SC-CGRA(bitstream extended)' , dataLabel3= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Bandpassed Signal')
# generateFigure(data_1= SC_der_32   ,data_2= SC_der_64   ,data_3=Exact_der ,saveName='2.png' , dpi=300,  dataLabel1= 'SC-CGRA' ,dataLabel2= 'SC-CGRA(bitstream extended)' , dataLabel3= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Derivative Signal')
# generateFigure(data_1= SC_sqr_32   ,data_2= SC_sqr_64   ,data_3=Exact_sqr ,saveName='3.png' , dpi=300,  dataLabel1= 'SC-CGRA' ,dataLabel2= 'SC-CGRA(bitstream extended)' , dataLabel3= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Squared Signal')
# generateFigure(data_1= SC_mwin_32  ,data_2= SC_mwin_64  ,data_3=Exact_mwin ,saveName='4.png' , dpi=300, dataLabel1= 'SC-CGRA' ,dataLabel2= 'SC-CGRA(bitstream extended)' , dataLabel3= 'Typ-CGRA' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Moving Window Integrated Signal')


# Convert ecg signal to numpy array
signal = ecg.iloc[:,1].to_numpy()

# Find the R peak locations
hr_sc = heart_rate_SC(signal=signal,samp_freq= annotation.fs,mwin=SC_mwin_64,bpass=SC_bpass_64 )
hr_exact = heart_rate_SC(signal=signal,samp_freq= annotation.fs,mwin=Exact_mwin,bpass=Exact_bpass )
result_sc = hr_sc.find_r_peaks()
result_sc = np.array(result_sc)

result_exact = hr_exact.find_r_peaks()
result_exact = np.array(result_exact)


# Clip the x locations less than 0 (Learning Phase)
result_sc = result_sc[result_sc > 0]
result_exact = result_exact[result_exact > 0]

# Calculate the heart rate
heartRate_sc = (60*annotation.fs)/np.average(np.diff(result_sc[1:]))
heartRate_exact = (60*annotation.fs)/np.average(np.diff(result_exact[1:]))
print("Heart Rate SC",heartRate_sc, "BPM")
print("Heart Rate exact",heartRate_exact, "BPM")

# Plotting the R peak locations in ECG signal
plt.figure(figsize = (40,6), dpi = 500)
# plt.xticks(np.arange(0, len(signal)+1, 150))
plt.xticks(np.arange(0, 3501, 500), fontsize=34)
plt.yticks(fontsize=34)
plt.plot(signal, color = 'blue' ,  linewidth=4)
plt.scatter(result_sc, signal[result_sc], label = "SC-CGRA",color = 'red', s = 300, marker= '*')
plt.scatter(result_exact, signal[result_exact],label = "Typ-CGRA", color = 'blue', alpha=0.4, s = 300, marker= 'o')
plt.legend(fontsize=34, loc='lower right')
plt.xlabel('Samples' , fontsize = 34)
plt.ylabel('MLIImV', fontsize = 34)
plt.title("R Peak Locations",fontsize = 30)
plt.savefig('heartRate.png', dpi=500, bbox_inches='tight', pad_inches=0.1)
plt.show()
