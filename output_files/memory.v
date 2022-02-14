module memory(
    output [7:0] data_out,
    input [7:0] addressX,
	 input [7:0] addressY,
    input [7:0] data_in, 
    input write_enable,
    input clk
);
    reg [7:0] memory [0:79][0:29];

    always @(posedge clk) begin
        if (write_enable) begin
            memory[addressX][addressY] <= data_in;
        end
    end

    assign data_out = memory[addressX][addressY];

endmodule
