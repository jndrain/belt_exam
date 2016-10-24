class LendersController < ApplicationController
  def index
  	@lender = Lender.where(id: session[:lender_id]).first
  	notloaning = Transaction.where.not(lender_id: session[:lender_id])
  	loaning = Transaction.where(lender_id: session[:lender_id])
  	@notborrower = Borrower.where(id:)
  end

  def lend
  end
end
