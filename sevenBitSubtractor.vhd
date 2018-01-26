library ieee;
use ieee.std_logic_1164.all;

entity sevenBitSubstractor is
port (
 i_BorrowIn : IN STD_LOGIC;

i_Ai, i_Bi  : IN STD_LOGIC_VECTOR ( 6 DOWNTO 0);

o_Diff      : OUT STD_LOGIC_VECTOR ( 6 DOWNTO 0); 

o_BorrowOut : OUT STD_LOGIC );

end sevenBitSubstractor;

architecture rtl of sevenBitSubstractor is 

SIGNAL BOUT_IN : STD_LOGIC_VECTOR (6 DOWNTO 0);

SIGNAL DIFF_IN : STD_LOGIC_VECTOR (6 DOWNTO 0);

COMPONENT oneBitSubstractor 
port ( 

BIN        : IN STD_LOGIC;
AI, BI     : IN STD_LOGIC;
DIFF, BOUT : OUT STD_LOGIC;

END COMPONENT;

BEGIN 

sub0 : oneBitSubstractor port map (i_BorrowIn , i_Ai(0), i_Bi(0), DI_INT(0), BOUT_INT(0));
sub1 : oneBitSubstractor port map (BOUT_IN(1), i_Ai(1), i_Bi(1), DI_INT(1), BOUT_INT(1));
sub2 : oneBitSubstractor port map (BOUT_IN(2), i_Ai(2), i_Bi(2), DI_INT(2), BOUT_INT(2));
sub3 : oneBitSubstractor port map (BOUT_IN(3) , i_Ai(3), i_Bi(3), DI_INT(3), BOUT_INT(3));
sub4 : oneBitSubstractor port map (BOUT_IN(4) , i_Ai(4), i_Bi(4), DI_INT(4), BOUT_INT(4));
sub5 : oneBitSubstractor port map (BOUT_IN(5) , i_Ai(5), i_Bi(5), DI_INT(5), BOUT_INT(5));
sub6 : oneBitSubstractor port map (BOUT_IN(6), i_Ai(6), i_Bi(6), DI_INT(6), o_BorrowOut);

o_Diff <= DIFF_INT;
o_BorrowOut <= BOUT_INT(6);

END rtl