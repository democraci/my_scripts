require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: dcb.rb generate seven numbers for famous chinese lotus double color balls"
end.parse!

	
puts "enter ip form"
while true
	print ">"
	cmd = gets.chomp
	if cmd =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)/
		if( $1.to_i > 256 || $2.to_i > 256 || $3.to_i > 256 || $4.to_i > 256)
			puts "illegal ipv4 form"
		else
			rst = ($1.to_i << 24)
			rst += ($2.to_i << 16)
			rst += ($3.to_i << 8)
			rst += $4.to_i
			puts rst
		end
	elsif cmd =~ /^exit$/
		break
	else
		puts "illegal ipv4 form"
	end
end
