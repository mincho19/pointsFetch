class Transaction < ApplicationRecord
    belongs_to :payer


    # define spend method for each transaction
end
