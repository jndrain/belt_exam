class BorrowerController < ApplicationController
  def index
  	@borrower = Borrower.where(id: session[:borrower_id]).first
  	
  	@trans = Transaction.where(borrower_id: session[:borrower_id], lender_id: )

  end
end
