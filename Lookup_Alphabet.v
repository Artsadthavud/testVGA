module Lookup_Alphabet(sw, a,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,check);
	 input [7:0] a;
	 input sw;
	 output reg [7:0]check;
    output reg [7:0] r0;
	 output reg [7:0] r1;
	 output reg [7:0] r2;
	 output reg [7:0] r3;
	 output reg [7:0] r4;
	 output reg [7:0] r5;
	 output reg [7:0] r6;
	 output reg [7:0] r7;
	 output reg [7:0] r8;
	 output reg [7:0] r9;
	 output reg [7:0] r10;
	 output reg [7:0] r11;
	 output reg [7:0] r12;
	 output reg [7:0] r13;
	 output reg [7:0] r14;
	 output reg [7:0] r15;

    always @(sw) begin
	 	////////////////////////////////////////////////A
       if (a == 8'b01000001) begin
            r0 = 8'b00000000; //A
            r1 = 8'b00000000; //A
            r2 = 8'b00001000; //A 
            r3 = 8'b00010100; //A 
            r4 = 8'b00100010; //A 
            r5 = 8'b00100010; //A 
				r6 = 8'b00100010; //A
            r7 = 8'b00111110; //A 
            r8 = 8'b00100010; //A 
            r9 = 8'b00100010; //A 
            r10 = 8'b00100010; //A 
            r11 = 8'b00100010; //A 
				r12 = 8'b00100010; //A 
            r13 = 8'b00000000; //A
				r14 = 8'b00000000; //A 
            r15 = 8'b00000000; //A
				check = check + 1 ;
			end 
			
		/////////////////////////////////////////////////B
		else if (a == 8'b01000010)
			begin
				
            r0 = 8'b00000000; 
            r1 = 8'b00000000; 
            r2 = 8'b00111000; 
            r3 = 8'b00100100; 
            r4 = 8'b00100010; 
            r5 = 8'b00100010; 
				r6 = 8'b00111100; 
            r7 = 8'b00100010; 
            r8 = 8'b00100010; 
            r9 = 8'b00100010; 
            r10 = 8'b00100010; 
            r11 = 8'b00100100; 
				r12 = 8'b00111000; 
            r13 = 8'b00000000; 
				r14 = 8'b00000000; 
            r15 = 8'b00000000; 
				check = check + 1 ;
			end
		
		/////////////////////////////////////////////////C
		else if (a == 8'b01000011)
			begin
            r0 = 8'b00000000; 
            r1 = 8'b00000000; 
            r2 = 8'b00011110; 
            r3 = 8'b00100000; 
            r4 = 8'b00100000; 
            r5 = 8'b00100000; 
				r6 = 8'b00100000; 
            r7 = 8'b00100000; 
            r8 = 8'b00100000; 
            r9 = 8'b00100000; 
            r10 = 8'b00100000; 
            r11 = 8'b00100000; 
				r12 = 8'b00011110; 
            r13 = 8'b00000000; 
				r14 = 8'b00000000; 
            r15 = 8'b00000000; 
				check = check + 1 ;
			end
		
		/////////////////////////////////////////////////D
		else if (a == 8'b01000100)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111000; 
            r3 <= 8'b00100100; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100100; 
				r12 <= 8'b00111000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
		
		/////////////////////////////////////////////////E
		else if (a == 8'b01000101)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00100000; 
            r8 <= 8'b00100000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
			
		/////////////////////////////////////////////////F
		else if (a == 8'b01000110)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00111100; 
            r7 <= 8'b00100000; 
            r8 <= 8'b00100000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00100000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000;
				check = check + 1 ;	
			end
			
				/////////////////////////////////////////////////G
		else if (a == 8'b01000111)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00011100; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00100000; 
            r7 <= 8'b00101110; 
            r8 <= 8'b00101010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000;
				check = check + 1 ;	
			end
			
						/////////////////////////////////////////////////H
		else if (a == 8'b01001000)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000;
				check = check + 1 ;	
			end
		
							/////////////////////////////////////////////////I
		else if (a == 8'b01001001)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00011100; 
            r3 <= 8'b00001000; 
            r4 <= 8'b00001000; 
            r5 <= 8'b00001000; 
				r6 <= 8'b00001000; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00001000; 
            r9 <= 8'b00001000; 
            r10 <= 8'b00001000; 
            r11 <= 8'b00001000; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
			
								/////////////////////////////////////////////////J
		else if (a == 8'b01001010)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00000010; 
            r3 <= 8'b00000010; 
            r4 <= 8'b00000010; 
            r5 <= 8'b00000010; 
				r6 <= 8'b00000010; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
								/////////////////////////////////////////////////K
		else if (a == 8'b01001011)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100100; 
            r5 <= 8'b00101000; 
				r6 <= 8'b00110000; 
            r7 <= 8'b00110000; 
            r8 <= 8'b00110000; 
            r9 <= 8'b00101000; 
            r10 <= 8'b00100100; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
									/////////////////////////////////////////////////L
		else if (a == 8'b01001100)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100000; 
            r3 <= 8'b00100000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00100000; 
            r7 <= 8'b00100000; 
            r8 <= 8'b00100000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
									/////////////////////////////////////////////////M
		else if (a == 8'b01001101)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00110110; 
            r3 <= 8'b00101010; 
            r4 <= 8'b00101010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////N
		else if (a == 8'b01001110)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00110010; 
            r3 <= 8'b00110010; 
            r4 <= 8'b00101010; 
            r5 <= 8'b00101010; 
				r6 <= 8'b00100110; 
            r7 <= 8'b00100110; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////O
		else if (a == 8'b01001111)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00011100; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////P
		else if (a == 8'b01010000)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111100; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111100; 
            r7 <= 8'b00100000; 
            r8 <= 8'b00100000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00100000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////Q
		else if (a == 8'b01010001)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00011100; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100100; 
            r11 <= 8'b00101100; 
				r12 <= 8'b00010010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////R
		else if (a == 8'b01010010)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111100; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111100; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////S
		else if (a == 8'b01010011)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00001110; 
            r3 <= 8'b00010000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00011000; 
            r7 <= 8'b00000100; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000100; 
				r12 <= 8'b00111000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////T
		else if (a == 8'b01010100)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00001000; 
            r4 <= 8'b00001000; 
            r5 <= 8'b00001000; 
				r6 <= 8'b00001000; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00001000; 
            r9 <= 8'b00001000; 
            r10 <= 8'b00001000; 
            r11 <= 8'b00001000; 
				r12 <= 8'b00001000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////U
		else if (a == 8'b01010101)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////V
		else if (a == 8'b01010110)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00010100; 
            r11 <= 8'b00010100; 
				r12 <= 8'b00001000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////W
		else if (a == 8'b01010111)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00101010; 
            r11 <= 8'b00101010; 
				r12 <= 8'b00110110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////X
		else if (a == 8'b01011000)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00010100; 
				r6 <= 8'b00010100; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00010100; 
            r9 <= 8'b00010100; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00100010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////Y
		else if (a == 8'b01011001)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00100010; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00010100; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00001000; 
            r9 <= 8'b00001000; 
            r10 <= 8'b00001000; 
            r11 <= 8'b00001000; 
				r12 <= 8'b00001000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////Z
		else if (a == 8'b01011010)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00000010; 
            r4 <= 8'b00000010; 
            r5 <= 8'b00000010; 
				r6 <= 8'b00000100; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00010000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
			
/////////////////////////////////////////////////0
		else if (a == 8'b00110000)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00100010; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////1
		else if (a == 8'b00110001)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00011000; 
            r3 <= 8'b00001000; 
            r4 <= 8'b00001000; 
            r5 <= 8'b00001000; 
				r6 <= 8'b00001000; 
            r7 <= 8'b00001000; 
            r8 <= 8'b00001000; 
            r9 <= 8'b00001000; 
            r10 <= 8'b00001000; 
            r11 <= 8'b00001000; 
				r12 <= 8'b00011100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////2
		else if (a == 8'b00110010)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00000010; 
            r4 <= 8'b00000010; 
            r5 <= 8'b00000010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00100000; 
            r8 <= 8'b00100000; 
            r9 <= 8'b00100000; 
            r10 <= 8'b00100000; 
            r11 <= 8'b00100000; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////3
		else if (a == 8'b00110011)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00000010; 
            r4 <= 8'b00000010; 
            r5 <= 8'b00000010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////4
		else if (a == 8'b00110100)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00001100; 
            r3 <= 8'b00010100; 
            r4 <= 8'b00100100; 
            r5 <= 8'b00100100; 
				r6 <= 8'b00100100; 
            r7 <= 8'b00111110; 
            r8 <= 8'b00000100; 
            r9 <= 8'b00000100; 
            r10 <= 8'b00000100; 
            r11 <= 8'b00000100; 
				r12 <= 8'b00000100; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////5
		else if (a == 8'b00110101)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////6
		else if (a == 8'b00110110)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100000; 
            r4 <= 8'b00100000; 
            r5 <= 8'b00100000; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////7
		else if (a == 8'b00110111)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00000010; 
            r4 <= 8'b00000010; 
            r5 <= 8'b00000010; 
				r6 <= 8'b00000010; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000010; 
				r12 <= 8'b00000010; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////8
		else if (a == 8'b00111000)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
/////////////////////////////////////////////////9
		else if (a == 8'b00111001)
			begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
		else 
		begin
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111110; 
            r3 <= 8'b00100010; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111110; 
            r7 <= 8'b00000010; 
            r8 <= 8'b00000010; 
            r9 <= 8'b00000010; 
            r10 <= 8'b00000010; 
            r11 <= 8'b00000010; 
				r12 <= 8'b00111110; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				check = check + 1 ;
			end
    end
endmodule
