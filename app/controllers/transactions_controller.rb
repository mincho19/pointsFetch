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

        # byebug

        #Adjust points based on transaction
        payer['points'] += params[:points]
        
        # byebug

        #create transaction
        @transaction = Transaction.create(points: params[:points], payer: payer, timestamp: params[:timestamp])

        render json: payer

    end

    def spend

        spend = params[:spend].to_i
        transactions = Transaction.all
        sorted_transactions = transactions.sort_by {|t| t.timestamp}

        if spend > total
            render json: "Error"
        else  
            
            sorted_transactions.each do |t|
                if (spend - t.points) > 0
                    t.payer.spent -= t.points
                    spend -= t.points
                else
                    t.payer.spent -= spend
                    spend = 0
                    break
                end
            end
            render json: Payer.all
        end

        
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
            Payer.create(name: name, points: 0, spent: 0)
        end
    end
end
