class PlaceDivident

  attr_accessor :place_bets, :result

  @@tabcorp_place_commission = 0.12

  def initialize(place_bets, result)
    @place_bets = place_bets
    @result     = result
  end

  ## Get the array of dividents for 1st, 2nd, 3rd results
  # 1. Returns zero if no bet present
  # 2. Returns array of each divident for each place
  def values
    return [0.0]*(result.count) if (place_bets[:total].eql?0)
    total = (place_bets[:total]*(1-tabcorp_place_commission))/(result.count.to_f)
    result_arr = result.map{|horse| place_bet_divident(horse, total)}
    return result_arr
  end

  private

  def tabcorp_place_commission
    @@tabcorp_place_commission
  end

  def place_bet_divident(horse, total)
    return 0.0 if place_bets[horse].nil?
    place_sum = place_bets[horse].inject(0.0) {|sum, x| sum+=x}
    (total/place_sum).round(2)
  end
end
