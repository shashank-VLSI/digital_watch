`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 16:15:58
// Design Name: 
// Module Name: mode
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

// mode-----> 0 means clock mode 1 means edit mode

module mode(
    input mode,
    input [1:0] in,
    input [5:0] sec, min, hr,
    output reg change_second,
    output reg change_minute,
    output reg change_hour,
    output reg [5:0] out
);

always @(*) 
begin
    // Default values
    change_second = 0;
    change_minute = 0;
    change_hour   = 0;

    // Display always shows selected field
    case(in)
        2'b00: out = sec;
        2'b01: out = min;
        2'b10: out = hr;
        default: out = sec;
    endcase

    // Editing enable
    if (mode) begin
        case(in)
            2'b00: change_second = 1;
            2'b01: change_minute = 1;
            2'b10: change_hour   = 1;
        endcase
    end
end

endmodule




