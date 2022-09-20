class SayController < ApplicationController
  def hello
    @time=Time.now
    puts @time
    puts '############'
    puts '############'
  end

  def goodbye
  end
end
