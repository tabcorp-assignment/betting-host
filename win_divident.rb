class WinDivident

  attr_accessor :win_bets, :result

  @@tabcorp_commission = 0.15

  def initialize(win_bets, result)
    @win_bets = win_bets
    @result   = result
  end

  ## Get win divident value
  # 1. Returns zero if no bet present
  # 2. Returns win divident
  def value
    return 0.0 if (win_bets[:total].eql?0) || (win_bets[result.first].nil?)
    total   = (win_bets[:total]*(1-@@tabcorp_commission))
    won_sum = win_bets[result[0]].inject(0.0) {|sum,x| sum+=x }
    return (total/won_sum).round(2)
  end

  private

  def tabcorp_commission
    @@tabcorp_commission
  end
end
