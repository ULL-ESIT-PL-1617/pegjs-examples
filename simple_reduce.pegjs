/* From the Wikipedia
Value   ← [0-9]+ / '(' Expr ')'
Product ← Value (('*' / '/') Value)*
Sum     ← Product (('+' / '-') Product)*
Expr    ← Sum
*/
{ 
  function reduce(left, right) {
    return right.reduce((sum, [op, num]) => eval(`sum ${op}= num`), left);
  }
}

sum     = left:product right:($[+-] product)* { return reduce(left, right); }
product = left:value   right:($[*/] value)*   { return reduce(left, right); }
value   = number:$[0-9]+                      { return parseInt(number,10); }
        / '(' sum:sum ')'                     { return sum; }


