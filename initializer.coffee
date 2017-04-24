PEG = require('pegjs')
coffee = require 'pegjs-coffee-plugin'
grammar = '''
   {                             
     util = require("util")     
     @g = "visible variable" 
     console.log("Inside Initializer! options = "+util.inspect(options))
   }                             
   start = 'a' { console.log(@g); 1 } 
         / &   { 
                 console.log("inside predicate: '#{@g}''")
                 true 
               } 'b' { 2 }
'''
parser = PEG.buildParser(grammar, plugins: [coffee])
r = parser.parse('a', x: 'hello')
console.log r
r = parser.parse('b')
console.log r
