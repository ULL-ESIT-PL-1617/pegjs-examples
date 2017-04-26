{
  var RuleVar = require('./pegjs-rule-var.js');
  var stack = new RuleVar();
  var action = function() {
    var val2 = stack.pop();
    var op = stack.pop();
    var val1 = stack.pop();
    if (stack.debug) console.log('Action!: '+`${val1} ${op} ${val2}`); 
    stack.push(eval(`${val1} ${op} ${val2}`)); 
  }
}

sum     = first:product &{ return stack.push(first); } 
          (op:[+-] product:product & { stack.push(op, product); return stack.add(action); })* { return stack.pop(); } 
product = first:value &{ return stack.push(first); } 
          (op:[*/] value:value & { stack.push(op, value); return stack.add(action); })* { return stack.pop(); } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }


