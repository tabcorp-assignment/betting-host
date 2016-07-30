require './win_divident'
require './place_divident'

class ResultInterface
  attr_accessor :user_interface, :win_divident, :place_divident, :data_result

  def initialize(data, user_interface)
    @data_result         = data.result
    @user_interface      = user_interface
    @win_divident        = WinDivident.new(data.win_bets, data.result)
    @place_divident      = PlaceDivident.new(data.place_bets, data.result)
  end

  ## Wrapper class to process Output
  def process
    user_interface.display_output('')
    user_interface.display_output('')
    display_win_divident
    display_process_divident
  end

  private

  def display_win_divident
   divident_value = win_divident.value
   user_interface.display_output("Win:#{data_result[0]}:$#{divident_value}")
  end

  def display_process_divident
    divident_values = place_divident.values
    data_result.each_with_index do |horse, index|
      user_interface.display_output("Place:#{horse}:$#{divident_values[index]}")
    end
  end
end
