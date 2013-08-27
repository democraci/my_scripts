require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: dcb.rb generate seven numbers for famous chinese lotus double color balls"
end.parse!

	
puts "enter arbitrary key to generate numbers, or 'exit' to quit the program"
while true
	print ">"
	cmd = gets.chomp
	if cmd =~ /^exit$/
		break
	else
		red_selected = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33]
		red_selected.shuffle!
		puts "red: #{red_selected[0]} #{red_selected[1]} #{red_selected[2]} #{red_selected[3]} #{red_selected[4]} #{red_selected[5]}"
		puts "blue: #{rand(15)+1}"
	end
end
