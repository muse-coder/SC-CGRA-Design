package MyCGRA
import chisel3._
import chisel3.util._
//import org.scalatest.CompositeStatus.Bundle0
//class PE_6_bus [T<:Data] (dataType :T)extends BlackBox {
//  val io = IO(new Bundle {
//    val clk =  Input(Clock())
//    val rst = Input(Bool())
//    val din_up = Input(dataType )
//    val din_down = Input(dataType )
//    val din_left = Input(dataType )
//    val din_right = Input(dataType )
//    val din_bypass_1 = Input(dataType )
//    val din_bypass_2 = Input(dataType )
//    val configuration = Input(UInt(22.W))
//
//    val dout_up = Output(dataType )
//    val dout_down = Output(dataType )
//    val dout_left = Output(dataType )
//    val dout_right = Output(dataType )
//    val dout_bypass_1 = Output(dataType )
//    val dout_bypass_2 = Output(dataType )
//  }
//  )
//}
class _16_PE[T<: Data] (dataType:T ,columnNum:Int)extends  Module{
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

  for (i <- 0 until(columnNum) by 4){
    PEs(0+i).io.din_bypass_1 := PEs(2+i).io.dout_bypass_1
    PEs(1+i).io.din_bypass_1 := PEs(3+i).io.dout_bypass_1
    PEs(2+i).io.din_bypass_1 := PEs(0+i).io.dout_bypass_1
    PEs(3+i).io.din_bypass_1 := PEs(1+i).io.dout_bypass_1
  }
}
object _16_PE_u extends App {
  println("Generating the hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new _16_PE( dataType= UInt(32.W),16 ), Array("--target-dir", "Output/_16_PE"))
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