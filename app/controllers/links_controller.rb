class LinksController < ApplicationController
  before_filter :find_object, :only => [:new, :create]

  def new
    @link = @object.links.build
  end

  def create
    @link = @object.links.build(params[:link])
    @link.owner = @object
    if @link.save
      flash[:notice] = "Link has been added."
      redirect_to @object
    else
      flash[:alert] = "Link has not been added."
      render :action => "new"
    end
  end

private
  def find_object
    a_hash = params.select {|e| /_id/ =~ e}
    an_array = a_hash.first
    a_class = an_array.first.chomp("_id").capitalize.constantize
    @object = a_class.find(an_array.last)
  end
end
