PEG = require 'pegjs'

grammar = """
a = a:$'a'+ 
    & { console.log("acción intermedia. a = "+a); return true; } 
    b:$'b'+ { 
             console.log("acción final. b = "+b); 
             return text();
          }
"""
parser = PEG.buildParser grammar
r = parser.parse "aabb"
console.log("r = #{r}")
