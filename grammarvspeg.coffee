#!/usr/bin/env coffee
PEG = require 'pegjs'
coffee = require 'pegjs-coffee-plugin'
grammar = """
  a =  b 'c'
  b = 'b' / 'b' 'a'   
"""
parser = PEG.buildParser grammar, plugins: [coffee]
r = parser.parse "bc"
console.log("r = #{r}")
r = parser.parse "bac"
console.log("r = #{r}")
