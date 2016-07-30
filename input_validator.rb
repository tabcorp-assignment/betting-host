class InputValidator

  attr_accessor :input, :is_valid, :user_interface

  @@invalid_bet_message = "Sorry! Please enter in the format Bet:<W|P>:<horse>:<bet_amount>"
  @@invalid_result_message = "Sorry! Please enter in the format Result:<first>:<second>:<third>"
  @@invalid_input = "Sorry! Please enter in format Bet:<W|P>:<horse>:<bet_amount> for bet or Result:<first>:<second>:<third> for result"

  def initialize(input, user_interface)
    @input = input
    @user_interface = user_interface
    @is_valid = true
    validate
  end

  ## Checks in the given input is valid
  # 1. Returns if valid bet or valid result input
  # 2. If starts with Bet show's bet input error, starts with Result shows result input error
  def validate
    return if (valid_bet?) || (valid_result?)
    show_error_message
    return set_valid(false)
  end

  ## Returns if given input is valid or not
  def is_valid?
    is_valid
  end

  private

  def valid_bet?
    !!(input =~ /^Bet:[WP]:[0-9]+:[0-9]+$/)
  end

  def valid_result?
    !!(input =~ /^Result:[0-9]+:[0-9]+:[0-9]+$/)
  end

  def show_error_message
    if starts_with_bet?
      user_interface.display_output(@@invalid_bet_message)
    elsif starts_with_result?
      user_interface.display_output(@@invalid_result_message)
    else
      user_interface.display_output(@@invalid_input)
    end
  end

  def starts_with_bet?
    !!(input =~ /^Bet.*$/)
  end

  def starts_with_result?
    !!(input =~ /^Result.*$/)
  end

  def set_valid(value)
    is_valid = value
  end
end
