library ieee;
use ieee.std_logic_1164.all;

entity Add_Round_Key is
	port (input, key_input: in std_logic_vector(127 downto 0); round_const: in std_logic_vector(7 downto 0); output: out std_logic_vector(127 downto 0));
end entity Add_Round_Key;

architecture Struct of Add_Round_Key is
	component Round_Key_Gen is 
		port (input: in std_logic_vector(127 downto 0); round_const: in std_logic_vector(7 downto 0); 
				output: out std_logic_vector(127 downto 0));
	end component Round_Key_Gen;
	signal key: std_logic_vector(127 downto 0);
begin
	Rkg: Round_Key_Gen port map (key_input, round_const, key);
	output <= input xor key;
end Struct;