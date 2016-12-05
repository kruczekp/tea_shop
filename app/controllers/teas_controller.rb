class TeasController < ApplicationController
  def index
    @teas = FilterQuery.new(Tea, filter_params).call
    render json: @teas.as_json(only: [:id, :name, :price], methods: :image)
  end

  def show
    @tea = Tea.find(params[:id])
    render json: @tea.as_json(except: [:created_at, :updated_at], methods: :image)
  end

  private

  def filter_params
    params.permit(:order, :price_from, :price_to, :quantity_from)
  end
end