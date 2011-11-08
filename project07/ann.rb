#!/ruby/bin
#Jerry Ramey 
#ann.rb

require 'ann_functions.rb'

class Dendrite
	value=0
	axons=Array.new
	weights=Array.new

	#Sets the value of value 
	def value(value)
		@value=value
	end
	#Returns the value of value
	def print_value
		return @value
	end

	#Filling the axon array (connection between dendrites and neurons)
	def axon(connections)
		@axons = connections
	end
	#Returns the values of axons 
	def print_axons
		return @axons
	end

	#Filling the weight array
	def weight(connections)
		weight_array=Array.new
		for x in 0...connections.size 
		weight_array[x]=(rand() * (rand(3)-1))
		end
		@weights = weight_array
	end
	#Returns the values of the weights
	def print_weight
		return @weights
	end
		#Weight adjustment 
		def adjust_weight(delta)
			weight_array=Array.new
			for x in 0...delta.size 
				weight_array[x]=delta[x]
			end
			@weights = weight_array
		end

end

class Neuron
		value=0
		#bias=bias
		axons=Array.new
		weights=Array.new
		error=0
		#Setting the value of the neuron
		def value(dendrites_array,num)
			x=activation(dendrites_array,num)
			@value=sigmoidal(x)
		end
		#Returns the value of value
		def print_value
			return @value
		end
		#Setting the connections 
		def axon(connections)
			@axons=connections
		end
		#Returns the array of connections 
		def print_axons
			return @axons
		end
		#Filling the weight array 
		def weight(connections)
			weight_array=Array.new
			for x in 0...connections.size 
				weight_array[x]=(rand() * (rand(3)-1))
			end
			@weights = weight_array
		end
		#Returns the values of the weights
		def print_weight
			return @weights
		end
		#Weight adjustment 
		def adjust_weight(delta)
			weight_array=Array.new
			for x in 0...delta.size 
				weight_array[x]=delta[x]
			end
			@weights = weight_array
		end


end

class Synapse

		value=value
		error=0
		#Setting the value of the neuron
		def value(dendrites_array,num)
			x=activation(dendrites_array,num)
			@value=sigmoidal(x)
		end
		#Returns the value of value
		def print_value
			return @value
		end
	
end

