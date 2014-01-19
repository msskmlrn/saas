#!/usr/bin/env ruby
def palindrome?(string)
	s = string.downcase.gsub(/[\W]/, "")
	s.eql?(s.reverse)
end

def count_words(string)
	h = Hash.new
	string.downcase.scan(/\b\w+\b/) do |word|
    	h[word] ? h[word] += 1 : h[word] = 1
  	end
	h
end


if __FILE__ == $0
	p palindrome?("A man, a plan, a canal -- Panama"),"\n"  #=> true
	p palindrome?("Madam, I'm Adam!"),"\n"  # => true
	p palindrome?("Abracadabra"),"\n"  # => false (nil is also ok)

	p count_words("A man, a plan, a canal -- Panama"), "\n"
	p count_words("Doo bee doo bee doo"), "\n"	
end
