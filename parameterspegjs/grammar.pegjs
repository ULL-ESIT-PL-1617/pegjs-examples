{
    var Parser = this;
}
start 
  = Variable

Variable
 = symbol:$([A-z_\$][A-z0-9_\$]*) { return Parser.symbols[symbol]; }
