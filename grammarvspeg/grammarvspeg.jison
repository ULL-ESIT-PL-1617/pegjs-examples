%left 'c'
%left 'b'
%right 'a'

%lex
%%
\s+               { /* skip whitespace */ }
.                 { return yytext; }
/lex

%%
A:  B 'c'
;
B: 'b' | 'b' 'a'   
;
