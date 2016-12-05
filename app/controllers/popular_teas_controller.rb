class PopularTeasController < ApplicationController
  def index
    @teas = Tea.order(price: :desc).limit(5)
    render json: @teas.as_json(only: [:id, :name, :price], methods: :image)
  end
end