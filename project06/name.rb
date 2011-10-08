#!/bin/ruby
#Jerry Ramey 
#Project 6
#October 4, 2011

input=File.open("winners_losers.csv")

winners=Array.new
losers=Array.new
testwinners=Array.new
testlosers=Array.new
vowelcount=Array.new 

input.each do
	|name|
if name.match(/\+/)
	winners.push(name.scan(/\w+	#(?:\.\s{1}\w+\.\s{1}\w+)?(?:\.\s{1}\w+\s{1}\w+)?(?:\s{1}\w+\s{1}\w+)?(?:\-\w+\s{1}\w+)?(?:\-\w+\s{1}\w+)?(?:\s{1}\w+\-\w+)?(?:\s{1}\w+\.\s{1}\w+)?(?:\s{1}\w+)?/)

	
else
	losers.push(name.scan(/\w+(?:\.\s{1}\w+\.\s{1}\w+)?(?:\.\s{1}\w+\s{1}\w+)?(?:\s{1}\w+\s{1}\w+)?(?:\-\w+\s{1}\w+)?(?:\-\w+\s{1}\w+)?(?:\s{1}\w+\-\w+)?(?:\s{1}\w+\.\s{1}\w+)?(?:\s{1}\w+)?/))
end
end

winners.length.times do |i|
	print winners[i], "\n"
end
print ".........................................\n"
losers.length.times do |i|
	print losers[i], "\n"
end



input.close()
input=File.open("winners_losers.csv")

input.each do
	|name|
	first=name.scan(/\w+/)[0].to_s
	
if first.scan(/[A-Z][a,e,i,o,u]/)[0]
testwinners.push(first)
end
end


 testwinners.length.times do |i|
 	print testwinners[i], "\n"
 end
print "the difference between the two arrays ", winners - testwinners , "\n"

print "Count of comaprison ", testwinners.length, " The real data ", winners.length, "\n"
print "Accuracy ", testwinners.length.to_f/winners.length.to_f, "\n"


