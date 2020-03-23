#!/usr/bin/env ruby
class Reciter
	attr_accessor :lyrics, :error_status, :error_message
	attr_reader :recite_line, :randomize, :subject_only
	def initialize(line = 1, randomize='n', subject_only='n')
		@recite_line = line.to_i
		@lyrics = get_lyrics
		@randomize = randomize.strip.downcase
		@subject_only = subject_only.strip.downcase
		@error_status = false
		@error_message = ''
	end

	def call
		validate_params
		return error_message if error_status
		if randomize.eql?('n')
			@lyrics = lyrics[(lyrics.length - recite_line)..-1]
		elsif randomize.eql?('y')
			@lyrics = lyrics.shuffle[(lyrics.length - recite_line)..-1]
		end

		if subject_only.eql?('n')
			return lyrics.map{|line| line[:line]}.join(' ') 
		elsif subject_only.eql?('y')
			return get_subjects_based_on_lyrics
		end 
	end

	private
	def validate_params
		if recite_line > 12 || recite_line <= 0
			@error_message = 'Recite line value should between 0 and 12'
			@error_status = true
			return
		end

		unless randomize.eql?('y') || randomize.eql?('n')
			@error_message = 'Randomize value should be "n" or "y"'
			@error_status = true
			return
		end

		unless subject_only.eql?('y') || subject_only.eql?('n')
			@error_message = 'Subject condition value should be "n" or "y"'
			@error_status = true
			return
		end
	end
	
	def get_lyrics
		lines = []
		File.open("lyrics.txt", "r") do |f|
			f.each_line do |line|
				line = line.split(',')
				lines << {id: line[0], line: line[1].strip}
			end
		end
		return lines
	end

	def get_subjects_based_on_lyrics
		lyrics.map{|line| get_subjects.select{|subject| subject[:id].eql?(line[:id])}.map{|subject| subject[:subject]}}.join(', ')
	end

	def get_subjects
		subjects = []
		File.open("subjects.txt", "r") do |f|
			f.each_line do |line|
				line = line.split(',')
				subjects << {id: line[0], subject: line[1].strip}
			end
		end
		return subjects
	end
end