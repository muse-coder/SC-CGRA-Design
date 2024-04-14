package MyCGRA
import chisel3._
import chisel3.util._
//import M
//class _4x4_[T<: Data] (dataType:T, rowNum:Int,columnNum:Int)  extends Module {
//  val io = IO(new Bundle {
//    val PErowConfig = Input((Vec(rowNum, UInt(22.W))))
//    val ArrayInRight = Input(Vec(rowNum,dataType))
//    val ArrayInRight = Input(Vec(rowNum,dataType))
//    val ArrayInDown = Input((Vec( columnNum, dataType)))
//    val ArrayInUp = Input((Vec( columnNum, dataType)))
//
////    val ArrayOutDown = Output((Vec( columnNum, dataType)))
////    val ArrayOutUp = Output((Vec( columnNum, dataType)))
//    val ArrayOutLeft = Output(Vec(rowNum,dataType))
////    val ArrayOutRight = Output(Vec(rowNum,dataType))
//  })
////  val PEs = Array.fill(rowNum){Module (new PE_6_bus(dataType))}
////    val PEs =new PE_6_bus(dataType)
//  val PE_ROWs = Array.fill(rowNum){ Module (new PErow(  dataType,columnNum ) )}
//  for (i<- 0 until(rowNum)){
//    PE_ROWs(i).io.dataMemoryIn := io.dataMemoryIn(i)
//    PE_ROWs(i).io.RowInRight := ( 0.U(32.W))
//    PE_ROWs(i).io.PErowConfig := io.PErowConfig
//    io.ArrayOutLeft(i) := PE_ROWs(i).io.RowOutLeft
////    io.ArrayOutRight(i) := PE_ROWs(i).io.RowOutRight
//    if(i==0){
////      PE_ROWs(i).io.RowInUp := WireInit(Vec(columnNum ,0.U(UInt(32.W))))
//            PE_ROWs(i).io.RowInUp := VecInit.fill(columnNum)( 0.U(32.W))
////      VecInit.fill(2, 3)(5.U)
//      }
//    else {
//      PE_ROWs(i).io.RowInUp := PE_ROWs(i-1).io.RowOutDown
//    }
//    if (i == rowNum-1){
//      PE_ROWs(i).io.RowInDown := VecInit.fill(columnNum)( 0.U(32.W))
//    }
//    else {
//      PE_ROWs(i).io.RowInDown := PE_ROWs(i+1).io.RowOutUp
//    }
//  }
//  PE_ROWs(0).io.RowInBypass := PE_ROWs(2).io.RowOutBypass
//  PE_ROWs(1).io.RowInBypass := PE_ROWs(3).io.RowOutBypass
//  PE_ROWs(2).io.RowInBypass := PE_ROWs(0).io.RowOutBypass
//  PE_ROWs(3).io.RowInBypass := PE_ROWs(1).io.RowOutBypass
//}

class _4x4_king_mesh[T<: Data] (dataType:T, rowNum:Int,columnNum:Int)  extends Module {
  val io = IO(new Bundle {
    val PErowConfig = Input((Vec(rowNum, UInt(24.W))))
    val ArrayInLeft = Input(Vec(rowNum,dataType))

    val ArrayOutLeft = Output(Vec(rowNum, dataType))
//    val ArrayOutRight = Output(Vec(rowNum, dataType))
//    val ArrayOutDown = Output((Vec(columnNum, dataType)))
//    val ArrayOutUp = Output((Vec(columnNum, dataType)))
//    val ArrayOutNE = Output((Vec(columnNum, dataType)))
//    val ArrayOutNW = Output((Vec(columnNum, dataType)))
//    val ArrayOutSE = Output((Vec(columnNum, dataType)))
//    val ArrayOutSW = Output((Vec(columnNum, dataType)))
  })
  //  val PEs = Array.fill(rowNum){Module (new PE_6_bus(dataType))}
  //    val PEs =new PE_6_bus(dataType)
  val PE_ROWs = Array.fill(rowNum){ Module (new KingMeshRow(  dataType,columnNum ) )}
  for (i<- 0 until(rowNum)){
    PE_ROWs(i).io.RowInLeft := io.ArrayInLeft(i)
    PE_ROWs(i).io.RowInRight := ( 0.U(32.W))
    PE_ROWs(i).io.PErowConfig := io.PErowConfig
    io.ArrayOutLeft(i) := PE_ROWs(i).io.RowOutLeft
    if(i==0){
      PE_ROWs(i).io.RowInUp := VecInit.fill(columnNum)( 0.U(32.W))
      PE_ROWs(i).io.RowInNE := VecInit.fill(columnNum)( 0.U(32.W))
      PE_ROWs(i).io.RowInNW := VecInit.fill(columnNum)( 0.U(32.W))
    }
    else {
      PE_ROWs(i).io.RowInUp := PE_ROWs(i-1).io.RowOutDown
      PE_ROWs(i).io.RowInNW(0) :=  (0.U(32.W))
      PE_ROWs(i).io.RowInNW(1) :=  PE_ROWs(i).io.RowOutSE(0)
      PE_ROWs(i).io.RowInNW(2) :=  PE_ROWs(i).io.RowOutSE(1)
      PE_ROWs(i).io.RowInNW(3) :=  PE_ROWs(i).io.RowOutSE(2)

      PE_ROWs(i).io.RowInNE(3) := (0.U(32.W))
      PE_ROWs(i).io.RowInNE(2) := PE_ROWs(i).io.RowOutSW(3)
      PE_ROWs(i).io.RowInNE(1) := PE_ROWs(i).io.RowOutSW(2)
      PE_ROWs(i).io.RowInNE(0) := PE_ROWs(i).io.RowOutSW(1)

    }
    if (i == rowNum-1){
      PE_ROWs(i).io.RowInDown := VecInit.fill(columnNum)( 0.U(32.W))
      PE_ROWs(i).io.RowInSE := VecInit.fill(columnNum)(0.U(32.W))
      PE_ROWs(i).io.RowInSW := VecInit.fill(columnNum)(0.U(32.W))
    }
    else {
      PE_ROWs(i).io.RowInDown := PE_ROWs(i + 1).io.RowOutUp
      PE_ROWs(i).io.RowInSW(0) := (0.U(32.W))
      PE_ROWs(i).io.RowInSW(1) := PE_ROWs(i+1).io.RowOutNE(0)
      PE_ROWs(i).io.RowInSW(2) := PE_ROWs(i+1).io.RowOutNE(1)
      PE_ROWs(i).io.RowInSW(3) := PE_ROWs(i+1).io.RowOutNE(2)

      PE_ROWs(i).io.RowInSE(3) := (0.U(32.W))
      PE_ROWs(i).io.RowInSE(2) := PE_ROWs(i+1).io.RowOutNW(3)
      PE_ROWs(i).io.RowInSE(1) := PE_ROWs(i+1).io.RowOutNW(2)
      PE_ROWs(i).io.RowInSE(0) := PE_ROWs(i+1).io.RowOutNW(1)
    }
  }
}

object _4x4_u extends App {
  println("Generating the hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new _4x4_king_mesh (dataType=UInt(32.W), rowNum=4,columnNum=4), Array("--target-dir", "Output/_4x4_king_mesh"))
}