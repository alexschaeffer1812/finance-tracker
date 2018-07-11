class StocksController < ApplicationController
    
    
    def search
        
        if params[:stock].present?
            @stock = Stock.new_from_lookup(params[:stock])
                if @stock
                    render 'users/my_portfolio'
                else
                    flash[:danger] = "The symbol you have entered is invalid"
                    redirect_to my_portfolio_path
                end
        else
            flash[:danger] = "Please enter a stock symbol"
            redirect_to my_portfolio_path
        end
        
        
    end
    
end