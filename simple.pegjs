/* From the Wikipedia
Value   ← [0-9]+ / '(' Expr ')'
Product ← Value (('*' / '/') Value)*
Sum     ← Product (('+' / '-') Product)*
Expr    ← Sum
*/
{ 
  const util = require('util');

  function reduce(left, right) {
    console.log(`left = ${util.inspect(left)} right = ${util.inspect(right)}`); 
    var sum = left;
    // console.log("sum = "+sum);
    right.forEach((r,_) => {
      let [op, num] = r; // node --harmony_destructuring
      // console.log(op);
      // console.log(num);
      eval(`sum ${op}= num`);
      /*
      switch(op) {
        case '+' : sum += num; break;
        case '-' : sum -= num; break;
        case '*' : sum *= num; break;
        case '/' : sum /= num; break;
        default : console.log("Error! "+op);
      }
      */
      // console.log("sum = "+sum);
    });
    return sum;
  }
}

sum     = left:product right:($[+-] product)* { return reduce(left, right); }
product = left:value   right:($[*/] value)*   { return reduce(left, right); }
value   = number:$[0-9]+                      { return parseInt(number,10); }
        / '(' sum:sum ')'                     { return sum; }


