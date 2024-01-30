require "open-uri"
class GamesController < ApplicationController


  def new
    @array_letters = Array.new(10) {|e| e = (("a".."z").to_a).sample}
  end
  def score
    @word = params[:word]
    @letters = params[:letters]
    @included_letters = letter_included?(@word , @letters)
    @is_english_word = english_word? (@word)
  end

  private




  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def letter_included? (word , letters)
    (word.chars - letters.chars).empty?
  end
end
