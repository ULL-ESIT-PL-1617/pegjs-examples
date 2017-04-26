{
  var sum;
  var initsum = function(first) { 
    sum = first; 
    return true; 
  };
  var add = function(op, p) {
    console.log(op);
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
    console.log(sum);
    return true;
  };
  var prod;
  var initprod = function(first) { 
    prod = first; 
    return true; 
  };
  var mult = function(op, p) {
    console.log(op);
    switch(op) {
        case '*':
            prod *= p; 
            break;
        case '/':
            prod /= p; 
            break;
        default:
            error('"*" or "/" expected');
    }
    console.log(prod);
    return true;
  };
}

sum     = first:product &{ return initsum(first); } 
          (op:[+-] product:product & { return add(op, product); })* { return sum; } 
product = first:value &{ return initprod(first); } 
          (op:[*/] value:value & { return mult(op, value); })* { return prod; } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }


