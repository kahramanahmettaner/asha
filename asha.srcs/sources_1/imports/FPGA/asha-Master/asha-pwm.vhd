--! Standardbibliothek benutzen
library IEEE;
--! Logikelemente verwenden
use IEEE.STD_LOGIC_1164.ALL;
--! Numerisches Rechnen ermoeglichen
use IEEE.NUMERIC_STD.ALL;

--! @brief ASHA-Modul - PWM-Signale erzeugen
--! @details  Dieses Modul erzeugt die PWM-Signale fuer PWM-Aktoren
entity AshaPWM is
  Port ( 
    Clock : in std_logic; 									--! Taktsignal
    Reset : in std_logic; 									--! Resetsignal
    EnPWMClock : in std_logic; 								--! Enable-Signal fuer die PWM-Abarbeitung
    PWM1FanInsideValue : in std_logic_vector(7 downto 0); 	--! Signalquellwert Luefter innen
    PWM2FanOutsideValue : in std_logic_vector(7 downto 0);	--! Signalquellwert Luefter aussen
    PWM3LightValue : in std_logic_vector(7 downto 0); 		--! Signalquellwert Licht
    PWM4PeltierValue : in std_logic_vector(7 downto 0); 	--! Signalquellwert Peltier
    PWM1FanInsideSignal : out std_logic; 					--! PWM-Aktorsignal Luefter innen
    PWM2FanOutsideSignal : out std_logic; 					--! PWM-Aktorsignal Luefter aussen
    PWM3LightSignal : out std_logic; 						--! PWM-Aktorsignal Licht
    PWM4PeltierSignal : out std_logic); 					--! PWM-Aktorsignal Peltier
end AshaPWM;

architecture Behavioral of AshaPWM is

signal PWMCounter : unsigned(7 downto 0); 
  
begin

    -- Die nachfolgenden Zeilen m�ssen nach der Implementierung von 
    -- PWM_Gen wieder entfernt werden! TODO
	PWM1FanInsideSignal<='1';
	PWM2FanOutsideSignal<='1';
	PWM3LightSignal<='1';
	PWM4PeltierSignal<='1';
	PWMCounter<=(others=>'0'); 
	
  --! PWM Generierung -> Versuch 7
  -- Hinweis: Die Aktoren sind low-active!
  PWM_Gen:Process (Clock)
  begin
    if rising_edge(Clock) then
         -- TODO
   end if;
  end Process PWM_Gen; 

end Behavioral;
