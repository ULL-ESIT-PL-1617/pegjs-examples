{
  var sum = 0;
  var initsum = function(first) { 
    sum = first; 
    return true; 
  };
  var add = function(op, p) {
    switch(op) {
        case '+':
            sum += p; 
            break;
        case '-':
            sum -= p; 
            break;
        default:
            error('"+" or "-" expected');
    }
    return true;
  };
}

sum     = first:value &{ return initsum(first); } 
          (op:[+-] product:value & { return add(op, product); })* { return sum; } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }


