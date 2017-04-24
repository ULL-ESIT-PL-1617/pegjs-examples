PEG = require('pegjs')
coffee = require 'pegjs-coffee-plugin'
grammar = '''
   {                             
     @util = require("util")     
     @g = "visible variable" 
     console.log("Inside Initializer! options = "+@util.inspect(options))
   }                             
   start = 'a' { console.log(@g); 1 } 
         / c:'c' '\\n' &   { 
                       console.log("inside predicate: @g = '#{@g}' c = '#{c}'")
                       console.log("options = #{@util.inspect(options)}")
                       console.log("offset = #{offset()}")
                       console.log("line = #{line()}")
                       console.log("column = #{column()}")
                       true 
                     } 'b' { 2 }
'''
parser = PEG.buildParser(grammar, plugins: [coffee])
r = parser.parse('a', x: 'hello')
console.log r
r = parser.parse("c\nb", y : 'world')
console.log r
