class Admin::HomesController < ApplicationController
    layout 'admin'
    def top
        @orders = Order.all
        @amount = 0
    end
end
