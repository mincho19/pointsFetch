class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def show
        transaction = find_transaction
        render json: transaction
    end

    def index
        transactions = Transaction.all
        render json: transactions
    end

    def create
            payer = find_or_create_payer(name: params[:payer])
            points = params[:points].to_i

            #create transaction
            transaction = Transaction.new(points: points, points_available: points, payer: payer, timestamp: params[:timestamp])

            #Adjust points based on transaction IF balance doesn't go negative
            if(payer.points + points >= 0)
                payer.save!
                transaction.save!
                payer.update(points: payer.points + points)
                render json: transaction
            else
                render json: "Transaction will make payer balance go negative. Transaction Cancelled."
            end

        
        
    end

    def spend
        spendAmount = params[:points].to_i
        transactions = Transaction.all

        sorted_transactions = transactions.sort_by {|t| t.timestamp}
        if spendAmount > totalPointsAvailable
            render json: "Error, spend amount is greater than total available balances of all Payers"
        else  
            sorted_transactions.each do |t|

                if (spendAmount - t.points_available) > 0
                    t.payer.update(points: (t.payer.points - t.points_available))
                    t.payer.update(spent: (t.payer.spent - t.points_available))
                    spendAmount -= t.points_available
                    t.update(points_available: 0)
                else
                    t.payer.update(points: (t.payer.points - spendAmount))
                    t.payer.update(spent: (t.payer.spent - spendAmount))
                    t.update(points_available: t.points_available -= spendAmount)
                    spendAmount = 0
                    break
                end
            end

            #need to adjust response format
            render json: Payer.all, each_serializer: TransactionSpendSerializer
        end
    end

    def points_balance
        render json: Payer.all, each_serializer: TransactionBalanceSerializer
    end

    private 

    def find_transaction
        Transaction.find_by(id: params[:id])
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages  }, status: :unprocessable_entity
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
            Payer.new(name: name, points: 0, spent: 0)
        end
    end
end
