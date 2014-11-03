
module API
  module V1
    class PumpkinsController < API::BaseController

      def index
        @pumpkins = Pumpkin.all

        respond_with API::ArrayPresenter.new(@pumpkins, PumpkinsPresenter)
      end

      def show
        @pumpkin = Pumpkin.find(params[:id])

        respond_with PumpkinsPresenter.new(@pumpkin)
      end

      def create
        @pumpkin = Pumpkin.create!(pumpkin_params)

        respond_with PumpkinsPresenter.new(@pumpkin), location: nil
      end

      private
      def pumpkin_params
        params.require(:pumpkin).permit(
          :name,
          :weight,
          :softness,
          :farm_attributes => [:name, :city]
        )
      end
    end
  end
end











