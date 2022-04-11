class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

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
        # need to verify proper inputs

        #find or create payer associated with transaction
        payer = find_or_create_payer(name: params[:payer])

        #Adjust points based on transaction
        payer.update(points: payer.points + params[:points])

        #create transaction
        transaction = Transaction.create(points: params[:points], payer: payer, timestamp: params[:timestamp])

        render json: Transaction.all

    end

    def spend
        spendAmount = params[:points]
        transactions = Transaction.all
        sorted_transactions = transactions.sort_by {|t| t.timestamp}

        if spendAmount > totalPointsAvailable
            render json: "Error, spendAmount is greater than total available balances of Payer.all"

        else  
            
            sorted_transactions.each do |t|
                if (spendAmount - t.points) > 0
                    t.payer.update(points: (t.payer.points - t.points))
                    t.payer.update(spent: (t.payer.spent - t.points))
                    spend -= t.points
                else
                    t.payer.update(points: (t.payer.points - spendAmount))
                    t.payer.update(spent: (t.payer.spent - spendAmount))
                    spendAmount = 0
                    break
                end
            end

            #need to adjust response format
            render json: Payer.all
        end
    end

    def points_balance
        render json: Payer.all
    end

    private 

    def find_transaction
        Transaction.find_by(id: params[:id])
    end

    def totalPointsAvailable
        total = 0
        Payer.all.each do |item|
            total += item['points']
        end
        total
        
    end

    def find_or_create_payer(name:)
        if Payer.find_by(name: name) != nil
            Payer.find_by(name: name)
        else
            Payer.create(name: name, points: 0, spent: 0)
        end
    end
end
