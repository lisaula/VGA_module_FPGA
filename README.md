# VGA_module_FPGA

How to display images with the FPGA, not a simple thing. In this project we emulate the VGA standards in order to draw in a screen 
with a resolution of 640X480. This project was made in Verilog, which is a design hardware language. For this project we create 3 modules:

-VGA_LOGIC: which has all the necessary instructions to emulate the VGA standard.

-Rom_CarBlue: this is the most interesting part. Here we extract all the necessary information of an image that we previously modify to low its quality, why this? Well because in our VGA_Logic module, we are only possible to draw 8 colors, and this is because we only use 3 bits to generate our color palette.

-Main: here we make all the connections needed to send all the color data from the Rom_CarBlue to the VGA_Logic. Furthermore we divide de FPGA clock to a minus frequency in order to accomplish the VGA standards.

Developers:

-Lisaula

-KenyStev
