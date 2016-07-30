class DataInterface

  attr_accessor :win_bets, :place_bets, :input, :result
  def initialize
    @win_bets   = {total: 0}
    @place_bets = {total: 0}
    @result     = []
  end

  def store_input(input)
    return store_win_bet(input) if win_bet?(input)
    return store_place_bet(input) if place_bet?(input)
    return store_result(input) if is_result?(input)
  end

  private

  def win_bet?(input)
    !!(input =~ /^Bet:W:.*$/)
  end

  def place_bet?(input)
    !!(input =~ /^Bet:P:.*$/)
  end

  def is_result?(input)
    !!(input =~ /^Result:.*$/)
  end

  def store_result(input)
    @result = input.split(":").map(&:to_i)[1..3]
  end

  def store_win_bet(input)
    input_arr = input.split(':').map(&:to_i)
    win_bets[input_arr[2]] = [] if win_bets[input_arr[2]].nil?
    win_bets[input_arr[2]] << input_arr[3]
    win_bets[:total] += input_arr[3]
  end

  def store_place_bet(input)
    input_arr = input.split(':').map(&:to_i)
    place_bets[input_arr[2]] = [] if place_bets[input_arr[2]].nil?
    place_bets[input_arr[2]] << input_arr[3]
    place_bets[:total] += input_arr[3]
  end
end
