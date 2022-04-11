class PayersController < ApplicationController
    def show
        # payer = find_payer
        # render json: payer
    end

    def index
        payers = Payer.all
        render json: payers
    end



    private

end
