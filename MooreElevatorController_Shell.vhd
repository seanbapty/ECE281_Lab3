----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva and Bapty
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		CE3
-- Module Name:    	MooreElevatorController_Shell - Behavioral 
-- Description: 		Shell for completing CE3
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MooreElevatorController_Shell is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
--           stop : in  STD_LOGIC;
--           up_down : in  STD_LOGIC;
			  floorIn : in STD_LOGIC_VECTOR(2 downto 1);
           floor : out  STD_LOGIC_VECTOR (3 downto 0));
--			  floortens : out STD_LOGIC_VECTOR (3 downto 0));
end MooreElevatorController_Shell;

architecture Behavioral of MooreElevatorController_Shell is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type floor_state_type is (floor1, floor2, floor3, floor4, floor5, floor6, floor7, floor8);

--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal floor_state, floor_state_tens : floor_state_type;

begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
floor_state_machine: process(clk)
begin
	--clk'event and clk='1' is VHDL-speak for a rising edge
	if clk'event and clk='1' then
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
		if reset='1' then
			floor_state <= floor1;
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor1 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor2;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor1;
					end if;
				--when our current state is floor2
				when floor2 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor3; 			
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					--otherwise we're going to stay at floor2
					else
						floor_state <= floor2;
					end if;
				
--COMPLETE THE NEXT STATE LOGIC ASSIGNMENTS FOR FLOORS 3 AND 4
				when floor3 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor4;
					elsif (up_down='0' and stop ='0') then 
						floor_state <= floor2;	
					else
						floor_state <= floor3;
					end if;
				when floor4 =>
					if (up_down='1' and stop='0') then
						floor_state <= floor5;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor3;	
					else 
						floor_state <= floor4;
					end if;
				when floor5 =>
					if (up_down='1' and stop='0') then
						floor_state <= floor6;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor4;	
					else 
						floor_state <= floor5;
					end if;				
				when floor6 =>
					if (up_down='1' and stop='0') then
						floor_state <= floor7;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor5;	
					else 
						floor_state <= floor6;
					end if;
				when floor7 =>
					if (up_down='1' and stop='0') then
						floor_state <= floor8;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor6;	
					else 
						floor_state <= floor7;
					end if;
				when floor8 =>
					if (up_down='0' and stop='0') then 
						floor_state <= floor7;	
					else 
						floor_state <= floor8;
					end if;
				--This line accounts for phantom states
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	end if;
end process;

-- Here you define your output logic. Finish the statements below
floor <= "0000" when (floor_state = floor1) else
			"0001" when (floor_state = floor2) else
			"0010" when (floor_state = floor3) else
			"0011" when (floor_state = floor4) else
			"0100" when (floor_state = floor5) else
			"0101" when (floor_state = floor6) else
			"0110" when (floor_state = floor7) else
			"0111" when (floor_state = floor8) else
			"0000";
floortens <=   "0000" when (floor_state = floor5) else
					"0000" when (floor_state = floor6) else
					"0000" when (floor_state = floor7) else
					"0000" when (floor_state = floor8) else
					"0000";

end Behavioral;

