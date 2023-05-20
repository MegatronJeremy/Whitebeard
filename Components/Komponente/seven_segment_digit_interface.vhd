library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment_digit_interface is
	port
	(
		-- Input ports
		x3	: in std_logic;
		x2	: in std_logic;
		x1	: in std_logic;
		x0	: in std_logic;
		dot: in std_logic;
		en : in std_logic;

		-- Output ports
		a	: out std_logic;
		b	: out std_logic;
		c	: out std_logic;
		d	: out std_logic;
		e	: out std_logic;
		f	: out std_logic;
		g	: out std_logic;
		dp: out std_logic
	);
end;

architecture rtl of seven_segment_digit_interface is
	 signal bcat : std_logic_vector(4 downto 0);
begin
   bcat <= en & x3 & x2 & x1 & x0;

	process (bcat,dot) is
	begin
		case bcat is
			when "10000" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '1';
			when "10001" => a <= '1'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '1'; g <= '1';
			when "10010" => a <= '0'; b <= '0'; c <= '1'; d <= '0'; e <= '0'; f <= '1'; g <= '0';
			when "10011" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '1'; g <= '0';
			when "10100" => a <= '1'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '0'; g <= '0';
			when "10101" => a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '1'; f <= '0'; g <= '0';
			when "10110" => a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0';
			when "10111" => a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '1'; g <= '1';
			when "11000" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0';
			when "11001" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '0'; g <= '0';
			when "11010" => a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '0'; f <= '0'; g <= '0';
			when "11011" => a <= '1'; b <= '1'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0';
			when "11100" => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '1';
			when "11101" => a <= '1'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '1'; g <= '0';
			when "11110" => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '0';
			when "11111" => a <= '0'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '0'; g <= '0';
			when others  => a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '1'; f <= '1'; g <= '1';
	  end case;
	end process;
	
	dp<=not (en and dot);

end;

