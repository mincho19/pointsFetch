class TransactionsController < ApplicationController
    
    def show
        transactions = Transaction.all
        render json: transactions
    end

    def index
        transaction = find_transaction
        render json: transaction
    end

    def create
        # NEEDS TO CHECK IF TRANSACTION WILL SET PAYER NEGATIVE
        # need to verify proper inputs
        payer = find_or_create_payer(name: params[:name])
        payer['points'] += params[:points]
        @transaction = Transaction.create(points: params[:points], payer: payer)
    end

    def spend

        transactions = Transaction.all
        sorted_transactions = transactions.sort_by {|t| t.timestamp}

        if params[:spend].to_i > total
            render json: "Error"
        else
            render json: sorted_transactions
        end

        
        
        # sort by transaction
        # substract and record difference in payer, if spend remains move on
        # return payer recorded
    end

    private 

    def find_transaction
        Transaction.find_by(id: params[:id])
    end

    def total
        transactions = Transaction.all
        total = 0
        transactions.each do |item|
            total += item['points']
        end
        total
        
    end


    def find_or_create_payer(name:)
        if Payer.find_by(name: name) != nil
            Payer.find_by(name: name)
        else
            Payer.create(name: name, points: 0)
        end
    end
end
