module PErow(
  input         clock,
  input         reset,
  input  [21:0] io_PErowConfig_0,
  input  [21:0] io_PErowConfig_1,
  input  [21:0] io_PErowConfig_2,
  input  [21:0] io_PErowConfig_3,
  input  [31:0] io_dataMemoryIn,
  input  [31:0] io_RowInDown_0,
  input  [31:0] io_RowInDown_1,
  input  [31:0] io_RowInDown_2,
  input  [31:0] io_RowInDown_3,
  input  [31:0] io_RowInUp_0,
  input  [31:0] io_RowInUp_1,
  input  [31:0] io_RowInUp_2,
  input  [31:0] io_RowInUp_3,
  input  [31:0] io_RowInBypass_0,
  input  [31:0] io_RowInBypass_1,
  input  [31:0] io_RowInBypass_2,
  input  [31:0] io_RowInBypass_3,
  output [31:0] io_RowOutDown_0,
  output [31:0] io_RowOutDown_1,
  output [31:0] io_RowOutDown_2,
  output [31:0] io_RowOutDown_3,
  output [31:0] io_RowOutUp_0,
  output [31:0] io_RowOutUp_1,
  output [31:0] io_RowOutUp_2,
  output [31:0] io_RowOutUp_3,
  output [31:0] io_RowOutBypass_0,
  output [31:0] io_RowOutBypass_1,
  output [31:0] io_RowOutBypass_2,
  output [31:0] io_RowOutBypass_3,
  output [31:0] io_RowOutLeft
);
  wire  PE_6_bus_clk; // @[PErow.scala 40:44]
  wire  PE_6_bus_rst; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_din_bypass_2; // @[PErow.scala 40:44]
  wire [21:0] PE_6_bus_configuration; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_dout_bypass_2; // @[PErow.scala 40:44]
  wire  PE_6_bus_1_clk; // @[PErow.scala 40:44]
  wire  PE_6_bus_1_rst; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_din_bypass_2; // @[PErow.scala 40:44]
  wire [21:0] PE_6_bus_1_configuration; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_1_dout_bypass_2; // @[PErow.scala 40:44]
  wire  PE_6_bus_2_clk; // @[PErow.scala 40:44]
  wire  PE_6_bus_2_rst; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_din_bypass_2; // @[PErow.scala 40:44]
  wire [21:0] PE_6_bus_2_configuration; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_2_dout_bypass_2; // @[PErow.scala 40:44]
  wire  PE_6_bus_3_clk; // @[PErow.scala 40:44]
  wire  PE_6_bus_3_rst; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_din_bypass_2; // @[PErow.scala 40:44]
  wire [21:0] PE_6_bus_3_configuration; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_up; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_down; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_left; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_right; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_bypass_1; // @[PErow.scala 40:44]
  wire [31:0] PE_6_bus_3_dout_bypass_2; // @[PErow.scala 40:44]
  PE_6_bus PE_6_bus ( // @[PErow.scala 40:44]
    .clk(PE_6_bus_clk),
    .rst(PE_6_bus_rst),
    .din_up(PE_6_bus_din_up),
    .din_down(PE_6_bus_din_down),
    .din_left(PE_6_bus_din_left),
    .din_right(PE_6_bus_din_right),
    .din_bypass_1(PE_6_bus_din_bypass_1),
    .din_bypass_2(PE_6_bus_din_bypass_2),
    .configuration(PE_6_bus_configuration),
    .dout_up(PE_6_bus_dout_up),
    .dout_down(PE_6_bus_dout_down),
    .dout_left(PE_6_bus_dout_left),
    .dout_right(PE_6_bus_dout_right),
    .dout_bypass_1(PE_6_bus_dout_bypass_1),
    .dout_bypass_2(PE_6_bus_dout_bypass_2)
  );
  PE_6_bus PE_6_bus_1 ( // @[PErow.scala 40:44]
    .clk(PE_6_bus_1_clk),
    .rst(PE_6_bus_1_rst),
    .din_up(PE_6_bus_1_din_up),
    .din_down(PE_6_bus_1_din_down),
    .din_left(PE_6_bus_1_din_left),
    .din_right(PE_6_bus_1_din_right),
    .din_bypass_1(PE_6_bus_1_din_bypass_1),
    .din_bypass_2(PE_6_bus_1_din_bypass_2),
    .configuration(PE_6_bus_1_configuration),
    .dout_up(PE_6_bus_1_dout_up),
    .dout_down(PE_6_bus_1_dout_down),
    .dout_left(PE_6_bus_1_dout_left),
    .dout_right(PE_6_bus_1_dout_right),
    .dout_bypass_1(PE_6_bus_1_dout_bypass_1),
    .dout_bypass_2(PE_6_bus_1_dout_bypass_2)
  );
  PE_6_bus PE_6_bus_2 ( // @[PErow.scala 40:44]
    .clk(PE_6_bus_2_clk),
    .rst(PE_6_bus_2_rst),
    .din_up(PE_6_bus_2_din_up),
    .din_down(PE_6_bus_2_din_down),
    .din_left(PE_6_bus_2_din_left),
    .din_right(PE_6_bus_2_din_right),
    .din_bypass_1(PE_6_bus_2_din_bypass_1),
    .din_bypass_2(PE_6_bus_2_din_bypass_2),
    .configuration(PE_6_bus_2_configuration),
    .dout_up(PE_6_bus_2_dout_up),
    .dout_down(PE_6_bus_2_dout_down),
    .dout_left(PE_6_bus_2_dout_left),
    .dout_right(PE_6_bus_2_dout_right),
    .dout_bypass_1(PE_6_bus_2_dout_bypass_1),
    .dout_bypass_2(PE_6_bus_2_dout_bypass_2)
  );
  PE_6_bus PE_6_bus_3 ( // @[PErow.scala 40:44]
    .clk(PE_6_bus_3_clk),
    .rst(PE_6_bus_3_rst),
    .din_up(PE_6_bus_3_din_up),
    .din_down(PE_6_bus_3_din_down),
    .din_left(PE_6_bus_3_din_left),
    .din_right(PE_6_bus_3_din_right),
    .din_bypass_1(PE_6_bus_3_din_bypass_1),
    .din_bypass_2(PE_6_bus_3_din_bypass_2),
    .configuration(PE_6_bus_3_configuration),
    .dout_up(PE_6_bus_3_dout_up),
    .dout_down(PE_6_bus_3_dout_down),
    .dout_left(PE_6_bus_3_dout_left),
    .dout_right(PE_6_bus_3_dout_right),
    .dout_bypass_1(PE_6_bus_3_dout_bypass_1),
    .dout_bypass_2(PE_6_bus_3_dout_bypass_2)
  );
  assign io_RowOutDown_0 = PE_6_bus_dout_down; // @[PErow.scala 50:24]
  assign io_RowOutDown_1 = PE_6_bus_1_dout_down; // @[PErow.scala 50:24]
  assign io_RowOutDown_2 = PE_6_bus_2_dout_down; // @[PErow.scala 50:24]
  assign io_RowOutDown_3 = PE_6_bus_3_dout_down; // @[PErow.scala 50:24]
  assign io_RowOutUp_0 = PE_6_bus_dout_up; // @[PErow.scala 51:22]
  assign io_RowOutUp_1 = PE_6_bus_1_dout_up; // @[PErow.scala 51:22]
  assign io_RowOutUp_2 = PE_6_bus_2_dout_up; // @[PErow.scala 51:22]
  assign io_RowOutUp_3 = PE_6_bus_3_dout_up; // @[PErow.scala 51:22]
  assign io_RowOutBypass_0 = PE_6_bus_dout_bypass_2; // @[PErow.scala 52:26]
  assign io_RowOutBypass_1 = PE_6_bus_1_dout_bypass_2; // @[PErow.scala 52:26]
  assign io_RowOutBypass_2 = PE_6_bus_2_dout_bypass_2; // @[PErow.scala 52:26]
  assign io_RowOutBypass_3 = PE_6_bus_3_dout_bypass_2; // @[PErow.scala 52:26]
  assign io_RowOutLeft = PE_6_bus_dout_left; // @[PErow.scala 41:19]
  assign PE_6_bus_clk = clock; // @[PErow.scala 44:21]
  assign PE_6_bus_rst = reset; // @[PErow.scala 45:21]
  assign PE_6_bus_din_up = io_RowInUp_0; // @[PErow.scala 47:24]
  assign PE_6_bus_din_down = io_RowInDown_0; // @[PErow.scala 48:26]
  assign PE_6_bus_din_left = io_dataMemoryIn; // @[PErow.scala 54:28]
  assign PE_6_bus_din_right = PE_6_bus_1_dout_left; // @[PErow.scala 64:29]
  assign PE_6_bus_din_bypass_1 = PE_6_bus_2_dout_bypass_1; // @[PErow.scala 68:26]
  assign PE_6_bus_din_bypass_2 = io_RowInBypass_0; // @[PErow.scala 49:30]
  assign PE_6_bus_configuration = io_PErowConfig_0; // @[PErow.scala 46:31]
  assign PE_6_bus_1_clk = clock; // @[PErow.scala 44:21]
  assign PE_6_bus_1_rst = reset; // @[PErow.scala 45:21]
  assign PE_6_bus_1_din_up = io_RowInUp_1; // @[PErow.scala 47:24]
  assign PE_6_bus_1_din_down = io_RowInDown_1; // @[PErow.scala 48:26]
  assign PE_6_bus_1_din_left = PE_6_bus_dout_right; // @[PErow.scala 57:28]
  assign PE_6_bus_1_din_right = PE_6_bus_2_dout_left; // @[PErow.scala 64:29]
  assign PE_6_bus_1_din_bypass_1 = PE_6_bus_3_dout_bypass_1; // @[PErow.scala 69:26]
  assign PE_6_bus_1_din_bypass_2 = io_RowInBypass_1; // @[PErow.scala 49:30]
  assign PE_6_bus_1_configuration = io_PErowConfig_1; // @[PErow.scala 46:31]
  assign PE_6_bus_2_clk = clock; // @[PErow.scala 44:21]
  assign PE_6_bus_2_rst = reset; // @[PErow.scala 45:21]
  assign PE_6_bus_2_din_up = io_RowInUp_2; // @[PErow.scala 47:24]
  assign PE_6_bus_2_din_down = io_RowInDown_2; // @[PErow.scala 48:26]
  assign PE_6_bus_2_din_left = PE_6_bus_1_dout_right; // @[PErow.scala 57:28]
  assign PE_6_bus_2_din_right = PE_6_bus_3_dout_left; // @[PErow.scala 64:29]
  assign PE_6_bus_2_din_bypass_1 = PE_6_bus_dout_bypass_1; // @[PErow.scala 70:26]
  assign PE_6_bus_2_din_bypass_2 = io_RowInBypass_2; // @[PErow.scala 49:30]
  assign PE_6_bus_2_configuration = io_PErowConfig_2; // @[PErow.scala 46:31]
  assign PE_6_bus_3_clk = clock; // @[PErow.scala 44:21]
  assign PE_6_bus_3_rst = reset; // @[PErow.scala 45:21]
  assign PE_6_bus_3_din_up = io_RowInUp_3; // @[PErow.scala 47:24]
  assign PE_6_bus_3_din_down = io_RowInDown_3; // @[PErow.scala 48:26]
  assign PE_6_bus_3_din_left = PE_6_bus_2_dout_right; // @[PErow.scala 57:28]
  assign PE_6_bus_3_din_right = 32'h0; // @[PErow.scala 61:29]
  assign PE_6_bus_3_din_bypass_1 = PE_6_bus_1_dout_bypass_1; // @[PErow.scala 71:26]
  assign PE_6_bus_3_din_bypass_2 = io_RowInBypass_3; // @[PErow.scala 49:30]
  assign PE_6_bus_3_configuration = io_PErowConfig_3; // @[PErow.scala 46:31]
