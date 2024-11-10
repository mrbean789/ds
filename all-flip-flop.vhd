library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF_TB is
end SR_FF_TB;

architecture Behavioral of SR_FF_TB is
    signal S, R, CLK : STD_LOGIC := '0';
    signal Q, Qn     : STD_LOGIC;
begin
    -- Instantiate the SR Flip Flop
    uut: entity work.SR_FF
        port map (
            S => S,
            R => R,
            CLK => CLK,
            Q => Q,
            Qn => Qn
        );

    -- Clock generation
    CLK_process: process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    -- Test vectors
    stimulus: process
    begin
        S <= '1'; R <= '0'; wait for 20 ns;
        S <= '0'; R <= '1'; wait for 20 ns;
        S <= '0'; R <= '0'; wait for 20 ns;
        S <= '1'; R <= '1'; wait for 20 ns;
        wait;
    end process;
end Behavioral;

