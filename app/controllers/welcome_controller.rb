require 'tokenizer'

class WelcomeController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:upload_tokenized, :upload_untokenized]

  def index
  end

  def setup_project
  end

  def upload_untokenized
  	file_data =  params[:files][0]

  	success = true
	if file_data.respond_to?(:read)
	  xml_contents = file_data.read
	elsif file_data.respond_to?(:path)
	  xml_contents = File.read(file_data.path)
	else
	  success = false # "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
	end


	tokenizer = Tokenizer::WhitespaceTokenizer.new

	sentences = xml_contents.split("\n")

	total_tokens = 0

	sentences.each do |s|
		tokens = tokenizer.tokenize(s)
		total_tokens += tokens.length
		puts "------"
	end



	puts "<><><><><><>"
	#puts xml_contents
	puts "<><><><><><>"

	respond_to do |format|
		format.json { render json: {"success": success, "total_tokens": total_tokens } }
	end
  end

  def upload_tokenized

  	file_data =  params[:files][0]

  	success = true
	if file_data.respond_to?(:read)
	  xml_contents = file_data.read
	elsif file_data.respond_to?(:path)
	  xml_contents = File.read(file_data.path)
	else
	  success = false # "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
	end


	puts "<><><><><><>"
	#puts xml_contents
	puts "<><><><><><>"

	respond_to do |format|
		format.json { render json: {"success": success } }
	end
  end
end
