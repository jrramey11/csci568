#!/bin/ruby
#main interaction for the ANN
require 'nn.rb'
#Training Data
inputs=Array.[](1.0,0.25,-0.5)
outputs=Array.[](1.0,-1.0,0.0)

#0 is letting the function know that the network has not been built yet. 
	build_network(inputs,outputs,0)


