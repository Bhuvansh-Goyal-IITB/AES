library ieee;
use ieee.std_logic_1164.all;

entity Rot_Word is 
	port(input: in std_logic_vector(31 downto 0); output: out std_logic_vector(31 downto 0));
end entity Rot_Word;

architecture Struct of Rot_Word is
begin
	output(8*4 - 1 downto 8*3) <= input(8*3 - 1 downto 8*2);
	output(8*3 - 1 downto 8*2) <= input(8*2 - 1 downto 8*1);
	output(8*2 - 1 downto 8*1) <= input(8*1 - 1 downto 0);
	output(8*1 - 1 downto 0) <= input(8*4 - 1 downto 8*3);
end Struct;