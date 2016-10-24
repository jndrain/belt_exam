class SessionsController < ApplicationController
    def index
    render "index"
  end
  def lregister
  	@lender = Lender.create(fname: params[:fname], lname: params[:lname], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], balance: params[:balance])
    if @lender.valid?
      session[:lender_id] = @lender.id
      redirect_to "/online_lending/lender/#{@lender.id}"
    else
    	flash[:errors] = "Invalid"
      redirect_to "/online_lending/register"
    end
  end
  def bregister
  	@borrower = Borrower.create(fname: params[:fname], lname: params[:lname], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], purpose: params[:purpose], description: params[:description], aneeded: params[:aneeded])
  	 if @borrower.valid?
    	session[:borrower_id] = @borrower.id 
    	redirect_to "/online_lending/borrower/#{@borrower.id}"
    else
    	flash[:errors] = "Invalid"
    	redirect_to "/online_lending/register"
    end
   end
  def users
  	render "login"
  end
  def login
  	@borrower = Borrower.where(email: params[:email]).first
    @lender = Lender.where(email: params[:email]).first
    if @lender && @lender.authenticate(params[:password])
      session[:lender_id] = @lender.id
      redirect_to "/online_lending/lender/#{@lender.id}"
    elsif @borrower && @borrower.authenticate(params[:password])
    	session[:borrower_id] = @borrower.id
      redirect_to "/online_lending/borrower/#{@borrower.id}"
    else
    	flash[:errors] = "Invalid"
      	redirect_to "/online_lending/login"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end
end