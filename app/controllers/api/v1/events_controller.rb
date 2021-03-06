class Api::V1::EventsController < ApplicationController
  force_ssl unless Rails.env.development?
  before_action :authenticate, except: [:index, :show]
  respond_to :json, :xml

  def index
    respond_with Event.all
  end

  def show
    respond_with Event.find(params[:id])
  end
end
