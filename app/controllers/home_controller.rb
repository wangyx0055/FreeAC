class HomeController < ApplicationController

  def home
    @messages = "test"
    @d_array = CConverter::Convert.D_Array() #dates array
    @c_array = CConverter::Convert.C_Array() #currency array


  end

  def upd
    date = params[:date]
    fromC = params[:fromC]
    toC = params[:toC]

    rate = CConverter::Convert.Currency(date,fromC,toC) #rate

    respond_to do |format|
      format.html
       format.json { render :json => {:rate => rate}}
    end
  end


end
