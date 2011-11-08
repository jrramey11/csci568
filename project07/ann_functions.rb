#!/bin/ruby 
#ann functions

require 'ann.rb'

#Calculates the activation function for weights and values
def activation(dendrites, nueron_number)
	weights=Array.new
	total_value=0
	for i in 0...dendrites.size
		value=dendrites[i].print_value 
		weights=dendrites[i].print_weight
		total_value=total_value + (weights[nueron_number-1]*value)
	end
	return total_value
end
#calculates the sigmoidal function
def sigmoidal(activation_value)
	neuron_value=1/(1 + 2.71828 ** activation_value)
	return neuron_value
end
#Adjusting the weights from the second connections of hidden nodes to the outputs
def weight_adjustment_outputs(learning_rate,synapse,output_desired,neurons_array)
	
	for i in 0...neurons_array.size
		delta=Array.new	
		for j in 0...synapse.size 
		delta.push(-2*learning_rate*(synapse[j].print_value - output_desired[j])*synapse[j].print_value*(1-synapse[j].print_value)*neurons_array[i].print_value)
		end
		neurons_array[i].adjust_weight(delta)
	end
end
#Adjusting the weights from the first connections of inputs and hidden nodes
def weight_adjustment_inputs(inputs,dendrites)
	for i in 0...inputs.size
		new_weights=Array.new
		old_weights=Array.new
		old_weights=dendrites[i].print_weight
		for j in 0...old_weights.size
			new_weights.push(inputs[i]*(1-inputs[i])*old_weights[j])
		end
		dendrites[i].adjust_weight(new_weights)
	end
	end
