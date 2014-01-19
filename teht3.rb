#!/usr/bin/env ruby

def combine_anagrams(words)
  results = Hash.new([])
  words.each do |word|
    w = word.downcase.chars.sort.join
	results[w] ? results[w] += [word] : results[w] = [word]
  end
  results.values
end

if __FILE__ == $0
	puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).inspect
end


