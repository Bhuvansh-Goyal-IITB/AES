library ieee;
use ieee.std_logic_1164.all;

entity Column_Transform is 
 port(inp:in std_logic_vector(31 downto 0);
	      outp:out std_logic_vector(31 downto 0) );

end entity;


architecture Struct of Column_Transform is

component MUL_2 is
	port (
		input_byte : in std_logic_vector(7 downto 0);
		output_byte : out std_logic_vector(7 downto 0)
	);
end component;

signal t1,t2,t3,t4 : std_logic_vector(7 downto 0);
begin 
m1: MUL_2 port map (input_byte=>inp(7 downto 0),output_byte=>t1);
m2: MUL_2 port map (input_byte=>inp(15 downto 8),output_byte=>t2);
m3: MUL_2 port map (input_byte=>inp(23 downto 16),output_byte=>t3);
m4: MUL_2 port map (input_byte=>inp(31 downto 24),output_byte=>t4);

outp(7 downto 0)<= t1 xor t2 xor inp(15 downto 8) xor inp(23 downto 16) xor inp(31 downto 24) ;
outp(15 downto 8)<= t2 xor t3 xor inp(7 downto 0) xor inp(23 downto 16) xor inp(31 downto 24) ;
outp(23 downto 16)<= t3 xor t4 xor inp(15 downto 8) xor inp(7 downto 0) xor inp(31 downto 24) ;
outp(31 downto 24)<= t1 xor t4 xor inp(15 downto 8) xor inp(23 downto 16) xor inp(7 downto 0) ;

end architecture Struct;
