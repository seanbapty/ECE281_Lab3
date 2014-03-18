ECE281_Lab3
===========
# Pre-Lab
#### Top Shell Schematic
![alt tag](https://raw.github.com/seanbapty/ECE281_Lab3/master/topshellschematic3.JPG)

The given code in the top shell is the controlling body for the LED display. This VHDL code takes input data and converts it into a type that can be used on the FPGA.

# Main Lab
## Code Critique

#### Bad Code 
```
***
floor_state_machine: process(clk)
***
```
This code is improper because it combines next state logic and state memory in one process, thus inadvertently creating memory. It is proper to seperate next state logic and state memory.

#### Good Code
```
***
floor_state_machine : process(clk, up_down, reset, stop)
***
```
By adding all posible inputs to the process's sensitivity list, the program does not have to "remember" what the values for an input were, thus eliminating the undesired memory.

## Functionality Videos
![alt tag](https://www.youtube.com/watch?v=KPDFuFnz9n8&feature=youtu.be)
![alt tag](https://www.youtube.com/watch?v=ifLdObCu_NA&feature=youtu.be)
![alt tag](https://www.youtube.com/watch?v=wCrTbxB3LaA&feature=youtu.be)

### Documentation
While drawing the schematic I referenced Lim Ching Hao's drawing loaded onto his github. I used his drawing to discern how the nibble_to_sseg connects to the nexys2_sseg. I also used his schematic to check my completed drawing for differences between our drawing.

