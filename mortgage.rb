require_relative 'difference'
require_relative 'annuity'
module Mortgage
  # PERCENT_OR_MONEY = ['%', 'т'].freeze
  
  attr_reader :price_apartment, :first_payment, 
    :loan_terms, :percent, :size_credit
  
  def initialize(price_apartment, first_payment, percent_or_money, percent, loan_terms)
    @price_apartment = price_apartment
    @first_payment = set_first_payment(price_apartment, first_payment, percent_or_money)
    @percent = percent
    @loan_terms = loan_terms * 12
    @size_credit = calc_size_credit

    @overpayment = 0
    @total_cost_of_housing = 0
  end

  def calculate_monthly_payment(type_pay)
    if type_pay == 'a'
      annuitet_pay
    elsif type_pay == 'd'
      differenc_pay
    else
      "Нет такого вида платежей!"
    end
  end

  private

  def set_first_payment(price_apartment, first_payment, percent_or_money)
    if percent_or_money == '%'
      percent_to_money_first_payment(price_apartment, first_payment)
    else
      first_payment
    end
  end

  def calc_size_credit
    @price_apartment - @first_payment
  end


  def percent_to_money_first_payment(price_apartment, first_payment)
    ( price_apartment / 100 ) * first_payment
  end
end
