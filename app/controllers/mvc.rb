ROUTES:

Rails.application.routes.draw do

  root to: 'bicycles#index'
  resources :bicycles, only: [:]


CONTROLLER:

class BicyclesController < ApplicationController
  before_action :set_style
  def index
    @bicycles = Bicycle.all
    @bicycles = @style.bicycles if @style.present?

    if params[:model].present?
      @bicycles = @bicycles.where(model: params[:model])
    end
    @bicycles = @bicycles.where(style_id: params[:style]) if params[:style].present?
    @bicycles = @bicycles.where(brand_id: params[:brand]) if params[:brand].present?
    @bicycles = @bicycles.where(speeds: params[:speeds]) if params[:speeds].present?
  end


  def show
    @bicycle = Bicycle.find(params[:id])
  end


  private


  def set_style
    @style = Style.find_by(params[:style_id])
  end
end


View:

