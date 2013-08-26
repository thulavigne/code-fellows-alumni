class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    @address.user = current_user
    if @address.save
      flash[:notice] = "Address has been created."
      redirect_to current_user
    else
      flash[:alert] = "Address has not been created."
      render :action => "new"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end


  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      flash[:notice] = "Address has been updated."
      redirect_to current_user
    else
      flash[:alert] = "Address has not been updated."
      render :action => "new"
    end
  end

  def getStates
    @country = params[:country]
    @states = Country.search(@country).states
    @region_name =
      case @country
        when "CA"
          "Province"
        when "US"
          "State"
        else
          "State/Province/Region"
      end

    begin
      if @states.empty?
        render :json => {"content" => "None"}.to_json
      else
        render :json =>
          {"region_name" => @region_name,
            "states" => @states.map{|s| [s.first, s.last["name"]]}}.to_json
#        render :json => @states.map{|s| [s.first, s.last["name"]]}
      end
    rescue
      render :json => {"content" => "None"}.to_json
    end
  end

end
