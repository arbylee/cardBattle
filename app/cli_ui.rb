class CliUi
  def display msg
    puts msg
  end

  def displayCardOption option
    output = "#{option[:selector]}) #{option[:card].description}"
    output += " *" if option[:selected]
    puts output
  end

  def get_input
    gets.chomp.downcase
  end
end
