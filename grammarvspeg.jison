%left 'c'
%left 'b'
%right 'a'

%lex
%%
.                 { return yytext; }
/lex

%%
a:  b 'c'
;
b: 'b' | 'b' 'a'   
;
