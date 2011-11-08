#!/bin/ruby
#Jerry Ramey 
#Execution of the neural network
 require 'ann.rb'
 require 'ann_functions.rb'

=begin
	#More of a general applivcation that will be used later
 #Obtaing the amount of desired hiddden nodes for only one hidden layer
 puts "Desired amount of hidden nodes?"
 hidden_nodes=gets.to_i

 #Obtainging the file name of the training data
 puts "What is the file name of the training data?"
 input_file=STDIN.gets.chomp()

 #Opening the file and extracting the training data
 inputs=File.open(input_file)
 #Declairng an array of Dendrites for input

 dentrite_array=Array.new
 inputs.each do
 	|values|
 	puts values
 	dentrite_array.push(Dendrite.new.dendrites(values.scan(/\d*\.\d/)[0].to_f))
 	dentrite_array.push(Dendrite.new.dendrites(values.scan(/\d*\.\d/)[1].to_f))
 	dentrite_array.push(Dendrite.new.dendrites(values.scan(/\d*\.\d/)[2].to_f))
 end
=end

def build_network(inputs,outputs,training_iteration)

#Declaring the Synapse or outputs 
synapse_1=Synapse.new
synapse_2=Synapse.new
synapse_3=Synapse.new

#Declairing the Dendrites or input nodes
dendrite_1=Dendrite.new
dendrite_2=Dendrite.new
dendrite_3=Dendrite.new

#Setting the value of the Dendrites
dendrite_1.value(inputs[0])
dendrite_2.value(inputs[1])
dendrite_3.value(inputs[2])

#Declairing the Neurons (hidden nodes)
neuron_1=Neuron.new
neuron_2=Neuron.new

connections_array=Array.[](neuron_1,neuron_2)

#Setting up the the connectiosn between dendrites and neurons 
dendrite_1.axon(connections_array)
dendrite_2.axon(connections_array)
dendrite_3.axon(connections_array)

#Setting up the dendrite weights
if training_iteration == 0
dendrite_1.weight(connections_array)
dendrite_2.weight(connections_array)
dendrite_3.weight(connections_array)
end
#Printing the intial weights of the dendrites
puts "dendrite_1 #{dendrite_1.print_weight}"
puts "dendrite_2 #{dendrite_2.print_weight}"
puts "dendrite_3 #{dendrite_3.print_weight}"
#Storing all the dendrites in one location
dendrites_array=Array.[](dendrite_1,dendrite_2,dendrite_3)

#Obtaining the values for nuerons
neuron_1.value(dendrites_array,1)
neuron_2.value(dendrites_array,2)

#Setting up the connections between the neurons and synapses 
connections2_array=Array.[](synapse_1,synapse_2,synapse_3)
neuron_1.axon(connections2_array)
neuron_2.axon(connections2_array)

#Setting up the neuron weights

	if training_iteration == 0
		neuron_1.weight(connections2_array)
		neuron_2.weight(connections2_array)
	end

#Printing the intial weights of the neurons
puts "neuron_1 #{neuron_1.print_weight}"
puts "neuron_2 #{neuron_2.print_weight}"


#Storing all the neurons in an array
neurons_array=Array.[](neuron_1,neuron_2)

#Obtaining the final out put values
synapse_1.value(neurons_array,1)
synapse_2.value(neurons_array,2)
synapse_3.value(neurons_array,3)

synapse_array=Array.[](synapse_1,synapse_2,synapse_3)


#Network Has Been Built 
#Back Tracking 
weight_adjustment_outputs(0.5,synapse_array,outputs,neurons_array)
weight_adjustment_inputs(inputs,dendrites_array)
#Printing the intial weights of the dendrites after backprop
puts "Results after backpropagation:"
puts "dendrite_1 #{dendrite_1.print_weight}"
puts "dendrite_2 #{dendrite_2.print_weight}"
puts "dendrite_3 #{dendrite_3.print_weight}"

#Printing the intial weights of the neurons after backprop
puts "Results after backpropagation:"
puts "neuron_1 #{neuron_1.print_weight}"
puts "neuron_2 #{neuron_2.print_weight}"
#Prinitng the Synapse values
for i in 0...synapse_array.size
puts "For Output Node #{i} the value is: #{synapse_array[i].print_value}"
end
end












