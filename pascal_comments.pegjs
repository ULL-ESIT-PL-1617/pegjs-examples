/* Pascal nested comments */

P     =   prog:N+                       { return prog; }
N     =   chars:$(!Begin .)+            { return chars;}
        / C
C     = Begin chars:T* End             { return "C: "+chars; }
T     =   C 
        / (!Begin !End char:.)          { return char;}
Begin = '(*'
End   = '*)'
