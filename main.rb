require_relative  './reciter.rb'

puts 'Recite Line :'
recite_line = gets

puts 'Randomize value (y/n) ?'
randomize = gets

puts 'only subject from the recited line (y/n) ?'
subject_only = gets

puts Reciter.new(recite_line, randomize, subject_only).call