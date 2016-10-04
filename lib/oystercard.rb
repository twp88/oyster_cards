class Oystercard
  attr_reader :balance, :limit, :in_use, :stations
  DEFAULT_BALANCE = 5
  BALANCE_LIMIT = 90


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = BALANCE_LIMIT
    @in_use = false
    @stations = []
  end

  def top_up(amount)
    amount = amount.to_i
    fail "Total balance should not be more than 90" if (@balance + amount) > @limit
    @balance += amount
  end

  def touch_in
    if @balance < 1
      raise "Not enough funds"
    else
      @in_use = true
      @stations << :awesome_coffwee 
    end
  end

  def touch_out
    @in_use = false
    deduct_balance(1)
  end

  def in_journey?
    @in_use
  end


def deduct_balance(amount)
  amount = amount.to_i
  @balance -= amount
end
end
