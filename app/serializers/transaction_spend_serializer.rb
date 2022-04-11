class TransactionSpendSerializer < ActiveModel::Serializer
  attributes :payer, :points
  def payer
    "#{self.object.name}"
  end

  def points
    "#{self.object.spent}"
  end

end
