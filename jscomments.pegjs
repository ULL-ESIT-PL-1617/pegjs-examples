/* JS comments */

P     =   prog:N+                      { return prog; }
N     =   chars:$(!Begin .)+           { return chars; }
        / C
C     = Begin chars:T* End             { return "C: "+chars.join(''); }
T     =   (!End char:.)                { return char;}
Begin = '/*'
End   = '*/'
