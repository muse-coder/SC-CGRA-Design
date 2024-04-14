package MyCGRA
import chisel3._
import chisel3.util._
//import org.scalatest.CompositeStatus.Bundle
class PE_6_bus [T<:Data] (dataType :T)extends BlackBox {
  val io = IO(new Bundle {
    val clk =  Input(Clock())
    val rst = Input(Bool())
    val din_up = Input(dataType )
    val din_down = Input(dataType )
    val din_left = Input(dataType )
    val din_right = Input(dataType )
    val din_bypass_1 = Input(dataType )
    val din_bypass_2 = Input(dataType )
    val configuration = Input(UInt(22.W))

    val dout_up = Output(dataType )
    val dout_down = Output(dataType )
    val dout_left = Output(dataType )
    val dout_right = Output(dataType )
    val dout_bypass_1 = Output(dataType )
    val dout_bypass_2 = Output(dataType )
    }
  )
}

class IoPort [T<:Data] (dataType :T)extends Bundle{
  val clk = Input(Clock())
  val rst = Input(Bool())
  val din_up = Input(dataType)
  val din_down = Input(dataType)
  val din_left = Input(dataType)
  val din_right = Input(dataType)
  val din_NE = Input(dataType)
  val din_NW = Input(dataType)
  val din_SE = Input(dataType)
  val din_SW = Input(dataType)

  val configuration = Input(UInt(24.W))

  val dout_up = Output(dataType)
  val dout_down = Output(dataType)
  val dout_left = Output(dataType)
  val dout_right = Output(dataType)
  val dout_NE = Output(dataType)
  val dout_NW = Output(dataType)
  val dout_SE = Output(dataType)
  val dout_SW = Output(dataType)
}
class PE_king_mesh [T<:Data] (dataType :T)extends BlackBox {
  val io =IO(new IoPort(dataType = dataType))
}
// 0 1
// 2 3
//


class KingMeshRow[T<: Data] (dataType:T ,columnNum:Int=4)extends  Module{
  val io= IO(new Bundle{
    val PErowConfig = Input((Vec(columnNum,UInt(24.W))))
    val RowInLeft = Input(dataType )
    val RowInRight = Input(dataType)
    val RowInUp = Input((Vec(columnNum,dataType )))
    val RowInDown = Input((Vec(columnNum,dataType )))
    val RowInNE = Input((Vec(columnNum,dataType )))
    val RowInNW = Input((Vec(columnNum, dataType)))
    val RowInSE = Input((Vec(columnNum, dataType)))
    val RowInSW = Input((Vec(columnNum, dataType)))
    val RowOutLeft = Output(dataType)
    val RowOutRight = Output(dataType)
    val RowOutUp = Output((Vec(columnNum, dataType)))
    val RowOutDown = Output((Vec(columnNum, dataType)))
    val RowOutNE = Output((Vec(columnNum, dataType)))
    val RowOutNW = Output((Vec(columnNum, dataType)))
    val RowOutSE = Output((Vec(columnNum, dataType)))
    val RowOutSW = Output((Vec(columnNum, dataType)))
  })
  val PEs = Array.fill(columnNum){Module (new PE_king_mesh(dataType))}
  io.RowOutLeft := PEs(0).io.dout_left
  io.RowOutRight := PEs(columnNum-1).io.dout_right
  for (i <- 0 until columnNum){
    PEs(i).io.clk := clock
    PEs(i).io.rst := reset
    PEs(i).io.configuration := io.PErowConfig(i)
    PEs(i).io.din_up := io.RowInUp(i)
    PEs(i).io.din_down := io.RowInDown(i)
    PEs(i).io.din_NE := io.RowInNE(i)
    PEs(i).io.din_NW := io.RowInNW(i)
    PEs(i).io.din_SE := io.RowInSE(i)
    PEs(i).io.din_SW := io.RowInSW(i)
    io.RowOutDown(i) := PEs(i).io.dout_down
    io.RowOutUp(i)   := PEs(i).io.dout_up
    io.RowOutNE(i)   := PEs(i).io.dout_NE
    io.RowOutNW(i)   := PEs(i).io.dout_NW
    io.RowOutSE(i)   := PEs(i).io.dout_SE
    io.RowOutSW(i)   := PEs(i).io.dout_SW
    if(i == 0){
      PEs(i).io.din_left := io.RowInLeft
    }
    else {
      PEs(i).io.din_left := PEs(i-1).io.dout_right
    }

    if (i == columnNum-1) {
      PEs(i).io.din_right := io.RowInRight
    }
    else {
      PEs(i).io.din_right := PEs(i + 1).io.dout_left
    }
  }

}



