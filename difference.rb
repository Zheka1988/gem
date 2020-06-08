# require_relative 'mortgage'
class Difference < Mortgage

  MONTHS = [ :January, :February, :March, :April, :May, 
             :June, :July, :August, :September, :October, 
             :November, :December ].freeze

  DAY_OF_MONTH = { January: 31.0, February: 28.0, March: 31.0, April: 30.0,
           May: 31.0, June: 30.0, July: 31.0, August: 31.0, September: 30.0,
           October: 31.0, November: 30.0, December: 31.0 }.freeze

  attr_accessor :debt_balance
  attr_reader :monthly_payment, :part_main_debt, :mas_debt,
              :date_create_calculate, :current_month, :date, :current_year

  def initialize(price_apartment, first_payment, percent_or_money, percent, loan_terms)
    super
    @date_create_calculate = Time.new
    @current_month = MONTHS.index(Time.new.strftime("%B").to_sym)
    @date = Time.new.day
    @current_year = Time.new.year

    @debt_balance = @size_credit
    @monthly_payment = [0]
    @part_main_debt = calculate_part_main_debt
  end

  private
  def differenc_pay
    counter_payment = @loan_terms
    while counter_payment >= 1
      @monthly_payment.push( ( @part_main_debt + summ_percent ).round )
      @debt_balance -= @part_main_debt
      counter_payment -= 1
    end
  end

  def calculate_part_main_debt
    (@size_credit.to_f / @loan_terms).round
  end

  def summ_percent
    ( @debt_balance * (@percent.to_f / 100) *  ( day_with_percent / days_of_year ) )
  end

  def day_with_percent
    if  MONTHS[@current_month] == :February && god_visokosniy?(@current_year)
      day = (DAY_OF_MONTH[MONTHS[@current_month]] + 1).to_f
    else
      day = DAY_OF_MONTH[MONTHS[@current_month]].to_f
    end
    next_month
    day
  end

  def next_month   
    if @current_month == 11
      @current_month = 0
      @current_year += 1
    else
      @current_month += 1
    end
  end

  def days_of_year
    god_visokosniy?(@current_year) ? 366 : 365
  end

  def god_visokosniy?(god)
    god % 4 == 0 && god % 100 != 0 ? true : false
  end
end
