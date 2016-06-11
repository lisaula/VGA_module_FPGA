`timescale 1ns / 1ps
	module VGA_LOGIC(
	input clk,
   input [2:0]rgb_in,
	output reg red_out,
   output reg green_out,
   output reg blue_out,
	output reg hsync,
	output reg vsync,
	output [9:0]hor_count,
	output [9:0]ver_count
	);
 reg [9:0]hcount;
 reg [9:0]vcount;
 reg [2:0]color;
 reg [6:0]contColumn;
 assign hor_count = hcount;
 assign ver_count = vcount;
 always @(posedge clk)
 begin 
	if(hcount == 799)
	begin
		hcount =0;
		if(vcount ==524)
		begin
			vcount =0;
		end else begin
			vcount = vcount+1;
		end
	end else begin
		hcount = hcount +1;
	end
	
	if(vcount >= 490 && vcount <492) begin
		vsync =0;
	end else begin
		vsync =1;
	end
	
	if(hcount >=656 && hcount <752) begin
		hsync =0;
	end else begin
		hsync =1;
	end
	
	if(hcount < 640 && vcount <480) begin
		red_out =color[0];
		green_out = color[1];
		blue_out=color[2];
	end else begin
		red_out =1'b0;
		green_out = 1'b0;
		blue_out=1'b0;
	end
	if(hcount < 640 && vcount <480)
	begin
	
		//seting background
		if(hcount < 80)
		begin
			color = 3'b000;
		end else if(hcount < 160) begin
			color = 3'b001;
		end else if(hcount < 240) begin
			color = 3'b010;
		end else if(hcount < 320) begin
			color = 3'b011;
		end else if(hcount < 400) begin
			color = 3'b100;
		end else if(hcount < 480) begin
			color = 3'b101;
		end else if(hcount < 560) begin
			color = 3'b110;
		end else begin
			color = 3'b111;
		end
		
		//setting image CarBlue
		if(hcount < 82 && vcount< 123)
		begin
			color[0]= rgb_in[2];
			color[1]= rgb_in[1];
			color[2]= rgb_in[0];
		end
	end
 end
 
 initial 
	begin
	hcount = 0;
	vcount=0;
	color = 3'b0;
	contColumn = 7'b0;
	end
endmodule
