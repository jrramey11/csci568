#!/bin/ruby
#Jerry Ramey 
#Mushroom.rb
#Mushroom Mining 


#Opening the files for binarization 

infile = File.open("mushroom.csv")
outfile = File.open("mushroom_binary2.csv", "w")

infile.each do
	|line|
	#Classification 
	x=line.scan(/[a-z]/)[0]
	if x == 'p'
		outfile.print "1,"
	else
		outfile.print "0,"
	end

	#Cape Shape
	x=line.scan(/[a-z]/)[1]
	if x == 'c'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 's'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end

	#Cap Surface
	x=line.scan(/[a-z]/)[2]
	if x == 'g'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Cap Color
	x=line.scan(/[a-z]/)[3]
	if x == 'r'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'u'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Odor 
	x=line.scan(/[a-z]/)[5]
	if x == 'a'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'l'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'c'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'y'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'f'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'm'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'p'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 's'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	#Gill attachment
	x=line.scan(/[a-z]/)[6]
	if x == 'a'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Gill Color 
	x=line.scan(/[a-z]/)[9]
	
	if x == 'b'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'r'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'o'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'e'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end

	#Stalk Root (Special Case of Missing)
	x=line.scan(/[a-z]|[?]/)[11]
	if x == 'c'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'r'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Stalk Color Above Ring 
	x=line.scan(/[a-z]/)[14]
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'b'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'c'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'g'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'o'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'e'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'y'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	#Stalk Color Below Ring 
	x=line.scan(/[a-z]/)[15]
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	if x == 'c'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	if x == 'o'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'p'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'e'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	if x == 'y'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Veil Color 
	x=line.scan(/[a-z]/)[17]
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'o'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'y'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Ring Type 
	x=line.scan(/[a-z]/)[19]
	
	
	if x == 'f'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'l'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Spure Print Color 
	x=line.scan(/[a-z]/)[20]
	
	if x == 'b'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	if x == 'r'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'o'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'u'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	if x == 'y'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	#Population
	x=line.scan(/[a-z]/)[21]
	if x == 'a'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	if x == 'n'
		outfile.print "1,"
	else 
		outfile.print "0,"
	end
	
	#Habitat
	x=line.scan(/[a-z]/)[22]
	
	if x == 'w'
		outfile.print "1"
	else 
		outfile.print "0"
	end
	
	outfile.puts

end

infile.close()
outfile.close()


#Reopening outfile 
input = File.open("mushroom_binary2.csv")
out_posion = File.open("mushroom_posion2.csv", "w")
out_edible = File.open("mushroom_edible2.csv", "w")

input.each do 
	|line|
	x=line.scan(/\d/)[0].to_i
	if x == 1
		out_posion.puts line
	else
		out_edible.puts line
	end
end





