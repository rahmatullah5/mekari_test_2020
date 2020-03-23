#!/usr/bin/env ruby
require 'test/unit'
require_relative './reciter'

class AlphaTest < Test::Unit::TestCase
	def test_with_valid_line_parameter
		assert_equal 'the house that Jack built', Reciter.new('1').call
		assert_equal 'the malt that lay in the house that Jack built', Reciter.new('2').call
		assert_equal 'the rat that ate the malt that lay in the house that Jack built', Reciter.new('3').call
		assert_equal 'the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('4').call
		assert_equal 'the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('5').call
		assert_equal 'the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('6').call
		assert_equal 'the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('7').call
		assert_equal 'the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('8').call
		assert_equal 'the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('9').call
		assert_equal 'the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('10').call
		assert_equal 'the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('11').call
		assert_equal 'the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built', Reciter.new('12').call
	end
	
	def test_with_valid_line_and_subject_parameter
		assert_equal 'jack', Reciter.new('1', 'n', 'y').call
		assert_equal 'the malt, jack', Reciter.new('2', 'n', 'y').call
		assert_equal 'the rat, the malt, jack', Reciter.new('3', 'n', 'y').call
		assert_equal 'the cat, the rat, the malt, jack', Reciter.new('4', 'n', 'y').call
		assert_equal 'the dog, the cat, the rat, the malt, jack', Reciter.new('5', 'n', 'y').call
		assert_equal 'the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('6', 'n', 'y').call
		assert_equal 'the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('7', 'n', 'y').call
		assert_equal 'the man, the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('8', 'n', 'y').call
		assert_equal 'the priest, the man, the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('9', 'n', 'y').call
		assert_equal 'the rooster, the priest, the man, the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('10', 'n', 'y').call
		assert_equal 'the farmer, the rooster, the priest, the man, the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('11', 'n', 'y').call
		assert_equal 'the horse and the hound and the horn, the farmer, the rooster, the priest, the man, the maiden, the cow, the dog, the cat, the rat, the malt, jack', Reciter.new('12', 'n', 'y').call
	end

	def test_with_valid_line_and_randomize_parameter
		#test comment out because cant expect the outcome
		#assert_equal 'some random message', Reciter.new('1', 'y', 'y').call
	end

	def test_with_invalid_line_parameter
		assert_equal 'Recite line value should between 0 and 12', Reciter.new('0').call
		assert_equal 'Recite line value should between 0 and 12', Reciter.new('13').call
		assert_equal 'Recite line value should between 0 and 12', Reciter.new('-1').call
		assert_equal 'Recite line value should between 0 and 12', Reciter.new('!@#$%^&*()').call
	end

	def test_with_invalid_randomize_parameter
		assert_equal 'Randomize value should be "n" or "y"', Reciter.new('1', 'a').call
		assert_equal 'Randomize value should be "n" or "y"', Reciter.new('1', '10').call
		assert_equal 'Randomize value should be "n" or "y"', Reciter.new('1', '-1').call
		assert_equal 'Randomize value should be "n" or "y"', Reciter.new('1', '!@#$%^&*()').call
	end

	def test_with_invalid_subject_parameter
		assert_equal 'Subject condition value should be "n" or "y"', Reciter.new('1', 'n', 'a').call
		assert_equal 'Subject condition value should be "n" or "y"', Reciter.new('1', 'n', '10').call
		assert_equal 'Subject condition value should be "n" or "y"', Reciter.new('1', 'n', '-1').call
		assert_equal 'Subject condition value should be "n" or "y"', Reciter.new('1', 'n', '!@#$%^&*()').call
	end	
end