from  QRS_SC import  *
# global bpass
# global der
# global sqr
# global mwin
#@title Choose ECG Signal { form-width: "20%", display-mode: "both" }
signal_number = 9 #@param {type:"slider", min:0, max:9, step:1}
import wfdb
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# matplotlib.use('TkAgg')

def generateFigure(data_1,data_2,saveName , dpi ,dataLabel1, dataLabel2, xLabel , yLabel, title):
    plt.figure(figsize=(20, 4), dpi=dpi)
    plt.xticks(np.arange(0, len(data_1) + 1, 150))
    start = 32 if title!='Moving Window Integrated Signal' else 100
    plt.plot(data_1[start:len(data_1) - 2], color='blue', label=dataLabel1 ,linestyle='-', linewidth=3,)
    plt.plot(data_2[start:len(data_2) - 2], color='red', label=dataLabel2 ,linestyle='--', linewidth=1, )
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    plt.title(title)
    plt.legend()
    plt.savefig(saveName)
    # plt.show()


filename = f'./DataSet/{str(100 + signal_number)}'
# filename = f'/content/mit-bih-arrhythmia-database-1.0.0/{str(100 + signal_number)}'
record = wfdb.rdrecord(filename, sampfrom=180, sampto=4000,)
annotation = wfdb.rdann(filename, 'atr', sampfrom=180, sampto=4000,shift_samps=True)

wfdb.plot_wfdb(record=record, annotation=annotation, time_units='seconds',figsize=(15,8))

QRS_SC_detector = Pan_Tompkins_QRS_SC()
ecg = pd.DataFrame(np.array([list(range(len(record.adc()))),record.adc()[:,0]]).T,columns=['TimeStamp','ecg'])
SC_bpass , SC_der , SC_sqr ,SC_mwin  = QRS_SC_detector.solve(ecg,annotation)
QRS_Exact_detector = Pan_Tompkins_QRS()
Exact_bpass , Exact_der , Exact_sqr ,Exact_mwin  = QRS_Exact_detector.solve(ecg,annotation)

# Plotting bandpassed signal
# plt.figure(figsize = (20,4), dpi = 100)
# plt.xticks(np.arange(0, len(SC_bpass)+1, 150))
# plt.plot(SC_bpass[32:len(SC_bpass)-2],color = 'blue',label='SC-Version')
# plt.plot(Exact_bpass[32:len(Exact_bpass)-2],color = 'red',label='Exact-Version')
# plt.xlabel('Samples')
# plt.ylabel('MLIImV')
# plt.title("Bandpassed Signal")
# plt.savefig('Bandpassed-Signal.png')
# plt.show()
generateFigure(data_1= SC_bpass ,data_2=Exact_bpass ,saveName='1.png' , dpi=300,dataLabel1= 'SC-Version' , dataLabel2= 'Exact-Version' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Bandpassed Signal')
generateFigure(data_1= SC_der   ,data_2=Exact_der ,saveName='2.png' , dpi=300,dataLabel1= 'SC-Version' , dataLabel2= 'Exact-Version' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Derivative Signal')
generateFigure(data_1= SC_sqr   ,data_2=Exact_sqr ,saveName='3.png' , dpi=300,dataLabel1= 'SC-Version' , dataLabel2= 'Exact-Version' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Squared Signal')
generateFigure(data_1= SC_mwin  ,data_2=Exact_mwin ,saveName='4.png' , dpi=300,dataLabel1= 'SC-Version' , dataLabel2= 'Exact-Version' , xLabel= 'Samples' ,yLabel= 'MLIImV',title='Moving Window Integrated Signal')


# Convert ecg signal to numpy array
signal = ecg.iloc[:,1].to_numpy()

# Find the R peak locations
hr = heart_rate_SC(signal=signal,samp_freq= annotation.fs,mwin=SC_mwin,bpass=SC_bpass )
result = hr.find_r_peaks()
result = np.array(result)

# Clip the x locations less than 0 (Learning Phase)
result = result[result > 0]

# Calculate the heart rate
heartRate = (60*annotation.fs)/np.average(np.diff(result[1:]))
print("Heart Rate",heartRate, "BPM")

# Plotting the R peak locations in ECG signal
plt.figure(figsize = (20,4), dpi = 300)
plt.xticks(np.arange(0, len(signal)+1, 150))
plt.plot(signal, color = 'blue')
plt.scatter(result, signal[result], color = 'red', s = 50, marker= '*')
plt.xlabel('Samples')
plt.ylabel('MLIImV')
plt.title("R Peak Locations")
plt.savefig('heartRate.png')
plt.show()
