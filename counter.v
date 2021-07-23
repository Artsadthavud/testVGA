module counter (input clk, output reg[18:0] out);
reg [18:0] cnt;    
reg [18:0] reset = 833333;
  always @ (posedge clk) 
		begin  
			if (reset)  
				begin
					cnt <= 0;  
					out <= out + 1;
				end
			else  
				cnt <= cnt + 1;  
		end  
endmodule  