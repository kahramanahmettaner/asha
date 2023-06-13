----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2023 15:38:01
-- Design Name: 
-- Module Name: AshaPWMTestbench - Behavioral
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

entity AshaPWMTestbench is
--  Port ( );
end AshaPWMTestbench;

architecture Behavioral of AshaPWMTestbench is

-- Komponentbeschreibung
COMPONENT AshaPWM
PORT(   Clock : IN std_logic;
        Reset : IN std_logic;
        EnPWMClock : IN std_logic;
        PWM1FanInsideValue : IN std_logic_vector(7 downto 0);
        PWM2FanOutsideValue : IN std_logic_vector(7 downto 0);
        PWM3LightValue : IN std_logic_vector(7 downto 0);
        PWM4PeltierValue : IN std_logic_vector(7 downto 0);
        PWM1FanInsideSignal : OUT std_logic;
        PWM2FanOutsideSignal : OUT std_logic;
        PWM3LightSignal : OUT std_logic;
        PWM4PeltierSignal : OUT std_logic );
END COMPONENT;

-- Eingabesignale
signal Clock : std_logic := '0';
signal Reset : std_logic := '0';
signal EnPWMClock : std_logic := '0';
signal PWM1FanInsideValue : std_logic_vector(7 downto 0) := (others => '0');
signal PWM2FanOutsideValue : std_logic_vector(7 downto 0) := (others => '0');
signal PWM3LightValue : std_logic_vector(7 downto 0) := (others => '0');
signal PWM4PeltierValue : std_logic_vector(7 downto 0) := (others => '0');

-- Ausgabesignale
signal PWM1FanInsideSignal : std_logic;
signal PWM2FanOutsideSignal : std_logic;
signal PWM3LightSignal : std_logic;
signal PWM4PeltierSignal : std_logic;

-- Clock-Period
constant Clock_period : time := 4 ns;
constant EnPWMClock_period : time := 4 ns;

begin

uut: AshaPWM 
PORT MAP (
    Clock => Clock,
    Reset => Reset,
    EnPWMClock => EnPWMClock,
    PWM1FanInsideValue => PWM1FanInsideValue,
    PWM2FanOutsideValue => PWM2FanOutsideValue,
    PWM3LightValue => PWM3LightValue,
    PWM4PeltierValue => PWM4PeltierValue,
    PWM1FanInsideSignal => PWM1FanInsideSignal,
    PWM2FanOutsideSignal => PWM2FanOutsideSignal,
    PWM3LightSignal => PWM3LightSignal,
    PWM4PeltierSignal => PWM4PeltierSignal );

-- Clock-Signale aktualisieren
Clock_Update:process
begin
    Clock <= '0';
    wait for Clock_period/2;
    Clock <= '1';
    wait for Clock_period/2;
end process;

EnPWMClock_process :process
begin
    EnPWMClock <= '0';
    wait for EnPWMClock_period/2;  
    EnPWMClock <= '1';
    wait for EnPWMClock_period/2;
end process;

stim_proc: process
begin
    --Werte f?r Aktoren setzen
    PWM1FanInsideValue <= b"01000000"; -- 25% an 
    PWM2FanOutsideValue <= b"00000000"; -- immer aus
    PWM3LightValue <= b"10000000"; -- 50% an
    PWM4PeltierValue <= b"11111111"; -- immer an
    wait for 1024 ns;
    
    --Werte wechseln
    PWM1FanInsideValue <= b"11111111"; -- 50% an 
    PWM2FanOutsideValue <= b"01000000"; -- immer an
    PWM3LightValue <= b"10000000"; -- 25% an
    PWM4PeltierValue <= b"00000000"; -- immer aus
    wait;

    
end process;

response_control: process
begin
    wait for 100 ns;
end process;

end Behavioral;
