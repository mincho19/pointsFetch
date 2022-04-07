class PayersController < ApplicationController
    def show
        transactions = Transaction.all
        render json: transactions
    end



    private

end