class PErow[T<: Data] (dataType:T ,columnNum:Int)extends  Module{
  val io= IO(new Bundle{
    val PErowConfig = Input((Vec(columnNum,UInt(22.W))))
    val dataMemoryIn = Input(dataType )
    val RowInRight = Input(dataType)
    val RowInDown = Input((Vec(columnNum,dataType )))
    val RowInUp = Input((Vec(columnNum,dataType )))
    val RowInBypass = Input((Vec(columnNum,dataType )))
    val RowOutDown = Output((Vec(columnNum, dataType )))
    val RowOutUp = Output((Vec(columnNum, dataType )))
    val RowOutBypass = Output((Vec(columnNum, dataType )))
    val RowOutLeft = Output(dataType)
    val RowOutRight = Output(dataType)
  })
    val PEs = Array.fill(columnNum){Module (new PE_6_bus(dataType))}
    io.RowOutLeft := PEs(0).io.dout_left;
    io.RowOutRight := PEs(columnNum-1).io.dout_right;
    for (i <- 0 until columnNum){
      PEs(i).io.clk := clock
      PEs(i).io.rst := reset
      PEs(i).io.configuration := io.PErowConfig(i)
      PEs(i).io.din_up := io.RowInUp(i)
      PEs(i).io.din_down := io.RowInDown(i)
      PEs(i).io.din_bypass_2 := io.RowInBypass(i)
      io.RowOutDown(i) := PEs(i).io.dout_down
      io.RowOutUp(i) := PEs(i).io.dout_up
      io.RowOutBypass(i) := PEs(i).io.dout_bypass_2
      if(i == 0){
        PEs(i).io.din_left := io.dataMemoryIn
      }
      else {
        PEs(i).io.din_left := PEs(i-1).io.dout_right
      }

      if (i == columnNum-1) {
        PEs(i).io.din_right := io.RowInRight
      }
      else {
        PEs(i).io.din_right := PEs(i + 1).io.dout_left
      }
    }

  PEs(0).io.din_bypass_1 := PEs(2).io.dout_bypass_1
  PEs(1).io.din_bypass_1 := PEs(3).io.dout_bypass_1
  PEs(2).io.din_bypass_1 := PEs(0).io.dout_bypass_1
  PEs(3).io.din_bypass_1 := PEs(1).io.dout_bypass_1
}
object PErow_u extends App {
  println("Generating the hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new KingMeshRow( dataType= UInt(32.W),4 ), Array("--target-dir", "Output/KingMeshRow"))
}
// blackbox.scala
//package test
//
//import chisel3._
//
//class Dut extends BlackBox {
//  val io = IO(new Bundle {
//    val a = Input(dataType )
//    val clk = Input(Clock())
//    val reset = Input(Bool())
//    val b = Output(UInt(4.W))
//  })
//}
//
//class UseDut extends Module {
//  val io = IO(new Bundle {
//    val toDut_a = Input(dataType )
//    val toDut_b = Output(UInt(4.W))
//  })
//
//  val u0 = Module(new Dut)
//
//  u0.io.a := io.toDut_a
//  u0.io.clk := clock
//  u0.io.reset := reset
//  io.toDut_b := u0.io.b
//}
//
//object UseDutTest extends App {
//  chisel3.Driver.execute(args, () => new UseDut)
//}