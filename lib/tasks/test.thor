# frozen_string_literal: true

class Test < Thor
  desc 'say [name]', 'say task' # Usage
  def say(name)
    puts "Hello #{name}!"
  end
end
