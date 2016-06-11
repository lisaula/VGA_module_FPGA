`timescale 1ns / 1ps
module Main(
	input clk50mhz,
	input reset,
   //input green_in,
   //input blue_in,
	//input reset,
	output red_out,
   output green_out,
   output blue_out,
	output hsync,
	output vsync
	 );
	 
	wire vga_clk;
	wire [9:0]hcount;
	wire [9:0]vcount;
	reg [13:0] address;
	wire [2:0] data;
// synthesis attribute CLKFX_DIVIDE of vga_clock_dcm is 4
// synthesis attribute CLKFX_MULTIPLY of vga_clock_dcm is 2
	DCM vga_clock_dcm (.CLKIN(clk50mhz),.CLKFX(vga_clk));

	Rom_CarBlue rom(address,data);
	VGA_LOGIC vga(vga_clk,data,red_out,green_out,blue_out,hsync,vsync,hcount, vcount);
	
	always @(posedge vga_clk)
	begin
		if(reset)begin
			address=0;
		end
		
		if(vcount< 123)
		begin
			if(hcount < 82)
			begin
				address = address +1;
			end
		end
		else 
		begin
			address=0;
		end
	end
endmodule
