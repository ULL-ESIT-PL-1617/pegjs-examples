/* a local variable per syntactic variable */
  function RuleVar() {
    this.stack = []; 
    this.debug = false;
    return true; 
  }
  
  RuleVar.prototype.push = function() {
    var that = this;
     [].slice.call(arguments).forEach( function(value) {
      that.stack.push(value);
    });
    if (this.debug) console.log("push: ",this.stack);
    return true;
  }

  RuleVar.prototype.add = function(action) {
    try {
      action(); 
      if (this.debug) console.log(this.stack);
    }
    catch(e) {
      console.log('Error! '+e.message);
    }
    return true;
  };

   RuleVar.prototype.pop = function() {
     return this.stack.pop();
   }

   RuleVar.prototype.top = function(depth) {
     var d = this.stack.length  - (depth+1);
     return this.stack[d];
   }

module.exports = RuleVar;
