----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2023 15:47:59
-- Design Name: 
-- Module Name: AshaVibeTestbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AshaVibeTestbench is
end AshaVibeTestbench;

architecture Behavioral of AshaVibeTestbench is

COMPONENT AshaVibe
PORT(   
    Clock : in std_logic;
    Reset : in std_logic;
    SensorVibe : in std_logic;
    SensorVibeHouseOn : out std_logic );
END COMPONENT;

-- Eingabe
signal Clock : std_logic := '0';
signal Reset : std_logic := '0';
signal SensorVibe : std_logic := '0';

-- Ausgabe
signal SensorVibeHouseOn : std_logic;

-- Clock-Period  ???
constant Clock_period : time := 4 ns;

begin

uut: AshaVibe 
PORT MAP (
    Clock => Clock,
    Reset => Reset,
    SensorVibe => SensorVibe,
    SensorVibeHouseOn => SensorVibeHouseOn 
    );

-- Clock-Signale aktualisieren
Clock_Update:process
begin
    Clock <= '0';
    wait for Clock_period/2;
    Clock <= '1';
    wait for Clock_period/2;
end process;

stim_proc: process
begin

    SensorVibe <= '0';
    Reset <= '0';
    wait for 1024 ns; -- wie lange warten?
    
    SensorVibe <= '1';
    wait for 1024 ns; -- wie lange warten?
        
    SensorVibe <= '0';
    wait for 1024 ns; -- wie lange warten?
   
    Reset <= '1';
    
    wait;
    
end process;

response_control: process
begin
    -- ?????
end process;

end Behavioral;
