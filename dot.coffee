PEG = require('pegjs')
coffee = require 'pegjs-coffee-plugin'
grammar = '''
start = a: ..
'''
parser = PEG.buildParser(grammar, plugins: [coffee])
r = parser.parse('Ab')
console.log r
parser = PEG.buildParser(grammar, plugins: [coffee])
r = parser.parse("\n\t")
console.log r
