{
  var stack = [];
  var initstack = function(first) { 
    stack.push(first); 
    return true; 
  };
  var add = function(op, p) {
    //console.log(op);
    try {
      eval(`stack[stack.length-1] ${op}= p`); 
    }
    catch(e) {
      console.log(e.message);
    }
    /*
     switch(op) {
        case '+':
            stack[stack.length-1] += p; 
            break;
        case '-':
            stack[stack.length-1] -= p; 
            break;
        case '*':
            stack[stack.length-1] *= p; 
            break;
        case '/':
            stack[stack.length-1] /= p; 
            break;
        default:
            error('"+" or "-" or "*" or "/" expected');
    }
    */
    console.log(stack);
    return true;
  };
}

sum     = first:product &{ return initstack(first); } 
          (op:[+-] product:product & { return add(op, product); })* { return stack.pop(); } 
product = first:value &{ return initstack(first); } 
          (op:[*/] value:value & { return add(op, value); })* { return stack.pop(); } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }


