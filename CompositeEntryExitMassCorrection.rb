#Composite Correction Script
require 'fileutils'

# Initialize data file
file =File.new("May22CombinedList.csv","r")

#line by line reading text file
while (line =file.gets)
	#Variable declaration I	
	iComma = line.index(',')
	iLine = line.index('|')
	iStrLen = line.length

	#String variables I
	fileName = line[0,iComma]
	textToReplace = line[iLine+1,iStrLen]
	line2 = line.slice(iComma+1,iLine)

	#Variable declaration II	
	iLine2 = line2.index('|')
	iComma2 = line.index(',')

	#String variables II	
	textToSearch = line2[0,iLine2]
	
	# Reading composite file 	
	text = File.read(fileName)

	#Removing CR from string to replace
	textToReplace =textToReplace.split.join("\n")+','
	
	#Using two strings and string replacement gsub function to search one to replace
	#with other into a third variable -- replace
	replace = text.gsub(textToSearch, textToReplace)

	#Write replace variable to file
	File.open(fileName, "r+") { |file| file.write(replace) }
	
	FileUtils.cp fileName, '.\Modified'
	
	#puts line, line2, textToSearch, textToReplace 
	
	
end
file.close