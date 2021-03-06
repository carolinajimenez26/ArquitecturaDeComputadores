
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;


entity RF is
    Port ( reset : in  STD_LOGIC;
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type reg is array (0 to 39) of std_logic_vector (31 downto 0);
--40 filas (por ventaneo) y 32 de ancho de palabra

signal myReg: reg; 

begin
process(rs1,rs2,rd,dwr,reset)
	begin 
		myReg(0) <= x"00000000";--para asegurar que se quede en ceros g0
		if reset = '0' then
			if(rd/="00000")then --no se puede escribir en el registro g0
				Myreg(conv_integer(rd)) <= dwr; --escribe el valor en memoria
			end if;
			--devuelve los valores pedidos
			crs1 <= Myreg(conv_integer(rs1));
			crs2 <= Myreg(conv_integer(rs2));
		else --si esta en reset no debe devolver nada
			crs1 <= (others=>'0');
			crs2 <= (others=>'0');
		end if;
	end process;
		
end Behavioral;

