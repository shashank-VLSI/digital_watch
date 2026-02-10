`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 22:30:13
// Design Name: 
// Module Name: stop_watch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// mode 0 is for editing mode 1 is for watch

module stop_watch(clk,rst,mode,out,button,in);
input clk,rst,mode,button;
input [1:0] in;
output [5:0] out;

wire [5:0] sec,min,hr;

wire valid_response;
wire change_second,change_minute,change_hour;

sec A(
 clk,
 rst,
 mode,
 change_second,
 valid_response,
 sec
);

minute B(
 clk,
 rst,
 sec,
 mode,
 change_minute,
 valid_response,
 min
);

hr C(
 clk,
 rst,
 min,
 mode,
 change_hour,
 valid_response,
 hr
);

button_control D(clk, rst, button, valid_response);

mode E(
 mode,
 in,
 sec, min, hr,
 change_second,
 change_minute,
 change_hour,
 out
);
endmodule
