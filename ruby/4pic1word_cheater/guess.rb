require 'optparse'


def comform? num, letters, word
	return false if(word.size != num)
	flags = Array.new(letters.size, false)
	rtn = true
	word.each_char do |c|
		found = false
		for i in 0...(letters.size)
			if(letters[i] == c && !flags[i])
				flags[i] = true
				found = true
				break
			end
		end
		if(!found)
			rtn = false
			return rtn
		end
	end
	rtn
end


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: guess.rb [options]"

  opts.on("-f FILE", "--file FILE", "specific the english word list data file") do |file|
    options[:file] = file
  end
end.parse!

file_path = "#{File.dirname(__FILE__)}/data"
puts "#{file_path} #{file_path.class}"
options[:file] ||= file_path
	
puts "enter your problem(number first, letter after, like 3catdogfish), or exit to quit the program"
while true
	print ">"
	problem = gets.chomp
	break if problem =~ /exit/
	if problem =~ /(\d+)([a-z]+)/
		num = ($1).to_i
		letters = $2
		begin
			file = nil
			file = File.open(options[:file])
			file.each_line do |line|
				print line if comform?(num, letters, line.chomp)
			end
		rescue
			puts "error:#{$!}"
		ensure
			file.close if file != nil
		end
	else
		puts "illegal input, must one number, then letters after, like 3catdogfish"
	end
end
