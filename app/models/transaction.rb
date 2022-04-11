class Transaction < ApplicationRecord
    belongs_to :payer
    validates :payer, presence: true
    validates :points, presence: true
    validates :timestamp, presence: true

    # can add other validations here if needed

end
