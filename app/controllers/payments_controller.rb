class PaymentsController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @payments = @group.payments.order(created_at: :desc)
    end
    
    def new
        @payment = current_user.payments.new
        @group = Group.find(params[:group_id])
    end
    
    def create
        @payment = current_user.payments.new(name: payment_params[:name], amount: payment_params[:amount])

        if @payment.save
            @group_payment = GroupPayment.new(payment_id: @payment.id, group_id: params[:payment][:group_id])
      
            if @group_payment.save
              redirect_to user_group_payments_path(current_user, params[:payment][:group_id]), notice: 'Payment was successfully created.'
            end
        else
            render :new
        end
    end
    
    private
    
    def payment_params
        params.require(:payment).permit!
    end    
end
