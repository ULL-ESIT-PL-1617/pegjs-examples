%%
\s+             {}
'a'              return 'a';
'b'              return 'b';
'c'              return 'c';
.               { return yytext; }
