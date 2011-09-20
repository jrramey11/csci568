#!/bin/ruby
#similarity.rb
#Jerry Ramey 
#9/19/2011

#Contains the functions of Euclidean Distance, SMC, Jaccard, Pearson Correlation Coefficient, Cosine Similarity
# and Tanimoto

#Euclidean Distance 
def euclidean(xy1,xy2)
	#Determing the largets value in each array in order to normalize the result
	largestx=xy1[0]
	largesty=xy2[0]
	for i in 1...xy1.length()
		if largestx < xy1[i]
			largestx = xy1[i]
		end
		if largesty < xy2[i]
			largesty = xy2[i]
		end
	end
	#Setting the largest value of the two arrays to a floating point number for division 
	xnorm= largestx.to_f
	ynorm= largesty.to_f
	distance=0
	# Calculating the distance of the two arrays by calculating the distance between each array values
	#and adding that to a total distance value. Summation on page 69 of Data Mining. 
	for i in 0...xy1.length()
		xk=xy1[i]/xnorm
		yk=xy2[i]/ynorm
		distance=distance + ((xk-yk)**2)
	end
	#d= Math.sqrt(((xy2[0] - xy1[0]) ** 2) + ((xy2[1] - xy1[1]) ** 2))
	return distance
end
	
#Simple Matching Coefficient 
def smc(x,y)
	#$etting out values of F00, F11, F01, and F10 in order to be used for calculation 
	foo=0
	fll=0
	flo=0
	fol=0
	#Calculating the values of F in order to be used for SMC calculation. If x=y and x and y = 0 then F)) will be
	#incremented by 1. If x=y and x and y = 1 then F11, if x < y F01 will be incremented. 
	for i in 0...x.length
			if x[i]==y[i]
				if x[i]==0
					foo=foo+1
				end
				if x[i]==1
					fll=fll+1
				end
			end
			if x[i]>y[i]
					flo=flo+1
			end
			if x[i]<y[i]
					fol=fol+1
			end
	end
	#Calculating the SMC by the equation givin on page 73 of Data Mining 
	s=((foo+fll).to_f)/((fll+foo+fol+flo).to_f)
	return s	
end

#Jaccard 
def jaccard(x,y)
	#Implemented in the same manner as SMC, however values that are  0 0 are ignored, so the eqution does not use 
	# the F00 values. 
	fll=0
	flo=0
	fol=0
	for i in 0...x.length
			if x[i]==y[i]
				if x[i]==1
					fll=fll+1
				end
			end
			if x[i]>y[i]
					flo=flo+1
			end
			if x[i]<y[i]
					fol=fol+1
			end
	end
	#Calculating the Jaccard value by the equation on page 74 of Data Mining
	s=(fll.to_f)/((fll+fol+flo).to_f)
	return s	
end
#Cosine Similarity 
def cos(x,y)
	#Declaring intial values for x dot y, ||x|| (lengthx), and ||y|| (lengthy)
	xdoty=0
	lengthx=0
	lengthy=0
	# This is calculating the lengths and x dot y to be used in the cosine equation. 
	for i in 0...x.length
		xdoty=xdoty + (x[i] * y[i])
		lengthx= lengthx + (x[i] * x[i])
		lengthy= lengthy + (y[i] * y[i])
	end
	#Finishing the calcualtion of the lengths by squaring the values
	lengthx= Math.sqrt(lengthx)
	lengthy= Math.sqrt(lengthy)
	#Calculating the cosine value by using the equation on page 75 of Data Mining. 
	cosxy= (xdoty.to_f)/(lengthx * lengthy)
	return cosxy
end
#Pearson Correlation Coefficient 
def pearson(x,y)
	#Setting up the values used to calculated the mean values of x and y, standard dev., and covarience. 
	xmean=0
	ymean=0
	covarience=0
	stdx=0
	stdy=0
	#Calculating the mean value of x and y
	for i in 0...x.length
		xmean=xmean+x[i]
		ymean=ymean+y[i]
	end
	xmean=(xmean.to_f)/(x.length.to_f)
	ymean=(ymean.to_f)/(y.length.to_f)
	#Calculating covarience and standard dev
	for i in 0...x.length
		covarience=covarience + ((x[i]-xmean)*(y[i]-ymean))
		stdx= stdx + ((x[i]-xmean)**2)
		stdy= stdy + ((y[i]-ymean)**2)
	end
	#Finishing the calculationg of Pearsons by the equation on page 77 of Data Mining 
	covarience= (covarience.to_f)/((x.length-1).to_f)
	stdx= (stdx.to_f)/((x.length-1).to_f)
	stdy= (stdy.to_f)/((y.length-1).to_f)
	corr= covarience/(stdx * stdy)
	return corr
end
#EXTRA: Tanimoto Coefficient 
def tanimoto(x,y)
	#Executed similary to Cosine 
	#Setting up the values for ||x||, ||y||, and x dot y
	xdoty=0
	lengthx=0
	lengthy=0
	#Calculating the x dot y, ||x||, and ||y||
	for i in 0...x.length
		xdoty=xdoty + (x[i] * y[i])
		lengthx= lengthx + (x[i] * x[i])
		lengthy= lengthy + (y[i] * y[i])
	end
	lengthx= Math.sqrt(lengthx)
	lengthy= Math.sqrt(lengthy)
	# Claculating the tanimoto value by the equation on page 76 of Data Mining
	tan= (xdoty.to_f)/(((lengthx **2)+(lengthy **2) -xdoty).to_f)
	return tan
end


#Testing the Euclidean Distance 
xy1=[1,2,3,4,5]
xy2=[5,6,7,8,9]
print "Euclidean Distance: "
puts euclidean(xy1,xy2)
print "\n"

#Testing the SMC Distance
x=[0,0,1,1,1,0,1]
y=[1,0,1,0,1,0,1]
print "SMC: "
puts smc(x,y)
print "\n"

#Testing the JAccard with the previous xy values
print "Jaccard: "
puts jaccard(x,y)
print "\n"

#Testing the Cosine 
x=[3,2,0,5,0,0,0,2,0,0]
y=[1,0,0,0,0,0,0,1,0,2]
print "Cosine: "
puts cos(x,y)
print "\n"

#Testing the Pearson Correlation 
x=[-3,-2,-1,0,1,2,3]
y=[9,4,1,0,1,4,9]
print "Pearson: "
puts pearson(x,y)
print "\n"

#Testing the Tanimoto (Extra)
x=[3,2,0,5,0,0,0,2,0,0]
y=[1,0,0,0,0,0,0,1,0,2]
print "Tanimoto: "
puts tanimoto(x,y)
print "\n"