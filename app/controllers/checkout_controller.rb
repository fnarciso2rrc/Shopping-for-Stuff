class CheckoutController < ApplicationController

    # POST
    def create
        #
        #
        # 
        product = Product.find(params[:product_id])

        if product.nil?
            redirect_to root_path
            return
        end

        @session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
            mode: "payment",
            line_items: [
                    price_data: {
                        currency: "cad",
                        product_data: {
                            name: product.name,
                            description: product.description,
                        },
                        unit_amount: product.price_cents,
                    },
                    quantity: 1
            ]
        )
        redirect_to @session.url, allow_other_host: true
    end

    def success
        #

    end

    def cancel
        #

    end


end
