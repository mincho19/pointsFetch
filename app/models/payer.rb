class Payer < ApplicationRecord
    has_many :transactions
    validates :name, presence: true

    # can add other validations here if needed

end
