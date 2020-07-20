class Transfer
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def status
    @status
  end

  def amount
    @amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def transfer
    @sender.balance -= @amount
    @receiver.balance += @amount
    self.status = "complete"
  end

  def reject
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def valid_trans
    if @sender.valid? && @sender.balance > @amount && self.status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid_trans
      self.transfer
    else
      self.reject
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    else
      self.reject
    end
  end
end
