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
if clk'event and clk='1' then
```
This code is a more confusing than needs be way of setting the rising edge.
#### Good Code
```
if (rising_edge(clk)) then
```
This code sets a process based on a single boolean expression.

#### Bad Code
```
***
floor_state_machine: process(clk)
***
```
This code is improper because it combines next state logic and state memory in one process, thus inadvertently creating memory. It is proper to seperate next state logic and state memory.

#### Good Code
```
Process XXXXX
--Next floor logic based on inputs

***
floor_state_machine : process(clk) 
--State memory logic based on clk and next state from process XXX
***
```
By seperating next state logic from state memory, the program does not create memory unless explicitly stated.

## Functionality Videos
![alt tag](https://www.youtube.com/watch?v=KPDFuFnz9n8&feature=youtu.be)
![alt tag](https://www.youtube.com/watch?v=ifLdObCu_NA&feature=youtu.be)
![alt tag](https://www.youtube.com/watch?v=wCrTbxB3LaA&feature=youtu.be)

### Documentation
While drawing the schematic I referenced Lim Ching Hao's drawing loaded onto his github. I used his drawing to discern how the nibble_to_sseg connects to the nexys2_sseg. I also used his schematic to check my completed drawing for differences between our drawing. I referenced Sabin Park's README to discover ideas for the bad code, and how to format markdown.

