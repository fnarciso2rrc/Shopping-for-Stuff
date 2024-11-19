class ApplicationController < ActionController::Base
    before_action :initialize_session
    helper_method :cart
    # before_action :increment_visit_count
    # helper_method :visit_count

    private
    def initialize_session
        session[:cart] ||= [] # Will contain an array of product_ids
    end

    def cart
        Product.find(session[:cart])
    end
end
