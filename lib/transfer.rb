
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true if self.sender.valid? && self.receiver.valid?
    false
  end

  def execute_transaction
    if self.status == "pending"
      if self.valid? && sender.balance >= self.amount
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected" 
        "Transaction rejected. Please check your account balance."
      end 
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end

