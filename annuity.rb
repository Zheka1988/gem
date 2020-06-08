# require_relative 'mortgage'
class Annuity < Mortgage
  attr_reader :monthly_payment, :overpayment, :total_cost_of_housing

  def initialize(price_apartment, first_payment, percent_or_money, percent, loan_terms)
    super
    @monthly_payment = 0
  end

  def calculate_overpayment
    @overpayment = ( @monthly_payment * @loan_terms ) - @size_credit
  end

  def calculate_total_cost_of_housing
    @total_cost_of_housing = @overpayment + @price_apartment
  end

  private
  def annuitet_pay
    @monthly_payment = (@size_credit * annuity_ratio).round
    calculate_overpayment
    calculate_total_cost_of_housing
  end

  def annuity_ratio
    month_percent = (@percent / 12.0 ) / 100
    (month_percent * (1 + month_percent)**@loan_terms ) / ( (1 + month_percent)**@loan_terms - 1)
  end

end
