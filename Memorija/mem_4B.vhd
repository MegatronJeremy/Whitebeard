library IEEE;
use IEEE.std_logic_1164.all;

entity mem_4B is
	port(
		d_in : in std_logic_vector(7 downto 0);
		d_out : out std_logic_vector(7 downto 0);
		CS : in std_logic;
		clr : in std_logic;
		clk : in std_logic;
		rdwr : in std_logic;
		addr : in std_logic_vector(1 downto 0)

	);

end mem_4B;

architecture rtl of mem_4B is
	signal d_reg0 : std_logic_vector(7 downto 0);
	signal d_reg1 : std_logic_vector(7 downto 0);
	signal d_reg2 : std_logic_vector(7 downto 0);
	signal d_reg3 : std_logic_vector(7 downto 0);
	signal d_reg : std_logic_vector(7 downto 0);
	signal ld0 : std_logic;
	signal ld1 : std_logic;
	signal ld2 : std_logic;
	signal ld3 : std_logic;
	signal mr : std_logic;
	
		
		
		
begin

	--ovo bi trebalo da je ok
	mr<= not clr;
	--napraviti da radi sinhrono!!!!
	--pokusati u for petlji?
	reg0 : entity work.reg8b port map (d_in=>d_in, mr=>mr, clk=>clk, ld=>ld0, q_out=>d_reg0(7 downto 0));
	reg1 : entity work.reg8b port map (d_in=>d_in, mr=>mr, clk=>clk, ld=>ld1, q_out=>d_reg1(7 downto 0));
	reg2 : entity work.reg8b port map (d_in=>d_in, mr=>mr, clk=>clk, ld=>ld2, q_out=>d_reg2(7 downto 0));
	reg3 : entity work.reg8b port map (d_in=>d_in, mr=>mr, clk=>clk, ld=>ld3, q_out=>d_reg3(7 downto 0));

	
	--ne znam da li ovo radi
	ld1<='1' when (addr="01" and rdwr='0' and CS='1') else '0';
	ld0<='1' when (addr="00" and rdwr='0' and CS='1') else '0';
	ld2<='1' when (addr="10" and rdwr='0' and CS='1') else '0';
	ld3<='1' when (addr="11" and rdwr='0' and CS='1') else '0';
	
	
	--ni ovo, barem nije latch
	cs_reg : process (addr, rdwr, d_reg0, d_reg1, d_reg2, d_reg3, ld0, ld1, ld2, ld3, d_reg, CS, d_in) is
	begin
		if(cs ='1') then
			if(rdwr='1') then
				case addr is 

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