endmodule
module _4x4_(
  input         clock,
  input         reset,
  input  [21:0] io_PErowConfig_0,
  input  [21:0] io_PErowConfig_1,
  input  [21:0] io_PErowConfig_2,
  input  [21:0] io_PErowConfig_3,
  input  [31:0] io_dataMemoryIn_0,
  input  [31:0] io_dataMemoryIn_1,
  input  [31:0] io_dataMemoryIn_2,
  input  [31:0] io_dataMemoryIn_3,
  output [31:0] io_ArrayOutLeft_0,
  output [31:0] io_ArrayOutLeft_1,
  output [31:0] io_ArrayOutLeft_2,
  output [31:0] io_ArrayOutLeft_3
);
  wire  PErow_clock; // @[_4x4_.scala 20:44]
  wire  PErow_reset; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_io_PErowConfig_0; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_io_PErowConfig_1; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_io_PErowConfig_2; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_io_PErowConfig_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_dataMemoryIn; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowInBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_io_RowOutLeft; // @[_4x4_.scala 20:44]
  wire  PErow_1_clock; // @[_4x4_.scala 20:44]
  wire  PErow_1_reset; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_1_io_PErowConfig_0; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_1_io_PErowConfig_1; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_1_io_PErowConfig_2; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_1_io_PErowConfig_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_dataMemoryIn; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowInBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_1_io_RowOutLeft; // @[_4x4_.scala 20:44]
  wire  PErow_2_clock; // @[_4x4_.scala 20:44]
  wire  PErow_2_reset; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_2_io_PErowConfig_0; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_2_io_PErowConfig_1; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_2_io_PErowConfig_2; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_2_io_PErowConfig_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_dataMemoryIn; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowInBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_2_io_RowOutLeft; // @[_4x4_.scala 20:44]
  wire  PErow_3_clock; // @[_4x4_.scala 20:44]
  wire  PErow_3_reset; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_3_io_PErowConfig_0; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_3_io_PErowConfig_1; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_3_io_PErowConfig_2; // @[_4x4_.scala 20:44]
  wire [21:0] PErow_3_io_PErowConfig_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_dataMemoryIn; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowInBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutDown_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutDown_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutDown_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutDown_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutUp_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutUp_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutUp_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutUp_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutBypass_0; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutBypass_1; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutBypass_2; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutBypass_3; // @[_4x4_.scala 20:44]
  wire [31:0] PErow_3_io_RowOutLeft; // @[_4x4_.scala 20:44]
  PErow PErow ( // @[_4x4_.scala 20:44]
    .clock(PErow_clock),
    .reset(PErow_reset),
    .io_PErowConfig_0(PErow_io_PErowConfig_0),
    .io_PErowConfig_1(PErow_io_PErowConfig_1),
    .io_PErowConfig_2(PErow_io_PErowConfig_2),
    .io_PErowConfig_3(PErow_io_PErowConfig_3),
    .io_dataMemoryIn(PErow_io_dataMemoryIn),
    .io_RowInDown_0(PErow_io_RowInDown_0),
    .io_RowInDown_1(PErow_io_RowInDown_1),
    .io_RowInDown_2(PErow_io_RowInDown_2),
    .io_RowInDown_3(PErow_io_RowInDown_3),
    .io_RowInUp_0(PErow_io_RowInUp_0),
    .io_RowInUp_1(PErow_io_RowInUp_1),
    .io_RowInUp_2(PErow_io_RowInUp_2),
    .io_RowInUp_3(PErow_io_RowInUp_3),
    .io_RowInBypass_0(PErow_io_RowInBypass_0),
    .io_RowInBypass_1(PErow_io_RowInBypass_1),
    .io_RowInBypass_2(PErow_io_RowInBypass_2),
    .io_RowInBypass_3(PErow_io_RowInBypass_3),
    .io_RowOutDown_0(PErow_io_RowOutDown_0),
    .io_RowOutDown_1(PErow_io_RowOutDown_1),
    .io_RowOutDown_2(PErow_io_RowOutDown_2),
    .io_RowOutDown_3(PErow_io_RowOutDown_3),
    .io_RowOutUp_0(PErow_io_RowOutUp_0),
    .io_RowOutUp_1(PErow_io_RowOutUp_1),
    .io_RowOutUp_2(PErow_io_RowOutUp_2),
    .io_RowOutUp_3(PErow_io_RowOutUp_3),
    .io_RowOutBypass_0(PErow_io_RowOutBypass_0),
    .io_RowOutBypass_1(PErow_io_RowOutBypass_1),
    .io_RowOutBypass_2(PErow_io_RowOutBypass_2),
    .io_RowOutBypass_3(PErow_io_RowOutBypass_3),
    .io_RowOutLeft(PErow_io_RowOutLeft)
  );
  PErow PErow_1 ( // @[_4x4_.scala 20:44]
    .clock(PErow_1_clock),
    .reset(PErow_1_reset),
    .io_PErowConfig_0(PErow_1_io_PErowConfig_0),
    .io_PErowConfig_1(PErow_1_io_PErowConfig_1),
    .io_PErowConfig_2(PErow_1_io_PErowConfig_2),
    .io_PErowConfig_3(PErow_1_io_PErowConfig_3),
    .io_dataMemoryIn(PErow_1_io_dataMemoryIn),
    .io_RowInDown_0(PErow_1_io_RowInDown_0),
    .io_RowInDown_1(PErow_1_io_RowInDown_1),
    .io_RowInDown_2(PErow_1_io_RowInDown_2),
    .io_RowInDown_3(PErow_1_io_RowInDown_3),
    .io_RowInUp_0(PErow_1_io_RowInUp_0),
    .io_RowInUp_1(PErow_1_io_RowInUp_1),
    .io_RowInUp_2(PErow_1_io_RowInUp_2),
    .io_RowInUp_3(PErow_1_io_RowInUp_3),
    .io_RowInBypass_0(PErow_1_io_RowInBypass_0),
    .io_RowInBypass_1(PErow_1_io_RowInBypass_1),
    .io_RowInBypass_2(PErow_1_io_RowInBypass_2),
    .io_RowInBypass_3(PErow_1_io_RowInBypass_3),
    .io_RowOutDown_0(PErow_1_io_RowOutDown_0),
    .io_RowOutDown_1(PErow_1_io_RowOutDown_1),
    .io_RowOutDown_2(PErow_1_io_RowOutDown_2),
    .io_RowOutDown_3(PErow_1_io_RowOutDown_3),
    .io_RowOutUp_0(PErow_1_io_RowOutUp_0),
    .io_RowOutUp_1(PErow_1_io_RowOutUp_1),
    .io_RowOutUp_2(PErow_1_io_RowOutUp_2),
    .io_RowOutUp_3(PErow_1_io_RowOutUp_3),
    .io_RowOutBypass_0(PErow_1_io_RowOutBypass_0),
    .io_RowOutBypass_1(PErow_1_io_RowOutBypass_1),
    .io_RowOutBypass_2(PErow_1_io_RowOutBypass_2),
    .io_RowOutBypass_3(PErow_1_io_RowOutBypass_3),
    .io_RowOutLeft(PErow_1_io_RowOutLeft)
  );
  PErow PErow_2 ( // @[_4x4_.scala 20:44]
    .clock(PErow_2_clock),
    .reset(PErow_2_reset),
    .io_PErowConfig_0(PErow_2_io_PErowConfig_0),
    .io_PErowConfig_1(PErow_2_io_PErowConfig_1),
    .io_PErowConfig_2(PErow_2_io_PErowConfig_2),
    .io_PErowConfig_3(PErow_2_io_PErowConfig_3),
    .io_dataMemoryIn(PErow_2_io_dataMemoryIn),
    .io_RowInDown_0(PErow_2_io_RowInDown_0),
    .io_RowInDown_1(PErow_2_io_RowInDown_1),
    .io_RowInDown_2(PErow_2_io_RowInDown_2),
    .io_RowInDown_3(PErow_2_io_RowInDown_3),
    .io_RowInUp_0(PErow_2_io_RowInUp_0),
    .io_RowInUp_1(PErow_2_io_RowInUp_1),
    .io_RowInUp_2(PErow_2_io_RowInUp_2),
    .io_RowInUp_3(PErow_2_io_RowInUp_3),
    .io_RowInBypass_0(PErow_2_io_RowInBypass_0),
    .io_RowInBypass_1(PErow_2_io_RowInBypass_1),
    .io_RowInBypass_2(PErow_2_io_RowInBypass_2),
    .io_RowInBypass_3(PErow_2_io_RowInBypass_3),
    .io_RowOutDown_0(PErow_2_io_RowOutDown_0),
    .io_RowOutDown_1(PErow_2_io_RowOutDown_1),
    .io_RowOutDown_2(PErow_2_io_RowOutDown_2),
    .io_RowOutDown_3(PErow_2_io_RowOutDown_3),
    .io_RowOutUp_0(PErow_2_io_RowOutUp_0),
    .io_RowOutUp_1(PErow_2_io_RowOutUp_1),
    .io_RowOutUp_2(PErow_2_io_RowOutUp_2),
    .io_RowOutUp_3(PErow_2_io_RowOutUp_3),
    .io_RowOutBypass_0(PErow_2_io_RowOutBypass_0),
    .io_RowOutBypass_1(PErow_2_io_RowOutBypass_1),
    .io_RowOutBypass_2(PErow_2_io_RowOutBypass_2),
    .io_RowOutBypass_3(PErow_2_io_RowOutBypass_3),
    .io_RowOutLeft(PErow_2_io_RowOutLeft)
  );
  PErow PErow_3 ( // @[_4x4_.scala 20:44]
    .clock(PErow_3_clock),
    .reset(PErow_3_reset),
    .io_PErowConfig_0(PErow_3_io_PErowConfig_0),
    .io_PErowConfig_1(PErow_3_io_PErowConfig_1),
    .io_PErowConfig_2(PErow_3_io_PErowConfig_2),
    .io_PErowConfig_3(PErow_3_io_PErowConfig_3),
    .io_dataMemoryIn(PErow_3_io_dataMemoryIn),
    .io_RowInDown_0(PErow_3_io_RowInDown_0),
    .io_RowInDown_1(PErow_3_io_RowInDown_1),
    .io_RowInDown_2(PErow_3_io_RowInDown_2),
    .io_RowInDown_3(PErow_3_io_RowInDown_3),
    .io_RowInUp_0(PErow_3_io_RowInUp_0),
    .io_RowInUp_1(PErow_3_io_RowInUp_1),
    .io_RowInUp_2(PErow_3_io_RowInUp_2),
    .io_RowInUp_3(PErow_3_io_RowInUp_3),
    .io_RowInBypass_0(PErow_3_io_RowInBypass_0),
    .io_RowInBypass_1(PErow_3_io_RowInBypass_1),
    .io_RowInBypass_2(PErow_3_io_RowInBypass_2),
    .io_RowInBypass_3(PErow_3_io_RowInBypass_3),
    .io_RowOutDown_0(PErow_3_io_RowOutDown_0),
    .io_RowOutDown_1(PErow_3_io_RowOutDown_1),
    .io_RowOutDown_2(PErow_3_io_RowOutDown_2),
    .io_RowOutDown_3(PErow_3_io_RowOutDown_3),
    .io_RowOutUp_0(PErow_3_io_RowOutUp_0),
    .io_RowOutUp_1(PErow_3_io_RowOutUp_1),
    .io_RowOutUp_2(PErow_3_io_RowOutUp_2),
    .io_RowOutUp_3(PErow_3_io_RowOutUp_3),
    .io_RowOutBypass_0(PErow_3_io_RowOutBypass_0),
    .io_RowOutBypass_1(PErow_3_io_RowOutBypass_1),
    .io_RowOutBypass_2(PErow_3_io_RowOutBypass_2),
    .io_RowOutBypass_3(PErow_3_io_RowOutBypass_3),
    .io_RowOutLeft(PErow_3_io_RowOutLeft)
  );
  assign io_ArrayOutLeft_0 = PErow_io_RowOutLeft; // @[_4x4_.scala 25:24]
  assign io_ArrayOutLeft_1 = PErow_1_io_RowOutLeft; // @[_4x4_.scala 25:24]
  assign io_ArrayOutLeft_2 = PErow_2_io_RowOutLeft; // @[_4x4_.scala 25:24]
  assign io_ArrayOutLeft_3 = PErow_3_io_RowOutLeft; // @[_4x4_.scala 25:24]
  assign PErow_clock = clock;
  assign PErow_reset = reset;
  assign PErow_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 24:31]
  assign PErow_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 24:31]
  assign PErow_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 24:31]
  assign PErow_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 24:31]
  assign PErow_io_dataMemoryIn = io_dataMemoryIn_0; // @[_4x4_.scala 22:32]
  assign PErow_io_RowInDown_0 = PErow_1_io_RowOutUp_0; // @[_4x4_.scala 39:31]
  assign PErow_io_RowInDown_1 = PErow_1_io_RowOutUp_1; // @[_4x4_.scala 39:31]
  assign PErow_io_RowInDown_2 = PErow_1_io_RowOutUp_2; // @[_4x4_.scala 39:31]
  assign PErow_io_RowInDown_3 = PErow_1_io_RowOutUp_3; // @[_4x4_.scala 39:31]
  assign PErow_io_RowInUp_0 = 32'h0; // @[_4x4_.scala 29:{61,61}]
  assign PErow_io_RowInUp_1 = 32'h0; // @[_4x4_.scala 29:{61,61}]
  assign PErow_io_RowInUp_2 = 32'h0; // @[_4x4_.scala 29:{61,61}]
  assign PErow_io_RowInUp_3 = 32'h0; // @[_4x4_.scala 29:{61,61}]
  assign PErow_io_RowInBypass_0 = PErow_2_io_RowOutBypass_0; // @[_4x4_.scala 42:29]
  assign PErow_io_RowInBypass_1 = PErow_2_io_RowOutBypass_1; // @[_4x4_.scala 42:29]
  assign PErow_io_RowInBypass_2 = PErow_2_io_RowOutBypass_2; // @[_4x4_.scala 42:29]
  assign PErow_io_RowInBypass_3 = PErow_2_io_RowOutBypass_3; // @[_4x4_.scala 42:29]
  assign PErow_1_clock = clock;
  assign PErow_1_reset = reset;
  assign PErow_1_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 24:31]
  assign PErow_1_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 24:31]
  assign PErow_1_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 24:31]
  assign PErow_1_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 24:31]
  assign PErow_1_io_dataMemoryIn = io_dataMemoryIn_1; // @[_4x4_.scala 22:32]
  assign PErow_1_io_RowInDown_0 = PErow_2_io_RowOutUp_0; // @[_4x4_.scala 39:31]
  assign PErow_1_io_RowInDown_1 = PErow_2_io_RowOutUp_1; // @[_4x4_.scala 39:31]
  assign PErow_1_io_RowInDown_2 = PErow_2_io_RowOutUp_2; // @[_4x4_.scala 39:31]
  assign PErow_1_io_RowInDown_3 = PErow_2_io_RowOutUp_3; // @[_4x4_.scala 39:31]
  assign PErow_1_io_RowInUp_0 = PErow_io_RowOutDown_0; // @[_4x4_.scala 33:29]
  assign PErow_1_io_RowInUp_1 = PErow_io_RowOutDown_1; // @[_4x4_.scala 33:29]
  assign PErow_1_io_RowInUp_2 = PErow_io_RowOutDown_2; // @[_4x4_.scala 33:29]
  assign PErow_1_io_RowInUp_3 = PErow_io_RowOutDown_3; // @[_4x4_.scala 33:29]
  assign PErow_1_io_RowInBypass_0 = PErow_3_io_RowOutBypass_0; // @[_4x4_.scala 43:29]
  assign PErow_1_io_RowInBypass_1 = PErow_3_io_RowOutBypass_1; // @[_4x4_.scala 43:29]
  assign PErow_1_io_RowInBypass_2 = PErow_3_io_RowOutBypass_2; // @[_4x4_.scala 43:29]
  assign PErow_1_io_RowInBypass_3 = PErow_3_io_RowOutBypass_3; // @[_4x4_.scala 43:29]
  assign PErow_2_clock = clock;
  assign PErow_2_reset = reset;
  assign PErow_2_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 24:31]
  assign PErow_2_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 24:31]
  assign PErow_2_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 24:31]
  assign PErow_2_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 24:31]
  assign PErow_2_io_dataMemoryIn = io_dataMemoryIn_2; // @[_4x4_.scala 22:32]
  assign PErow_2_io_RowInDown_0 = PErow_3_io_RowOutUp_0; // @[_4x4_.scala 39:31]
  assign PErow_2_io_RowInDown_1 = PErow_3_io_RowOutUp_1; // @[_4x4_.scala 39:31]
  assign PErow_2_io_RowInDown_2 = PErow_3_io_RowOutUp_2; // @[_4x4_.scala 39:31]
  assign PErow_2_io_RowInDown_3 = PErow_3_io_RowOutUp_3; // @[_4x4_.scala 39:31]
  assign PErow_2_io_RowInUp_0 = PErow_1_io_RowOutDown_0; // @[_4x4_.scala 33:29]
  assign PErow_2_io_RowInUp_1 = PErow_1_io_RowOutDown_1; // @[_4x4_.scala 33:29]
  assign PErow_2_io_RowInUp_2 = PErow_1_io_RowOutDown_2; // @[_4x4_.scala 33:29]
  assign PErow_2_io_RowInUp_3 = PErow_1_io_RowOutDown_3; // @[_4x4_.scala 33:29]
  assign PErow_2_io_RowInBypass_0 = PErow_io_RowOutBypass_0; // @[_4x4_.scala 44:29]
  assign PErow_2_io_RowInBypass_1 = PErow_io_RowOutBypass_1; // @[_4x4_.scala 44:29]
  assign PErow_2_io_RowInBypass_2 = PErow_io_RowOutBypass_2; // @[_4x4_.scala 44:29]
  assign PErow_2_io_RowInBypass_3 = PErow_io_RowOutBypass_3; // @[_4x4_.scala 44:29]
  assign PErow_3_clock = clock;
  assign PErow_3_reset = reset;
  assign PErow_3_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 24:31]
  assign PErow_3_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 24:31]
  assign PErow_3_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 24:31]
  assign PErow_3_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 24:31]
  assign PErow_3_io_dataMemoryIn = io_dataMemoryIn_3; // @[_4x4_.scala 22:32]
  assign PErow_3_io_RowInDown_0 = 32'h0; // @[_4x4_.scala 36:{57,57}]
  assign PErow_3_io_RowInDown_1 = 32'h0; // @[_4x4_.scala 36:{57,57}]
  assign PErow_3_io_RowInDown_2 = 32'h0; // @[_4x4_.scala 36:{57,57}]
  assign PErow_3_io_RowInDown_3 = 32'h0; // @[_4x4_.scala 36:{57,57}]
  assign PErow_3_io_RowInUp_0 = PErow_2_io_RowOutDown_0; // @[_4x4_.scala 33:29]
  assign PErow_3_io_RowInUp_1 = PErow_2_io_RowOutDown_1; // @[_4x4_.scala 33:29]
  assign PErow_3_io_RowInUp_2 = PErow_2_io_RowOutDown_2; // @[_4x4_.scala 33:29]
  assign PErow_3_io_RowInUp_3 = PErow_2_io_RowOutDown_3; // @[_4x4_.scala 33:29]
  assign PErow_3_io_RowInBypass_0 = PErow_1_io_RowOutBypass_0; // @[_4x4_.scala 45:29]
  assign PErow_3_io_RowInBypass_1 = PErow_1_io_RowOutBypass_1; // @[_4x4_.scala 45:29]
  assign PErow_3_io_RowInBypass_2 = PErow_1_io_RowOutBypass_2; // @[_4x4_.scala 45:29]
  assign PErow_3_io_RowInBypass_3 = PErow_1_io_RowOutBypass_3; // @[_4x4_.scala 45:29]
endmodule
