//import chisel3._
//import chisel3.util._
//class CGRA extends Module {
//  val io = IO(new Bundle {
//    // define the IO ports for the CGRA module
//    val clk = Input(Clock())
//    val rst = Input(Reset())
//
//    val din_up = Input(UInt(32.W))
//    val din_down = Input(UInt(32.W))
//    val din_left = Input(UInt(32.W))
//    val din_right = Input(UInt(32.W))
//    val din_bypass_1 = Input(UInt(32.W))
//    val din_bypass_2 = Input(UInt(32.W))
//    val configuration = Input(UInt(22.W))
//
//    val dout_up = Output(UInt(32.W))
//    val dout_down = Output(UInt(32.W))
//    val dout_left = Output(UInt(32.W))
//    val dout_right = Output(UInt(32.W))
//    val dout_bypass_1 = Output(UInt(32.W))
//    val dout_bypass_2 = Output(UInt(32.W))
//  })
//
//  // Define the 4x4 grid of PE modules
//  val peGrid = Array.tabulate(4, 4) { (i, j) => Module(new PE()) }
//
//  // Connect the   and   ports of the PE modules
//  for (i <- 0 until 4) {
//    for (j <- 0 until 4) {
//      if (i > 0) {
//        peGrid(i)(j).io.din_up := peGrid(i - 1)(j).io.dout_down
//      }
//      if (i < 3) {
//        peGrid(i)(j).io.din_down := peGrid(i + 1)(j).io.dout_up
//      }
//      if (j > 0) {
//        peGrid(i)(j).io.din_left := peGrid(i)(j - 1).io.dout_right
//      }
//      if (j < 3) {
//        peGrid(i)(j).io.din_right := peGrid(i)(j + 1).io.dout_left
//      }
//    }
//  }
//
//  // Connect the bypass   and   ports of the PE modules
//  for (i <- 0 until 4) {
//    for (j <- 0 until 4) {
//      if (i > 0) {
//        peGrid(i)(j).io.din_bypass_1 := peGrid(i - 1)(j).io.dout_bypass_1
//      }
//      if (i < 3) {
//        peGrid(i)(j).io.din_bypass_2 := peGrid(i + 1)(j).io.dout_bypass_2
//      }
//      if (j > 0) {
//        peGrid(i)(j).io.dout_bypass_1 := peGrid(i)(j - 1).io.din_bypass_1
//      }
//      if (j < 3) {
//        peGrid(i)(j).io.dout_bypass_2 := peGrid(i)(j + 1).io.din_bypass_2
//      }
//    }
//  }
//
//  //  // Connect the configuration   port of the PE modules
//  //  for (i <- 0 until 4) {
//  //    for (j
//}