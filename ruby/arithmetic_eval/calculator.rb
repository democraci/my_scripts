require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: calculator.rb [options]"

  opts.on("-f FILE", "--file FILE", "calculator expression in file FILE") do |file|
    options[:file] = file
  end
end.parse!

def calculate(line, flag) 
 if(line =~ %r{^\s*(\d+)\s*(\*|\+|-|/)\s*(\d+)\s*})
 	a = $1.to_i
 	b = $3.to_i
 	operator = $2
 	if(b == 0 && operator == "/")
 		puts "#{a} / #{b} : divisor cannot be zero" if flag
 		puts "divisor cannot be zero" if !flag
 		return
 	end
 	print "#{a} #{operator} #{b} = " if flag
 	result = nil
 	case operator
 		when "*" then result = a * b
 		when "+" then result = a + b
 		when "-" then result = a - b
 		when "/" then result = a / b
 	end
 	puts result
 else
  puts "illegal expression, expression must in form 'a +|-|*|/ b'"
 end
end

if(options[:file] != nil)
	puts "gonna calculate expression in file : #{options[:file]}"
	file = nil
	begin
		file = File.open(options[:file])
		file.each_line do |line|
			calculate line, true
		end
	rescue
		puts "error:#{$!}"
	ensure
		file.close if file != nil
	end
else
	line = "empty"
	while true
		print "input expression>"
		line = gets.chomp
		break if line =~ /exit|quit/
		calculate line, false
	end
end


