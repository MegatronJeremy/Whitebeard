library IEEE;
use IEEE.std_logic_1164.all;

entity mem_1kB is
	port(
		d_in : in std_logic_vector(7 downto 0);
		d_out : out std_logic_vector(7 downto 0);
		CS : in std_logic;
		clr : in std_logic;
		clk : in std_logic;
		rdwr : in std_logic;
		addr : in std_logic_vector(9 downto 0)

	);

end mem_1kB;

architecture rtl of mem_1kB is
	signal d_reg0 : std_logic_vector(7 downto 0);
	signal d_reg1 : std_logic_vector(7 downto 0);
	signal d_reg2 : std_logic_vector(7 downto 0);
	signal d_reg3 : std_logic_vector(7 downto 0);
	signal d_reg : std_logic_vector(7 downto 0);
	signal cs0 : std_logic;
	signal cs1 : std_logic;
	signal cs2 : std_logic;
	signal cs3 : std_logic;
	signal addrselect : std_logic_vector(1 downto 0);
		
		
begin

	mem0 : entity work.mem_256B port map (d_in=>d_in, clr=> clr, clk=>clk, cs=>cs0, d_out=>d_reg0(7 downto 0), rdwr=>rdwr, addr=>addr(7 downto 0));
	mem1 : entity work.mem_256B port map (d_in=>d_in, clr=> clr, clk=>clk, cs=>cs1, d_out=>d_reg1(7 downto 0), rdwr=>rdwr, addr=>addr(7 downto 0));
	mem2 : entity work.mem_256B port map (d_in=>d_in, clr=> clr, clk=>clk, cs=>cs2, d_out=>d_reg2(7 downto 0), rdwr=>rdwr, addr=>addr(7 downto 0));
	mem3 : entity work.mem_256B port map (d_in=>d_in,clr=> clr, clk=>clk, cs=>cs3, d_out=>d_reg3(7 downto 0), rdwr=>rdwr, addr=>addr(7 downto 0));
	
	addrselect<= addr (9 downto 8);
	cs1<='1' when (addrselect="01"  and CS='1') else '0';
	cs0<='1' when (addrselect="00"  and CS='1') else '0';
	cs2<='1' when (addrselect="10"  and CS='1') else '0';
	cs3<='1' when (addrselect="11"  and CS='1') else '0';
	
	--jos nije gotovo.
	cs_reg : process (addrselect, rdwr, d_reg0, d_reg1, d_reg2, d_reg3, cs0, cs1, cs2, cs3, d_reg, CS, d_in) is
	begin
		if(cs ='1') then
			if(rdwr='1') then
				case addrselect is 

					when "00" => d_reg<=d_reg0;
					when "01" => d_reg<=d_reg1;
					when "10" => d_reg<=d_reg2;
					when "11" => d_reg<=d_reg3;
					when others => d_reg<="ZZZZZZZZ";

				end case;
	
			else 
					--tribaferi mogu prestavljati problem mozda na fpga, nisam siguran da li rade
					d_reg<="ZZZZZZZZ";

			end if;
		else 
			d_reg<="ZZZZZZZZ";
			
		end if;
	end process;
	
	d_out<=d_reg;

end rtl;