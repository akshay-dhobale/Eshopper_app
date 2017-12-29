class CmsController < ApplicationController

  def index
    # binding.pry
    if params[:value] == "faq"
      @cms = Cm.find_by(title: "faq")
      render :faq
    elsif params[:value] == "company_information"
      @cms = Cm.find_by(title: "company_information")
      render :company_info
    elsif params[:value] == "terms_and_conditions"
      @cms = Cm.find_by(title: "terms_and_conditions")
      render :terms_and_conditions
    elsif params[:value] == "refund_policy"
      @cms = Cm.find_by(title: "refund_policy")
      render :refund_policy
    end
  end
end
