module Decidim
  module Admin
      class NavsController < Decidim::Admin::ApplicationController
        before_action :set_nav, only: [:show, :edit, :update, :destroy]

        # GET /navs
        def index
          @navs = Nav.all
        end

        # GET /navs/1
        def show
        end

        # GET /navs/new
        def new
          @nav = Nav.new
        end

        # GET /navs/1/edit
        def edit
        end

        # POST /navs
        def create
          @nav = Nav.new(nav_params)

          if @nav.save
            redirect_to @nav, notice: 'Nav was successfully created.'
          else
            render :new
          end
        end

        # PATCH/PUT /navs/1
        def update
          if @nav.update(nav_params)
            redirect_to @nav, notice: 'Nav was successfully updated.'
          else
            render :edit
          end
        end

        # DELETE /navs/1
        def destroy
          @nav.destroy
          redirect_to navs_url, notice: 'Nav was successfully destroyed.'
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_nav
            @nav = Nav.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def nav_params
            params.require(:nav).permit(:laber, :url)
          end
       end
    end
end
