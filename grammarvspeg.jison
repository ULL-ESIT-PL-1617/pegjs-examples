/* operator associations and precedence */

%right 'a' 'b' 'c'
%right C
%right D
%%
a:  'b' 'c'
;
b: 'b' %prec C | 'b' 'a' %prec D
;
