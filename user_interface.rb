require './input_validator'
require './data_interface'
require './result_interface'
require 'pry'
class UserInterface

  attr_accessor :data_interface
  def initialize
    @data_interface = DataInterface.new
  end

  ## Prompts input from user
  # 1. gets input
  # 2. Returns to prompt if not valid input
  # 3. stores input
  # 4. Returns to prompt or exit based on iput type
  def prompt_input
    show_helper_text
    input = get_input.strip
    return prompt_input if invalid_input?(input)
    data_interface.store_input(input)
    return (result_input?(input) ? (process_dividents) : (prompt_input))
  end

  ## Interface to display output
  # Arguments: Output string<string>, inline<boolean>
  def display_output(str, same_line=false)
    same_line ? (print str) : (puts str)
  end

  private

  def show_helper_text
    # display_output('>', true)
  end

  def get_input
    STDIN.gets.chomp()
  end

  def invalid_input?(input)
    validator = InputValidator.new(input, self)
    !validator.is_valid?
  end

  def result_input?(input)
    !!(input =~ /^Result:.*$/)
  end

  def process_dividents
    return if data_interface.win_bets.empty? && data_interface.place_bets.empty?
    result = ResultInterface.new(data_interface, self)
    result.process
  end
end
