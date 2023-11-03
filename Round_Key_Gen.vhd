library ieee;
use ieee.std_logic_1164.all;

entity Round_Key_Gen is 
	port (input: in std_logic_vector(127 downto 0); round_const: in std_logic_vector(7 downto 0); 
			output: out std_logic_vector(127 downto 0));
end entity Round_Key_Gen;

architecture Struct of Round_Key_Gen is 
	component Rot_Word is 
		port(input: in std_logic_vector(31 downto 0); output: out std_logic_vector(31 downto 0));
	end component Rot_Word;
	
	component SubBox is 
		port(inp:in std_logic_vector(31 downto 0); outp:out std_logic_vector(31 downto 0));
	end component;

	signal g, w3, w4, w5, w6, w7: std_logic_vector(31 downto 0);
	signal rot, sub: std_logic_vector(31 downto 0);
	signal round_const_32: std_logic_vector(31 downto 0);
begin
	w3 <= input(31 downto 0);
	Rotw: Rot_Word port map(w3, rot);
	Subbx: SubBox port map(rot, sub);
	round_const_32 <= round_const & "000000000000000000000000";
	g <= sub xor round_const_32;
	
	w4 <= input(8*16 - 1 downto 8*12) xor g;
	w5 <= input(8*12 - 1 downto 8*8) xor w4;
	w6 <= input(8*8 - 1 downto 8*4) xor w5;
	w7 <= input(8*4 - 1 downto 0) xor w6;
	
	output <= w4 & w5 & w6 & w7;
end Struct;