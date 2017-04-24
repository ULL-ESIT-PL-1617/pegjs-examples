PEG = require('pegjs')
coffee = require 'pegjs-coffee-plugin'
grammar = '''
start = a: [aeiou\u2661]i . [^x-z] 
'''
parser = PEG.buildParser(grammar, plugins: [coffee])
r = parser.parse('Abr')
console.log r
r = parser.parse('♡br')
console.log r
