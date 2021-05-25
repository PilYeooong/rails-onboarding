class AssetsController < ApplicationController
  before_action :authorized, only: [:create]

  def index
    @assets = Asset.all()

    render json: { assets: @assets }, status: :ok
  end

  def show
    @asset = Asset.find_by!(ticker: params[:ticker])

    raise ActiveRecord::RecordNotFound if @asset.nil?

    render json: @asset

  end

  def create
    @asset = Asset.create(asset_params)

    if @asset.save
      render json: @asset, status: :created
    else
      raise Errors::
      render json: { message: 'Failed to create Asset', errors: @asset.errors }, status: :bad_request
    end
  end

  private
    def asset_params
      params.permit(:ticker, :name, :price)
    end

end
