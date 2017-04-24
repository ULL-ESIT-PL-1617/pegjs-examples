/* Pascal nested comments */

P     =   prog:T+                          { return prog; }
T     =   C 
        / (!End char:ANY)                  { return char;}
C     = Begin chars:$T* End                { return "C: "+chars; }
Begin = '(*'
End   = '*)'
ANY   =   'z'    /* any character */       { return 'z';  }
        / char:[^z]                        { return char; }
