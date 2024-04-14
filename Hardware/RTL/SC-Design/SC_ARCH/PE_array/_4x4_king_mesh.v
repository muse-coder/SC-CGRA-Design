module KingMeshRow(
  input         clock,
  input         reset,
  input  [23:0] io_PErowConfig_0,
  input  [23:0] io_PErowConfig_1,
  input  [23:0] io_PErowConfig_2,
  input  [23:0] io_PErowConfig_3,
  input  [31:0] io_RowInLeft,
  input  [31:0] io_RowInUp_0,
  input  [31:0] io_RowInUp_1,
  input  [31:0] io_RowInUp_2,
  input  [31:0] io_RowInUp_3,
  input  [31:0] io_RowInDown_0,
  input  [31:0] io_RowInDown_1,
  input  [31:0] io_RowInDown_2,
  input  [31:0] io_RowInDown_3,
  input  [31:0] io_RowInNE_0,
  input  [31:0] io_RowInNE_1,
  input  [31:0] io_RowInNE_2,
  input  [31:0] io_RowInNW_1,
  input  [31:0] io_RowInNW_2,
  input  [31:0] io_RowInNW_3,
  input  [31:0] io_RowInSE_0,
  input  [31:0] io_RowInSE_1,
  input  [31:0] io_RowInSE_2,
  input  [31:0] io_RowInSW_1,
  input  [31:0] io_RowInSW_2,
  input  [31:0] io_RowInSW_3,
  output [31:0] io_RowOutLeft,
  output [31:0] io_RowOutUp_0,
  output [31:0] io_RowOutUp_1,
  output [31:0] io_RowOutUp_2,
  output [31:0] io_RowOutUp_3,
  output [31:0] io_RowOutDown_0,
  output [31:0] io_RowOutDown_1,
  output [31:0] io_RowOutDown_2,
  output [31:0] io_RowOutDown_3,
  output [31:0] io_RowOutNE_0,
  output [31:0] io_RowOutNE_1,
  output [31:0] io_RowOutNE_2,
  output [31:0] io_RowOutNW_1,
  output [31:0] io_RowOutNW_2,
  output [31:0] io_RowOutNW_3,
  output [31:0] io_RowOutSE_0,
  output [31:0] io_RowOutSE_1,
  output [31:0] io_RowOutSE_2,
  output [31:0] io_RowOutSW_1,
  output [31:0] io_RowOutSW_2,
  output [31:0] io_RowOutSW_3
);
  wire  PE_king_mesh_clk; // @[PErow.scala 78:42]
  wire  PE_king_mesh_rst; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_din_SW; // @[PErow.scala 78:42]
  wire [23:0] PE_king_mesh_configuration; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_dout_SW; // @[PErow.scala 78:42]
  wire  PE_king_mesh_1_clk; // @[PErow.scala 78:42]
  wire  PE_king_mesh_1_rst; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_din_SW; // @[PErow.scala 78:42]
  wire [23:0] PE_king_mesh_1_configuration; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_1_dout_SW; // @[PErow.scala 78:42]
  wire  PE_king_mesh_2_clk; // @[PErow.scala 78:42]
  wire  PE_king_mesh_2_rst; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_din_SW; // @[PErow.scala 78:42]
  wire [23:0] PE_king_mesh_2_configuration; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_2_dout_SW; // @[PErow.scala 78:42]
  wire  PE_king_mesh_3_clk; // @[PErow.scala 78:42]
  wire  PE_king_mesh_3_rst; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_din_SW; // @[PErow.scala 78:42]
  wire [23:0] PE_king_mesh_3_configuration; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_up; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_down; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_left; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_right; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_NE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_NW; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_SE; // @[PErow.scala 78:42]
  wire [31:0] PE_king_mesh_3_dout_SW; // @[PErow.scala 78:42]
  PE_king_mesh PE_king_mesh ( // @[PErow.scala 78:42]
    .clk(PE_king_mesh_clk),
    .rst(PE_king_mesh_rst),
    .din_up(PE_king_mesh_din_up),
    .din_down(PE_king_mesh_din_down),
    .din_left(PE_king_mesh_din_left),
    .din_right(PE_king_mesh_din_right),
    .din_NE(PE_king_mesh_din_NE),
    .din_NW(PE_king_mesh_din_NW),
    .din_SE(PE_king_mesh_din_SE),
    .din_SW(PE_king_mesh_din_SW),
    .configuration(PE_king_mesh_configuration),
    .dout_up(PE_king_mesh_dout_up),
    .dout_down(PE_king_mesh_dout_down),
    .dout_left(PE_king_mesh_dout_left),
    .dout_right(PE_king_mesh_dout_right),
    .dout_NE(PE_king_mesh_dout_NE),
    .dout_NW(PE_king_mesh_dout_NW),
    .dout_SE(PE_king_mesh_dout_SE),
    .dout_SW(PE_king_mesh_dout_SW)
  );
  PE_king_mesh PE_king_mesh_1 ( // @[PErow.scala 78:42]
    .clk(PE_king_mesh_1_clk),
    .rst(PE_king_mesh_1_rst),
    .din_up(PE_king_mesh_1_din_up),
    .din_down(PE_king_mesh_1_din_down),
    .din_left(PE_king_mesh_1_din_left),
    .din_right(PE_king_mesh_1_din_right),
    .din_NE(PE_king_mesh_1_din_NE),
    .din_NW(PE_king_mesh_1_din_NW),
    .din_SE(PE_king_mesh_1_din_SE),
    .din_SW(PE_king_mesh_1_din_SW),
    .configuration(PE_king_mesh_1_configuration),
    .dout_up(PE_king_mesh_1_dout_up),
    .dout_down(PE_king_mesh_1_dout_down),
    .dout_left(PE_king_mesh_1_dout_left),
    .dout_right(PE_king_mesh_1_dout_right),
    .dout_NE(PE_king_mesh_1_dout_NE),
    .dout_NW(PE_king_mesh_1_dout_NW),
    .dout_SE(PE_king_mesh_1_dout_SE),
    .dout_SW(PE_king_mesh_1_dout_SW)
  );
  PE_king_mesh PE_king_mesh_2 ( // @[PErow.scala 78:42]
    .clk(PE_king_mesh_2_clk),
    .rst(PE_king_mesh_2_rst),
    .din_up(PE_king_mesh_2_din_up),
    .din_down(PE_king_mesh_2_din_down),
    .din_left(PE_king_mesh_2_din_left),
    .din_right(PE_king_mesh_2_din_right),
    .din_NE(PE_king_mesh_2_din_NE),
    .din_NW(PE_king_mesh_2_din_NW),
    .din_SE(PE_king_mesh_2_din_SE),
    .din_SW(PE_king_mesh_2_din_SW),
    .configuration(PE_king_mesh_2_configuration),
    .dout_up(PE_king_mesh_2_dout_up),
    .dout_down(PE_king_mesh_2_dout_down),
    .dout_left(PE_king_mesh_2_dout_left),
    .dout_right(PE_king_mesh_2_dout_right),
    .dout_NE(PE_king_mesh_2_dout_NE),
    .dout_NW(PE_king_mesh_2_dout_NW),
    .dout_SE(PE_king_mesh_2_dout_SE),
    .dout_SW(PE_king_mesh_2_dout_SW)
  );
  PE_king_mesh PE_king_mesh_3 ( // @[PErow.scala 78:42]
    .clk(PE_king_mesh_3_clk),
    .rst(PE_king_mesh_3_rst),
    .din_up(PE_king_mesh_3_din_up),
    .din_down(PE_king_mesh_3_din_down),
    .din_left(PE_king_mesh_3_din_left),
    .din_right(PE_king_mesh_3_din_right),
    .din_NE(PE_king_mesh_3_din_NE),
    .din_NW(PE_king_mesh_3_din_NW),
    .din_SE(PE_king_mesh_3_din_SE),
    .din_SW(PE_king_mesh_3_din_SW),
    .configuration(PE_king_mesh_3_configuration),
    .dout_up(PE_king_mesh_3_dout_up),
    .dout_down(PE_king_mesh_3_dout_down),
    .dout_left(PE_king_mesh_3_dout_left),
    .dout_right(PE_king_mesh_3_dout_right),
    .dout_NE(PE_king_mesh_3_dout_NE),
    .dout_NW(PE_king_mesh_3_dout_NW),
    .dout_SE(PE_king_mesh_3_dout_SE),
    .dout_SW(PE_king_mesh_3_dout_SW)
  );
  assign io_RowOutLeft = PE_king_mesh_dout_left; // @[PErow.scala 79:17]
  assign io_RowOutUp_0 = PE_king_mesh_dout_up; // @[PErow.scala 92:22]
  assign io_RowOutUp_1 = PE_king_mesh_1_dout_up; // @[PErow.scala 92:22]
  assign io_RowOutUp_2 = PE_king_mesh_2_dout_up; // @[PErow.scala 92:22]
  assign io_RowOutUp_3 = PE_king_mesh_3_dout_up; // @[PErow.scala 92:22]
  assign io_RowOutDown_0 = PE_king_mesh_dout_down; // @[PErow.scala 91:22]
  assign io_RowOutDown_1 = PE_king_mesh_1_dout_down; // @[PErow.scala 91:22]
  assign io_RowOutDown_2 = PE_king_mesh_2_dout_down; // @[PErow.scala 91:22]
  assign io_RowOutDown_3 = PE_king_mesh_3_dout_down; // @[PErow.scala 91:22]
  assign io_RowOutNE_0 = PE_king_mesh_dout_NE; // @[PErow.scala 93:22]
  assign io_RowOutNE_1 = PE_king_mesh_1_dout_NE; // @[PErow.scala 93:22]
  assign io_RowOutNE_2 = PE_king_mesh_2_dout_NE; // @[PErow.scala 93:22]
  assign io_RowOutNW_1 = PE_king_mesh_1_dout_NW; // @[PErow.scala 94:22]
  assign io_RowOutNW_2 = PE_king_mesh_2_dout_NW; // @[PErow.scala 94:22]
  assign io_RowOutNW_3 = PE_king_mesh_3_dout_NW; // @[PErow.scala 94:22]
  assign io_RowOutSE_0 = PE_king_mesh_dout_SE; // @[PErow.scala 95:22]
  assign io_RowOutSE_1 = PE_king_mesh_1_dout_SE; // @[PErow.scala 95:22]
  assign io_RowOutSE_2 = PE_king_mesh_2_dout_SE; // @[PErow.scala 95:22]
  assign io_RowOutSW_1 = PE_king_mesh_1_dout_SW; // @[PErow.scala 96:22]
  assign io_RowOutSW_2 = PE_king_mesh_2_dout_SW; // @[PErow.scala 96:22]
  assign io_RowOutSW_3 = PE_king_mesh_3_dout_SW; // @[PErow.scala 96:22]
  assign PE_king_mesh_clk = clock; // @[PErow.scala 82:19]
  assign PE_king_mesh_rst = reset; // @[PErow.scala 83:19]
  assign PE_king_mesh_din_up = io_RowInUp_0; // @[PErow.scala 85:22]
  assign PE_king_mesh_din_down = io_RowInDown_0; // @[PErow.scala 86:24]
  assign PE_king_mesh_din_left = io_RowInLeft; // @[PErow.scala 98:26]
  assign PE_king_mesh_din_right = PE_king_mesh_1_dout_left; // @[PErow.scala 108:27]
  assign PE_king_mesh_din_NE = io_RowInNE_0; // @[PErow.scala 87:22]
  assign PE_king_mesh_din_NW = 32'h0; // @[PErow.scala 88:22]
  assign PE_king_mesh_din_SE = io_RowInSE_0; // @[PErow.scala 89:22]
  assign PE_king_mesh_din_SW = 32'h0; // @[PErow.scala 90:22]
  assign PE_king_mesh_configuration = io_PErowConfig_0; // @[PErow.scala 84:29]
  assign PE_king_mesh_1_clk = clock; // @[PErow.scala 82:19]
  assign PE_king_mesh_1_rst = reset; // @[PErow.scala 83:19]
  assign PE_king_mesh_1_din_up = io_RowInUp_1; // @[PErow.scala 85:22]
  assign PE_king_mesh_1_din_down = io_RowInDown_1; // @[PErow.scala 86:24]
  assign PE_king_mesh_1_din_left = PE_king_mesh_dout_right; // @[PErow.scala 101:26]
  assign PE_king_mesh_1_din_right = PE_king_mesh_2_dout_left; // @[PErow.scala 108:27]
  assign PE_king_mesh_1_din_NE = io_RowInNE_1; // @[PErow.scala 87:22]
  assign PE_king_mesh_1_din_NW = io_RowInNW_1; // @[PErow.scala 88:22]
  assign PE_king_mesh_1_din_SE = io_RowInSE_1; // @[PErow.scala 89:22]
  assign PE_king_mesh_1_din_SW = io_RowInSW_1; // @[PErow.scala 90:22]
  assign PE_king_mesh_1_configuration = io_PErowConfig_1; // @[PErow.scala 84:29]
  assign PE_king_mesh_2_clk = clock; // @[PErow.scala 82:19]
  assign PE_king_mesh_2_rst = reset; // @[PErow.scala 83:19]
  assign PE_king_mesh_2_din_up = io_RowInUp_2; // @[PErow.scala 85:22]
  assign PE_king_mesh_2_din_down = io_RowInDown_2; // @[PErow.scala 86:24]
  assign PE_king_mesh_2_din_left = PE_king_mesh_1_dout_right; // @[PErow.scala 101:26]
  assign PE_king_mesh_2_din_right = PE_king_mesh_3_dout_left; // @[PErow.scala 108:27]
  assign PE_king_mesh_2_din_NE = io_RowInNE_2; // @[PErow.scala 87:22]
  assign PE_king_mesh_2_din_NW = io_RowInNW_2; // @[PErow.scala 88:22]
  assign PE_king_mesh_2_din_SE = io_RowInSE_2; // @[PErow.scala 89:22]
  assign PE_king_mesh_2_din_SW = io_RowInSW_2; // @[PErow.scala 90:22]
  assign PE_king_mesh_2_configuration = io_PErowConfig_2; // @[PErow.scala 84:29]
  assign PE_king_mesh_3_clk = clock; // @[PErow.scala 82:19]
  assign PE_king_mesh_3_rst = reset; // @[PErow.scala 83:19]
  assign PE_king_mesh_3_din_up = io_RowInUp_3; // @[PErow.scala 85:22]
  assign PE_king_mesh_3_din_down = io_RowInDown_3; // @[PErow.scala 86:24]
  assign PE_king_mesh_3_din_left = PE_king_mesh_2_dout_right; // @[PErow.scala 101:26]
  assign PE_king_mesh_3_din_right = 32'h0; // @[PErow.scala 105:27]
  assign PE_king_mesh_3_din_NE = 32'h0; // @[PErow.scala 87:22]
  assign PE_king_mesh_3_din_NW = io_RowInNW_3; // @[PErow.scala 88:22]
  assign PE_king_mesh_3_din_SE = 32'h0; // @[PErow.scala 89:22]
  assign PE_king_mesh_3_din_SW = io_RowInSW_3; // @[PErow.scala 90:22]
  assign PE_king_mesh_3_configuration = io_PErowConfig_3; // @[PErow.scala 84:29]
