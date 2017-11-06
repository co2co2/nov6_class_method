class BankAccount
  @@interest_rate = 0.02
  @@accounts = []
  @@create


  def initialize
    @balance =0
  end

  def balance
    @balance
  end

  def balance=(balance)
    @balance = (balance)
  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    new_account
  end
#
  def self.total_funds
    total = 0
    @@accounts.each {|a| total += a.balance}
    return total
  end

  def self.interest_time
    @@accounts.each do |a|
       a.balance= a.balance * (@@interest_rate +1)
    end
  end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance
puts BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds
BankAccount.interest_time
puts my_account.balance
