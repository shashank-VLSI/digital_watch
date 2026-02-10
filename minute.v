`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 22:08:37
// Design Name: 
// Module Name: minute
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


module minute(
    input clk,
    input rst,
    input [5:0] second,
    input mode,
    input change_minute,
    input valid_response,
    output reg [5:0] minute
);

reg [5:0] second_prev;

always @(posedge clk)
begin
    second_prev <= second;   // store previous value

    if (rst) begin
        minute <= 0;
    end

    // Manual mode
    else if (mode && change_minute && valid_response) begin
        if (minute == 59)
            minute <= 0;
        else
            minute <= minute + 1;
    end

    // Auto mode: detect second rollover
    else if (second_prev == 59 && second == 0) begin
        if (minute == 59)
            minute <= 0;
        else
            minute <= minute + 1;
    end
end

endmodule