endmodule
module _4x4_king_mesh(
  input         clock,
  input         reset,
  input  [23:0] io_PErowConfig_0,
  input  [23:0] io_PErowConfig_1,
  input  [23:0] io_PErowConfig_2,
  input  [23:0] io_PErowConfig_3,
  input  [31:0] io_ArrayInLeft_0,
  input  [31:0] io_ArrayInLeft_1,
  input  [31:0] io_ArrayInLeft_2,
  input  [31:0] io_ArrayInLeft_3,
  output [31:0] io_ArrayOutLeft_0,
  output [31:0] io_ArrayOutLeft_1,
  output [31:0] io_ArrayOutLeft_2,
  output [31:0] io_ArrayOutLeft_3
);
  wire  KingMeshRow_clock; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_reset; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_io_PErowConfig_0; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_io_PErowConfig_1; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_io_PErowConfig_2; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_io_PErowConfig_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowInSW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_io_RowOutSW_3; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_1_clock; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_1_reset; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_1_io_PErowConfig_0; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_1_io_PErowConfig_1; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_1_io_PErowConfig_2; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_1_io_PErowConfig_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowInSW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_1_io_RowOutSW_3; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_2_clock; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_2_reset; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_2_io_PErowConfig_0; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_2_io_PErowConfig_1; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_2_io_PErowConfig_2; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_2_io_PErowConfig_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowInSW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_2_io_RowOutSW_3; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_3_clock; // @[_4x4_.scala 64:44]
  wire  KingMeshRow_3_reset; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_3_io_PErowConfig_0; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_3_io_PErowConfig_1; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_3_io_PErowConfig_2; // @[_4x4_.scala 64:44]
  wire [23:0] KingMeshRow_3_io_PErowConfig_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowInSW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutLeft; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutUp_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutUp_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutUp_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutUp_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutDown_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutDown_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutDown_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutDown_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutNW_3; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSE_0; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSE_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSE_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSW_1; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSW_2; // @[_4x4_.scala 64:44]
  wire [31:0] KingMeshRow_3_io_RowOutSW_3; // @[_4x4_.scala 64:44]
  KingMeshRow KingMeshRow ( // @[_4x4_.scala 64:44]
    .clock(KingMeshRow_clock),
    .reset(KingMeshRow_reset),
    .io_PErowConfig_0(KingMeshRow_io_PErowConfig_0),
    .io_PErowConfig_1(KingMeshRow_io_PErowConfig_1),
    .io_PErowConfig_2(KingMeshRow_io_PErowConfig_2),
    .io_PErowConfig_3(KingMeshRow_io_PErowConfig_3),
    .io_RowInLeft(KingMeshRow_io_RowInLeft),
    .io_RowInUp_0(KingMeshRow_io_RowInUp_0),
    .io_RowInUp_1(KingMeshRow_io_RowInUp_1),
    .io_RowInUp_2(KingMeshRow_io_RowInUp_2),
    .io_RowInUp_3(KingMeshRow_io_RowInUp_3),
    .io_RowInDown_0(KingMeshRow_io_RowInDown_0),
    .io_RowInDown_1(KingMeshRow_io_RowInDown_1),
    .io_RowInDown_2(KingMeshRow_io_RowInDown_2),
    .io_RowInDown_3(KingMeshRow_io_RowInDown_3),
    .io_RowInNE_0(KingMeshRow_io_RowInNE_0),
    .io_RowInNE_1(KingMeshRow_io_RowInNE_1),
    .io_RowInNE_2(KingMeshRow_io_RowInNE_2),
    .io_RowInNW_1(KingMeshRow_io_RowInNW_1),
    .io_RowInNW_2(KingMeshRow_io_RowInNW_2),
    .io_RowInNW_3(KingMeshRow_io_RowInNW_3),
    .io_RowInSE_0(KingMeshRow_io_RowInSE_0),
    .io_RowInSE_1(KingMeshRow_io_RowInSE_1),
    .io_RowInSE_2(KingMeshRow_io_RowInSE_2),
    .io_RowInSW_1(KingMeshRow_io_RowInSW_1),
    .io_RowInSW_2(KingMeshRow_io_RowInSW_2),
    .io_RowInSW_3(KingMeshRow_io_RowInSW_3),
    .io_RowOutLeft(KingMeshRow_io_RowOutLeft),
    .io_RowOutUp_0(KingMeshRow_io_RowOutUp_0),
    .io_RowOutUp_1(KingMeshRow_io_RowOutUp_1),
    .io_RowOutUp_2(KingMeshRow_io_RowOutUp_2),
    .io_RowOutUp_3(KingMeshRow_io_RowOutUp_3),
    .io_RowOutDown_0(KingMeshRow_io_RowOutDown_0),
    .io_RowOutDown_1(KingMeshRow_io_RowOutDown_1),
    .io_RowOutDown_2(KingMeshRow_io_RowOutDown_2),
    .io_RowOutDown_3(KingMeshRow_io_RowOutDown_3),
    .io_RowOutNE_0(KingMeshRow_io_RowOutNE_0),
    .io_RowOutNE_1(KingMeshRow_io_RowOutNE_1),
    .io_RowOutNE_2(KingMeshRow_io_RowOutNE_2),
    .io_RowOutNW_1(KingMeshRow_io_RowOutNW_1),
    .io_RowOutNW_2(KingMeshRow_io_RowOutNW_2),
    .io_RowOutNW_3(KingMeshRow_io_RowOutNW_3),
    .io_RowOutSE_0(KingMeshRow_io_RowOutSE_0),
    .io_RowOutSE_1(KingMeshRow_io_RowOutSE_1),
    .io_RowOutSE_2(KingMeshRow_io_RowOutSE_2),
    .io_RowOutSW_1(KingMeshRow_io_RowOutSW_1),
    .io_RowOutSW_2(KingMeshRow_io_RowOutSW_2),
    .io_RowOutSW_3(KingMeshRow_io_RowOutSW_3)
  );
  KingMeshRow KingMeshRow_1 ( // @[_4x4_.scala 64:44]
    .clock(KingMeshRow_1_clock),
    .reset(KingMeshRow_1_reset),
    .io_PErowConfig_0(KingMeshRow_1_io_PErowConfig_0),
    .io_PErowConfig_1(KingMeshRow_1_io_PErowConfig_1),
    .io_PErowConfig_2(KingMeshRow_1_io_PErowConfig_2),
    .io_PErowConfig_3(KingMeshRow_1_io_PErowConfig_3),
    .io_RowInLeft(KingMeshRow_1_io_RowInLeft),
    .io_RowInUp_0(KingMeshRow_1_io_RowInUp_0),
    .io_RowInUp_1(KingMeshRow_1_io_RowInUp_1),
    .io_RowInUp_2(KingMeshRow_1_io_RowInUp_2),
    .io_RowInUp_3(KingMeshRow_1_io_RowInUp_3),
    .io_RowInDown_0(KingMeshRow_1_io_RowInDown_0),
    .io_RowInDown_1(KingMeshRow_1_io_RowInDown_1),
    .io_RowInDown_2(KingMeshRow_1_io_RowInDown_2),
    .io_RowInDown_3(KingMeshRow_1_io_RowInDown_3),
    .io_RowInNE_0(KingMeshRow_1_io_RowInNE_0),
    .io_RowInNE_1(KingMeshRow_1_io_RowInNE_1),
    .io_RowInNE_2(KingMeshRow_1_io_RowInNE_2),
    .io_RowInNW_1(KingMeshRow_1_io_RowInNW_1),
    .io_RowInNW_2(KingMeshRow_1_io_RowInNW_2),
    .io_RowInNW_3(KingMeshRow_1_io_RowInNW_3),
    .io_RowInSE_0(KingMeshRow_1_io_RowInSE_0),
    .io_RowInSE_1(KingMeshRow_1_io_RowInSE_1),
    .io_RowInSE_2(KingMeshRow_1_io_RowInSE_2),
    .io_RowInSW_1(KingMeshRow_1_io_RowInSW_1),
    .io_RowInSW_2(KingMeshRow_1_io_RowInSW_2),
    .io_RowInSW_3(KingMeshRow_1_io_RowInSW_3),
    .io_RowOutLeft(KingMeshRow_1_io_RowOutLeft),
    .io_RowOutUp_0(KingMeshRow_1_io_RowOutUp_0),
    .io_RowOutUp_1(KingMeshRow_1_io_RowOutUp_1),
    .io_RowOutUp_2(KingMeshRow_1_io_RowOutUp_2),
    .io_RowOutUp_3(KingMeshRow_1_io_RowOutUp_3),
    .io_RowOutDown_0(KingMeshRow_1_io_RowOutDown_0),
    .io_RowOutDown_1(KingMeshRow_1_io_RowOutDown_1),
    .io_RowOutDown_2(KingMeshRow_1_io_RowOutDown_2),
    .io_RowOutDown_3(KingMeshRow_1_io_RowOutDown_3),
    .io_RowOutNE_0(KingMeshRow_1_io_RowOutNE_0),
    .io_RowOutNE_1(KingMeshRow_1_io_RowOutNE_1),
    .io_RowOutNE_2(KingMeshRow_1_io_RowOutNE_2),
    .io_RowOutNW_1(KingMeshRow_1_io_RowOutNW_1),
    .io_RowOutNW_2(KingMeshRow_1_io_RowOutNW_2),
    .io_RowOutNW_3(KingMeshRow_1_io_RowOutNW_3),
    .io_RowOutSE_0(KingMeshRow_1_io_RowOutSE_0),
    .io_RowOutSE_1(KingMeshRow_1_io_RowOutSE_1),
    .io_RowOutSE_2(KingMeshRow_1_io_RowOutSE_2),
    .io_RowOutSW_1(KingMeshRow_1_io_RowOutSW_1),
    .io_RowOutSW_2(KingMeshRow_1_io_RowOutSW_2),
    .io_RowOutSW_3(KingMeshRow_1_io_RowOutSW_3)
  );
  KingMeshRow KingMeshRow_2 ( // @[_4x4_.scala 64:44]
    .clock(KingMeshRow_2_clock),
    .reset(KingMeshRow_2_reset),
    .io_PErowConfig_0(KingMeshRow_2_io_PErowConfig_0),
    .io_PErowConfig_1(KingMeshRow_2_io_PErowConfig_1),
    .io_PErowConfig_2(KingMeshRow_2_io_PErowConfig_2),
    .io_PErowConfig_3(KingMeshRow_2_io_PErowConfig_3),
    .io_RowInLeft(KingMeshRow_2_io_RowInLeft),
    .io_RowInUp_0(KingMeshRow_2_io_RowInUp_0),
    .io_RowInUp_1(KingMeshRow_2_io_RowInUp_1),
    .io_RowInUp_2(KingMeshRow_2_io_RowInUp_2),
    .io_RowInUp_3(KingMeshRow_2_io_RowInUp_3),
    .io_RowInDown_0(KingMeshRow_2_io_RowInDown_0),
    .io_RowInDown_1(KingMeshRow_2_io_RowInDown_1),
    .io_RowInDown_2(KingMeshRow_2_io_RowInDown_2),
    .io_RowInDown_3(KingMeshRow_2_io_RowInDown_3),
    .io_RowInNE_0(KingMeshRow_2_io_RowInNE_0),
    .io_RowInNE_1(KingMeshRow_2_io_RowInNE_1),
    .io_RowInNE_2(KingMeshRow_2_io_RowInNE_2),
    .io_RowInNW_1(KingMeshRow_2_io_RowInNW_1),
    .io_RowInNW_2(KingMeshRow_2_io_RowInNW_2),
    .io_RowInNW_3(KingMeshRow_2_io_RowInNW_3),
    .io_RowInSE_0(KingMeshRow_2_io_RowInSE_0),
    .io_RowInSE_1(KingMeshRow_2_io_RowInSE_1),
    .io_RowInSE_2(KingMeshRow_2_io_RowInSE_2),
    .io_RowInSW_1(KingMeshRow_2_io_RowInSW_1),
    .io_RowInSW_2(KingMeshRow_2_io_RowInSW_2),
    .io_RowInSW_3(KingMeshRow_2_io_RowInSW_3),
    .io_RowOutLeft(KingMeshRow_2_io_RowOutLeft),
    .io_RowOutUp_0(KingMeshRow_2_io_RowOutUp_0),
    .io_RowOutUp_1(KingMeshRow_2_io_RowOutUp_1),
    .io_RowOutUp_2(KingMeshRow_2_io_RowOutUp_2),
    .io_RowOutUp_3(KingMeshRow_2_io_RowOutUp_3),
    .io_RowOutDown_0(KingMeshRow_2_io_RowOutDown_0),
    .io_RowOutDown_1(KingMeshRow_2_io_RowOutDown_1),
    .io_RowOutDown_2(KingMeshRow_2_io_RowOutDown_2),
    .io_RowOutDown_3(KingMeshRow_2_io_RowOutDown_3),
    .io_RowOutNE_0(KingMeshRow_2_io_RowOutNE_0),
    .io_RowOutNE_1(KingMeshRow_2_io_RowOutNE_1),
    .io_RowOutNE_2(KingMeshRow_2_io_RowOutNE_2),
    .io_RowOutNW_1(KingMeshRow_2_io_RowOutNW_1),
    .io_RowOutNW_2(KingMeshRow_2_io_RowOutNW_2),
    .io_RowOutNW_3(KingMeshRow_2_io_RowOutNW_3),
    .io_RowOutSE_0(KingMeshRow_2_io_RowOutSE_0),
    .io_RowOutSE_1(KingMeshRow_2_io_RowOutSE_1),
    .io_RowOutSE_2(KingMeshRow_2_io_RowOutSE_2),
    .io_RowOutSW_1(KingMeshRow_2_io_RowOutSW_1),
    .io_RowOutSW_2(KingMeshRow_2_io_RowOutSW_2),
    .io_RowOutSW_3(KingMeshRow_2_io_RowOutSW_3)
  );
  KingMeshRow KingMeshRow_3 ( // @[_4x4_.scala 64:44]
    .clock(KingMeshRow_3_clock),
    .reset(KingMeshRow_3_reset),
    .io_PErowConfig_0(KingMeshRow_3_io_PErowConfig_0),
    .io_PErowConfig_1(KingMeshRow_3_io_PErowConfig_1),
    .io_PErowConfig_2(KingMeshRow_3_io_PErowConfig_2),
    .io_PErowConfig_3(KingMeshRow_3_io_PErowConfig_3),
    .io_RowInLeft(KingMeshRow_3_io_RowInLeft),
    .io_RowInUp_0(KingMeshRow_3_io_RowInUp_0),
    .io_RowInUp_1(KingMeshRow_3_io_RowInUp_1),
    .io_RowInUp_2(KingMeshRow_3_io_RowInUp_2),
    .io_RowInUp_3(KingMeshRow_3_io_RowInUp_3),
    .io_RowInDown_0(KingMeshRow_3_io_RowInDown_0),
    .io_RowInDown_1(KingMeshRow_3_io_RowInDown_1),
    .io_RowInDown_2(KingMeshRow_3_io_RowInDown_2),
    .io_RowInDown_3(KingMeshRow_3_io_RowInDown_3),
    .io_RowInNE_0(KingMeshRow_3_io_RowInNE_0),
    .io_RowInNE_1(KingMeshRow_3_io_RowInNE_1),
    .io_RowInNE_2(KingMeshRow_3_io_RowInNE_2),
    .io_RowInNW_1(KingMeshRow_3_io_RowInNW_1),
    .io_RowInNW_2(KingMeshRow_3_io_RowInNW_2),
    .io_RowInNW_3(KingMeshRow_3_io_RowInNW_3),
    .io_RowInSE_0(KingMeshRow_3_io_RowInSE_0),
    .io_RowInSE_1(KingMeshRow_3_io_RowInSE_1),
    .io_RowInSE_2(KingMeshRow_3_io_RowInSE_2),
    .io_RowInSW_1(KingMeshRow_3_io_RowInSW_1),
    .io_RowInSW_2(KingMeshRow_3_io_RowInSW_2),
    .io_RowInSW_3(KingMeshRow_3_io_RowInSW_3),
    .io_RowOutLeft(KingMeshRow_3_io_RowOutLeft),
    .io_RowOutUp_0(KingMeshRow_3_io_RowOutUp_0),
    .io_RowOutUp_1(KingMeshRow_3_io_RowOutUp_1),
    .io_RowOutUp_2(KingMeshRow_3_io_RowOutUp_2),
    .io_RowOutUp_3(KingMeshRow_3_io_RowOutUp_3),
    .io_RowOutDown_0(KingMeshRow_3_io_RowOutDown_0),
    .io_RowOutDown_1(KingMeshRow_3_io_RowOutDown_1),
    .io_RowOutDown_2(KingMeshRow_3_io_RowOutDown_2),
    .io_RowOutDown_3(KingMeshRow_3_io_RowOutDown_3),
    .io_RowOutNE_0(KingMeshRow_3_io_RowOutNE_0),
    .io_RowOutNE_1(KingMeshRow_3_io_RowOutNE_1),
    .io_RowOutNE_2(KingMeshRow_3_io_RowOutNE_2),
    .io_RowOutNW_1(KingMeshRow_3_io_RowOutNW_1),
    .io_RowOutNW_2(KingMeshRow_3_io_RowOutNW_2),
    .io_RowOutNW_3(KingMeshRow_3_io_RowOutNW_3),
    .io_RowOutSE_0(KingMeshRow_3_io_RowOutSE_0),
    .io_RowOutSE_1(KingMeshRow_3_io_RowOutSE_1),
    .io_RowOutSE_2(KingMeshRow_3_io_RowOutSE_2),
    .io_RowOutSW_1(KingMeshRow_3_io_RowOutSW_1),
    .io_RowOutSW_2(KingMeshRow_3_io_RowOutSW_2),
    .io_RowOutSW_3(KingMeshRow_3_io_RowOutSW_3)
  );
  assign io_ArrayOutLeft_0 = KingMeshRow_io_RowOutLeft; // @[_4x4_.scala 69:24]
  assign io_ArrayOutLeft_1 = KingMeshRow_1_io_RowOutLeft; // @[_4x4_.scala 69:24]
  assign io_ArrayOutLeft_2 = KingMeshRow_2_io_RowOutLeft; // @[_4x4_.scala 69:24]
  assign io_ArrayOutLeft_3 = KingMeshRow_3_io_RowOutLeft; // @[_4x4_.scala 69:24]
  assign KingMeshRow_clock = clock;
  assign KingMeshRow_reset = reset;
  assign KingMeshRow_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 68:31]
  assign KingMeshRow_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 68:31]
  assign KingMeshRow_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 68:31]
  assign KingMeshRow_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 68:31]
  assign KingMeshRow_io_RowInLeft = io_ArrayInLeft_0; // @[_4x4_.scala 66:29]
  assign KingMeshRow_io_RowInUp_0 = 32'h0; // @[_4x4_.scala 71:{55,55}]
  assign KingMeshRow_io_RowInUp_1 = 32'h0; // @[_4x4_.scala 71:{55,55}]
  assign KingMeshRow_io_RowInUp_2 = 32'h0; // @[_4x4_.scala 71:{55,55}]
  assign KingMeshRow_io_RowInUp_3 = 32'h0; // @[_4x4_.scala 71:{55,55}]
  assign KingMeshRow_io_RowInDown_0 = KingMeshRow_1_io_RowOutUp_0; // @[_4x4_.scala 94:31]
  assign KingMeshRow_io_RowInDown_1 = KingMeshRow_1_io_RowOutUp_1; // @[_4x4_.scala 94:31]
  assign KingMeshRow_io_RowInDown_2 = KingMeshRow_1_io_RowOutUp_2; // @[_4x4_.scala 94:31]
  assign KingMeshRow_io_RowInDown_3 = KingMeshRow_1_io_RowOutUp_3; // @[_4x4_.scala 94:31]
  assign KingMeshRow_io_RowInNE_0 = 32'h0; // @[_4x4_.scala 72:{55,55}]
  assign KingMeshRow_io_RowInNE_1 = 32'h0; // @[_4x4_.scala 72:{55,55}]
  assign KingMeshRow_io_RowInNE_2 = 32'h0; // @[_4x4_.scala 72:{55,55}]
  assign KingMeshRow_io_RowInNW_1 = 32'h0; // @[_4x4_.scala 73:{55,55}]
  assign KingMeshRow_io_RowInNW_2 = 32'h0; // @[_4x4_.scala 73:{55,55}]
  assign KingMeshRow_io_RowInNW_3 = 32'h0; // @[_4x4_.scala 73:{55,55}]
  assign KingMeshRow_io_RowInSE_0 = KingMeshRow_1_io_RowOutNW_1; // @[_4x4_.scala 103:32]
  assign KingMeshRow_io_RowInSE_1 = KingMeshRow_1_io_RowOutNW_2; // @[_4x4_.scala 102:32]
  assign KingMeshRow_io_RowInSE_2 = KingMeshRow_1_io_RowOutNW_3; // @[_4x4_.scala 101:32]
  assign KingMeshRow_io_RowInSW_1 = KingMeshRow_1_io_RowOutNE_0; // @[_4x4_.scala 96:32]
  assign KingMeshRow_io_RowInSW_2 = KingMeshRow_1_io_RowOutNE_1; // @[_4x4_.scala 97:32]
  assign KingMeshRow_io_RowInSW_3 = KingMeshRow_1_io_RowOutNE_2; // @[_4x4_.scala 98:32]
  assign KingMeshRow_1_clock = clock;
  assign KingMeshRow_1_reset = reset;
  assign KingMeshRow_1_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 68:31]
  assign KingMeshRow_1_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 68:31]
  assign KingMeshRow_1_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 68:31]
  assign KingMeshRow_1_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 68:31]
  assign KingMeshRow_1_io_RowInLeft = io_ArrayInLeft_1; // @[_4x4_.scala 66:29]
  assign KingMeshRow_1_io_RowInUp_0 = KingMeshRow_io_RowOutDown_0; // @[_4x4_.scala 76:29]
  assign KingMeshRow_1_io_RowInUp_1 = KingMeshRow_io_RowOutDown_1; // @[_4x4_.scala 76:29]
  assign KingMeshRow_1_io_RowInUp_2 = KingMeshRow_io_RowOutDown_2; // @[_4x4_.scala 76:29]
  assign KingMeshRow_1_io_RowInUp_3 = KingMeshRow_io_RowOutDown_3; // @[_4x4_.scala 76:29]
  assign KingMeshRow_1_io_RowInDown_0 = KingMeshRow_2_io_RowOutUp_0; // @[_4x4_.scala 94:31]
  assign KingMeshRow_1_io_RowInDown_1 = KingMeshRow_2_io_RowOutUp_1; // @[_4x4_.scala 94:31]
  assign KingMeshRow_1_io_RowInDown_2 = KingMeshRow_2_io_RowOutUp_2; // @[_4x4_.scala 94:31]
  assign KingMeshRow_1_io_RowInDown_3 = KingMeshRow_2_io_RowOutUp_3; // @[_4x4_.scala 94:31]
  assign KingMeshRow_1_io_RowInNE_0 = KingMeshRow_1_io_RowOutSW_1; // @[_4x4_.scala 85:32]
  assign KingMeshRow_1_io_RowInNE_1 = KingMeshRow_1_io_RowOutSW_2; // @[_4x4_.scala 84:32]
  assign KingMeshRow_1_io_RowInNE_2 = KingMeshRow_1_io_RowOutSW_3; // @[_4x4_.scala 83:32]
  assign KingMeshRow_1_io_RowInNW_1 = KingMeshRow_1_io_RowOutSE_0; // @[_4x4_.scala 78:32]
  assign KingMeshRow_1_io_RowInNW_2 = KingMeshRow_1_io_RowOutSE_1; // @[_4x4_.scala 79:32]
  assign KingMeshRow_1_io_RowInNW_3 = KingMeshRow_1_io_RowOutSE_2; // @[_4x4_.scala 80:32]
  assign KingMeshRow_1_io_RowInSE_0 = KingMeshRow_2_io_RowOutNW_1; // @[_4x4_.scala 103:32]
  assign KingMeshRow_1_io_RowInSE_1 = KingMeshRow_2_io_RowOutNW_2; // @[_4x4_.scala 102:32]
  assign KingMeshRow_1_io_RowInSE_2 = KingMeshRow_2_io_RowOutNW_3; // @[_4x4_.scala 101:32]
  assign KingMeshRow_1_io_RowInSW_1 = KingMeshRow_2_io_RowOutNE_0; // @[_4x4_.scala 96:32]
  assign KingMeshRow_1_io_RowInSW_2 = KingMeshRow_2_io_RowOutNE_1; // @[_4x4_.scala 97:32]
  assign KingMeshRow_1_io_RowInSW_3 = KingMeshRow_2_io_RowOutNE_2; // @[_4x4_.scala 98:32]
  assign KingMeshRow_2_clock = clock;
  assign KingMeshRow_2_reset = reset;
  assign KingMeshRow_2_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 68:31]
  assign KingMeshRow_2_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 68:31]
  assign KingMeshRow_2_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 68:31]
  assign KingMeshRow_2_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 68:31]
  assign KingMeshRow_2_io_RowInLeft = io_ArrayInLeft_2; // @[_4x4_.scala 66:29]
  assign KingMeshRow_2_io_RowInUp_0 = KingMeshRow_1_io_RowOutDown_0; // @[_4x4_.scala 76:29]
  assign KingMeshRow_2_io_RowInUp_1 = KingMeshRow_1_io_RowOutDown_1; // @[_4x4_.scala 76:29]
  assign KingMeshRow_2_io_RowInUp_2 = KingMeshRow_1_io_RowOutDown_2; // @[_4x4_.scala 76:29]
  assign KingMeshRow_2_io_RowInUp_3 = KingMeshRow_1_io_RowOutDown_3; // @[_4x4_.scala 76:29]
  assign KingMeshRow_2_io_RowInDown_0 = KingMeshRow_3_io_RowOutUp_0; // @[_4x4_.scala 94:31]
  assign KingMeshRow_2_io_RowInDown_1 = KingMeshRow_3_io_RowOutUp_1; // @[_4x4_.scala 94:31]
  assign KingMeshRow_2_io_RowInDown_2 = KingMeshRow_3_io_RowOutUp_2; // @[_4x4_.scala 94:31]
  assign KingMeshRow_2_io_RowInDown_3 = KingMeshRow_3_io_RowOutUp_3; // @[_4x4_.scala 94:31]
  assign KingMeshRow_2_io_RowInNE_0 = KingMeshRow_2_io_RowOutSW_1; // @[_4x4_.scala 85:32]
  assign KingMeshRow_2_io_RowInNE_1 = KingMeshRow_2_io_RowOutSW_2; // @[_4x4_.scala 84:32]
  assign KingMeshRow_2_io_RowInNE_2 = KingMeshRow_2_io_RowOutSW_3; // @[_4x4_.scala 83:32]
  assign KingMeshRow_2_io_RowInNW_1 = KingMeshRow_2_io_RowOutSE_0; // @[_4x4_.scala 78:32]
  assign KingMeshRow_2_io_RowInNW_2 = KingMeshRow_2_io_RowOutSE_1; // @[_4x4_.scala 79:32]
  assign KingMeshRow_2_io_RowInNW_3 = KingMeshRow_2_io_RowOutSE_2; // @[_4x4_.scala 80:32]
  assign KingMeshRow_2_io_RowInSE_0 = KingMeshRow_3_io_RowOutNW_1; // @[_4x4_.scala 103:32]
  assign KingMeshRow_2_io_RowInSE_1 = KingMeshRow_3_io_RowOutNW_2; // @[_4x4_.scala 102:32]
  assign KingMeshRow_2_io_RowInSE_2 = KingMeshRow_3_io_RowOutNW_3; // @[_4x4_.scala 101:32]
  assign KingMeshRow_2_io_RowInSW_1 = KingMeshRow_3_io_RowOutNE_0; // @[_4x4_.scala 96:32]
  assign KingMeshRow_2_io_RowInSW_2 = KingMeshRow_3_io_RowOutNE_1; // @[_4x4_.scala 97:32]
  assign KingMeshRow_2_io_RowInSW_3 = KingMeshRow_3_io_RowOutNE_2; // @[_4x4_.scala 98:32]
  assign KingMeshRow_3_clock = clock;
  assign KingMeshRow_3_reset = reset;
  assign KingMeshRow_3_io_PErowConfig_0 = io_PErowConfig_0; // @[_4x4_.scala 68:31]
  assign KingMeshRow_3_io_PErowConfig_1 = io_PErowConfig_1; // @[_4x4_.scala 68:31]
  assign KingMeshRow_3_io_PErowConfig_2 = io_PErowConfig_2; // @[_4x4_.scala 68:31]
  assign KingMeshRow_3_io_PErowConfig_3 = io_PErowConfig_3; // @[_4x4_.scala 68:31]
  assign KingMeshRow_3_io_RowInLeft = io_ArrayInLeft_3; // @[_4x4_.scala 66:29]
  assign KingMeshRow_3_io_RowInUp_0 = KingMeshRow_2_io_RowOutDown_0; // @[_4x4_.scala 76:29]
  assign KingMeshRow_3_io_RowInUp_1 = KingMeshRow_2_io_RowOutDown_1; // @[_4x4_.scala 76:29]
  assign KingMeshRow_3_io_RowInUp_2 = KingMeshRow_2_io_RowOutDown_2; // @[_4x4_.scala 76:29]
  assign KingMeshRow_3_io_RowInUp_3 = KingMeshRow_2_io_RowOutDown_3; // @[_4x4_.scala 76:29]
  assign KingMeshRow_3_io_RowInDown_0 = 32'h0; // @[_4x4_.scala 89:{57,57}]
  assign KingMeshRow_3_io_RowInDown_1 = 32'h0; // @[_4x4_.scala 89:{57,57}]
  assign KingMeshRow_3_io_RowInDown_2 = 32'h0; // @[_4x4_.scala 89:{57,57}]
  assign KingMeshRow_3_io_RowInDown_3 = 32'h0; // @[_4x4_.scala 89:{57,57}]
  assign KingMeshRow_3_io_RowInNE_0 = KingMeshRow_3_io_RowOutSW_1; // @[_4x4_.scala 85:32]
  assign KingMeshRow_3_io_RowInNE_1 = KingMeshRow_3_io_RowOutSW_2; // @[_4x4_.scala 84:32]
  assign KingMeshRow_3_io_RowInNE_2 = KingMeshRow_3_io_RowOutSW_3; // @[_4x4_.scala 83:32]
  assign KingMeshRow_3_io_RowInNW_1 = KingMeshRow_3_io_RowOutSE_0; // @[_4x4_.scala 78:32]
  assign KingMeshRow_3_io_RowInNW_2 = KingMeshRow_3_io_RowOutSE_1; // @[_4x4_.scala 79:32]
  assign KingMeshRow_3_io_RowInNW_3 = KingMeshRow_3_io_RowOutSE_2; // @[_4x4_.scala 80:32]
  assign KingMeshRow_3_io_RowInSE_0 = 32'h0; // @[_4x4_.scala 90:{55,55}]
  assign KingMeshRow_3_io_RowInSE_1 = 32'h0; // @[_4x4_.scala 90:{55,55}]
  assign KingMeshRow_3_io_RowInSE_2 = 32'h0; // @[_4x4_.scala 90:{55,55}]
  assign KingMeshRow_3_io_RowInSW_1 = 32'h0; // @[_4x4_.scala 91:{55,55}]
  assign KingMeshRow_3_io_RowInSW_2 = 32'h0; // @[_4x4_.scala 91:{55,55}]
  assign KingMeshRow_3_io_RowInSW_3 = 32'h0; // @[_4x4_.scala 91:{55,55}]
endmodule
