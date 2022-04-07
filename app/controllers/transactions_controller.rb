class TransactionsController < ApplicationController
    
    def show
        transaction = find_transaction
        render json: transaction
    end

    def index
        transactions = Transaction.all
        render json: transactions
    end

    def create
        # NEEDS TO CHECK IF TRANSACTION WILL SET PAYER NEGATIVE
        payer = find_or_create_payer(name: params[:name])
        @transaction = Transaction.create(points: params[:points], payer: payer)
    end

    def spend
        while params[:points] > 0 do
            
        end

    end

    private 

    def find_transaction
        Transaction.find_by(id: params[:id])
    end

    def find_or_create_payer(name:)
        if Payer.find_by(name: name) != nil
            Payer.find_by(name: name)
        else
            Payer.create(name: name, points: 0)
        end
    end
end
