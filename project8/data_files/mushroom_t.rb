#!/bin/ruby

input = File.open("mushroom_binary.csv")
output_even = File.open("mushroom_training.csv", "w")
output_odd = File.open("mushroom_test.csv", "w")

x=1
input.each do
	|line|
	if  x ==1 
		output_even.puts line
		x=2
	else
		output_odd.puts line
		x=1
	end
end