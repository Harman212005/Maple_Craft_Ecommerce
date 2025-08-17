# app/controllers/admin/provinces_controller.rb
module Admin
  class ProvincesController < ApplicationController

    before_action :set_province, only: [:edit, :update]

    def index
      @provinces = Province.all.order(:name)
    end

    def edit
    end

    def update
      if @province.update(province_params)
        redirect_to admin_provinces_path, notice: 'Province tax rates were successfully updated.'
      else
        flash.now[:alert] = "Could not update province: #{@province.errors.full_messages.join(', ')}"
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_province
      @province = Province.find(params[:id])
    end

    def province_params
      params.require(:province).permit(:gst, :pst, :hst)
    end

  end
end