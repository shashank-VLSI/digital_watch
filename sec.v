`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 20:59:21
// Design Name: 
// Module Name: sec
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


module sec(
    input clk,
    input rst,
    input mode,
    input change_second,
    input valid_response,
    output reg [5:0] second
);

reg [31:0] counter;

always @(posedge clk)
begin
    if (rst) begin
        second  <= 0;
        counter <= 0;
    end

    else if (mode) begin
        if (change_second && valid_response) begin
            counter <= 0;

            if (second == 59)
                second <= 0;
            else
                second <= second + 1;
        end
    end

    else begin
        if (counter == 100000000 - 1) begin
            counter <= 0;

            if (second == 59)
                second <= 0;
            else
                second <= second + 1;
        end
        else begin
            counter <= counter + 1;
        end
    end
end

endmodule

