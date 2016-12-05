class BasketsController < ApplicationController
  def update
    session[:basket] ||= []
    session[:basket] << params[:add] unless session[:basket].include? params[:add]
    session[:basket].delete(params[:remove])
    head 200
  end

  def show
    @teas = Tea.where(id: session[:basket])
    render json: @teas.to_json(only: [:id, :name, :price], methods: :image)
  end

  def destroy
    session.delete(:basket)
    head 200
  end
end