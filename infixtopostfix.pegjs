{  /* pegjs infixtopostfix.pegjs; ./use_infix2postfix.js 2*(3-4)-5 */

  const util = require('util');

  function reduce(left, right) {
    var sum = left;
    right.forEach((r,_) => {
      let [op, num] = r; // node --harmony_destructuring
       sum += ` ${num} ${op}`;
    });
    return sum;
  }
}

sum     = left:product right:($[+-] product)* { return reduce(left, right); }
product = left:value   right:($[*/] value)*   { return reduce(left, right); }
value   = number:$[0-9]+                      { return number; }
        / '(' sum:sum ')'                     { return sum; }



