class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
    render 'show.json.jbuilder'
  end

  def index
    @suppliers = Supplier.all 
    render 'index.json.jbuilder'
  end

end
