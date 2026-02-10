`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 22:24:45
// Design Name: 
// Module Name: hr
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


module hr(
    input clk,
    input rst,
    input [5:0] min,
    input mode,
    input change_hour,
    input valid_response,
    output reg [5:0] hour
);

reg [5:0] min_prev;

always @(posedge clk)
begin
    min_prev <= min;   // store previous minute

    if (rst) begin
        hour <= 0;
    end

    // Manual mode
    else if (mode && change_hour && valid_response) begin
        if (hour == 23)
            hour <= 0;
        else
            hour <= hour + 1;
    end

    // Auto mode: minute rollover
    else if (min_prev == 59 && min == 0) begin
        if (hour == 23)
            hour <= 0;
        else
            hour <= hour + 1;
    end
end

endmodule

