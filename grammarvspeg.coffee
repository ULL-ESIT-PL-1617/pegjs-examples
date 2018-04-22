#!/usr/bin/env coffee
PEG = require 'pegjs'
coffee = require 'pegjs-coffee-plugin'
grammar = """
  a =  b 'c'
  b = 'b' / 'b' 'a'   
"""
parser = PEG.generate grammar, plugins: [coffee]
r = parser.parse "bc"
console.log("r = #{r}")
try
  r = parser.parse "bac"
  console.log("r = #{r}")
catch e
  console.log(e.message)

#  this works 
grammar = """
  a =  b 'c'
  b = 'b' 'a' / 'b'   
"""
parser = PEG.generate grammar, plugins: [coffee]
try
  r = parser.parse "bac"
  console.log("r = #{r}")
catch e
  console.log(e.message)
