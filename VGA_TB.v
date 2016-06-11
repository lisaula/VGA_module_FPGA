`timescale 1ns / 1ps
module VGA_TB(
    );
	reg clk;
   reg red_in;
   reg green_in;
   reg blue_in;
	wire red_out;
   wire green_out;
   wire blue_out;
	wire hsync;
	wire vsync;
	wire[9:0]hor_count;
	wire[9:0]ver_count;
	
	VGA_LOGIC vga(clk, red_in, green_in, blue_in,red_out,green_out, blue_out, hsync,vsync, hor_count, ver_count);
	
	initial
	begin
		clk=0;
		red_in =1; 
		green_in=1;
		blue_in=1;
	end
	always
	begin
		#10;
		clk=!clk;
	end
endmodule
