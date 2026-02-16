class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].chars

    if valid_in_grid?(@word, @letters)
      @result = "The word can be built from the grid ✅"
    else
      @result = "The word can't be built from the grid ❌"
    end
  end

  private

  def valid_in_grid?(word, letters)
    word.chars.all? do |letter|
      word.count(letter) <= letters.count(letter)
    end
  end
end
