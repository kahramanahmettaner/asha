library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.AshaTypes.ALL;

entity actor is
    Port ( 
		Clock 				   :	in  std_logic; 			          --! Taktsignal
		Reset 				   :	in  std_logic; 					 	 --! Resetsignal
		Switches 			   : 	in  std_logic_vector(3 downto 0); --! Die acht Schalter
		ButtonsIn 			   :   in  std_logic_vector(3 downto 0);--! Die vier Taster
		SensorVibe 			   : 	in  std_logic;					 	    --! Eingang: Virbationssensor
		SensorDoor 			   : 	in  std_logic; 					    --! Eingang: Tuersensor
		ADCRegister			   :	in  ADCRegisterType; 				 --! Datenregister aller ADC-Werte
		LEDsOut 			      :	out std_logic_vector(5 downto 0);	--! Die acht LEDs
		SevenSegmentValue	   :	out std_logic_vector (15 downto 0);	--! treibt die 7-Segment-Anzeigen
		PWM1FanInsideValue   : 	out std_logic_vector(7 downto 0); 	--! Signalquellwert Luefter innen
		PWM2FanOutsideValue  : 	out std_logic_vector(7 downto 0); 	--! Signalquellwert Luefter aussen
		PWM3LightValue 		: 	out std_logic_vector(7 downto 0);	--! Signalquellwert Licht
		PWM4PeltierValue 	   : 	out std_logic_vector(7 downto 0);	--! Signalquellwert Peltier		
		PeltierDirection 	   : 	out std_logic;						      --! Signalquellwert Peltier	Richtung
		----- Werte von Bluetooth
		LEDsBT 					   :	in std_logic_vector(5 downto 0);	 --! Die acht LEDs
		SevenSegmentValueBT		:	in std_logic_vector (15 downto 0);--! 7SegmentEingang von BT
		PWM1FanInsideValueBT 	:	in std_logic_vector(7 downto 0);	 --! Signalquellwert Luefter innen, von Bt
		PWM2FanOutsideValueBT 	:	in std_logic_vector(7 downto 0);	 --! Signalquellwert Luefter aussen, von Bt
		PWM3LightValueBT 		   :	in std_logic_vector(7 downto 0);	 --! Signalquellwert Licht, von Bt
		PWM4PeltierValueBT		:	in std_logic_vector(7 downto 0);	 --! Signalquellwert Peltier, von Bt
		PeltierDirectionBT		:   in std_logic;						    --! Signalquellwert Peltier Richtung, von Bt
		----- Werte von Regelung
		PWM1FanInsideValueControl	:	in std_logic_vector(7 downto 0); --! Signalquellwert Luefter innen, von Regelung
		PWM2FanOutsideValueControl :	in std_logic_vector(7 downto 0); --! Signalquellwert Luefter aussen, von Regelung
		PWM3LightValueControl 		:	in std_logic_vector(7 downto 0); --! Signalquellwert Licht, von Regelung
		PWM4PeltierValueControl		:	in std_logic_vector(7 downto 0); --! Signalquellwert Peltier, von Regelung
		PeltierDirectionControl		:	in std_logic;					      --! Signalquellwert Peltier Richtung, von Regelung
		ControlLightDiffOut 		   :   in unsigned(12 downto 0);		   --! Aktuelle Regeldifferenz Licht
		ControlTempDiffOut  		   :   in unsigned(12 downto 0)		   --! Aktuelle Regeldifferenz Temperatur
	);
end actor;

architecture Behavioral of actor is

-- Zustandsautomat für Modus Auswahl
type state_typeM is (Asha1,Asha2,Asha3,
                     SensorRead1,SensorRead2,SensorRead3,
                     ManualActor1,ManualActor2,ManualActor3,
                     AutoActor1,AutoActor2,AutoActor3,
                     Bluetooth1,Bluetooth2,Bluetooth3);--type of state machine(M for Modus).
signal current_m,next_m:state_typeM;--current and next state declaration.

-- Zustandsautomat für Sensor Zustaende.
type state_typeS is (Init, Init2, Light, Light2, TempIn, TempIn2, TempOut, TempOut2, Vibe, Vibe2, Door, Door2 );  --type of state machine(S for Sensor).
signal current_s,next_s: state_typeS;  --current and next state declaration.


begin
-- FSM Prozess zur Realisierung der Speicherelemente - Abhängig vom Takt den nächsten Zustand setzen
--> In Versuch 6 zu implementieren!-
FSM_seq: process (Clock,Reset)
	begin  
        -- TODO
	end process FSM_seq;
	
-- FSM Prozess (kombinatorisch) zur Realisierung der Modul Zustände aus den Typen per Switch Case:  state_typeM
-- Setzt sich aus aktuellem Zustand und folgendem Zustand zusammen: current_m,next_m
--> In Versuch 6-10 zu implementieren
FSM_modul:process(current_m, ButtonsIn(0),ButtonsIn(1))
begin
   -- TODO
end process;    

-- FSM Prozess (kombinatorisch) zur Realisierung der Ausgangs- und Übergangsfunktionen
	-- Hinweis: 12 Bit ADC-Sensorwert für Lichtsensor: 	  ADCRegister(3),
	-- 			12 Bit ADC-Sensorwert für Temp. (außen):  ADCRegister(1),
	-- 			12 Bit ADC-Sensorwert für Temp. (innen):  ADCRegister(0),
--> In Versuch 6-10 zu implementieren!-

FSM_comb:process (current_s,current_m, ButtonsIn(2) , ADCRegister, SensorVibe, SensorDoor)
begin
    -- to avoid latches always set current state (Versuch 6)
    
    -- Modus 0: "ASHA" Auf 7 Segment Anzeige
    case current_m is
        when Asha1|Asha2|Asha3 => --ASHA state
            LEDsOut<= b"111111";
            SevenSegmentValue <= x"FFFF";
    -- Versuch 6
    -- Modus 1: "Sensorwerte Auslesen"
    -- Durchschalten der Sensoren per BTN2
    -- Ausgabe des ausgewalten Sensors ueber SiebenSegmentAnzeige
    -- when state ... TODO
                      
    -- Versuch 7
    -- Modus 2: Manuelle Aktorsteuerung	
    -- nur erlauben, wenn keine Regelung aktiv ist!		
        -- when ... TODO
        
    -- Versuch 9
    -- Modus 3: geregelte Aktorsteuerung	
        -- when ... TODO
        
    -- Versuch 10
    -- Modus 4: Steuerung ueber Smartphone-App
            -- when ... TODO
    when others =>
        -- DEFAULT Werte setzen TODO

    end case;
end process;
end Behavioral;
