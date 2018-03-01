# module Api::V1
#   class ScriptsController < ApiController
#   before_action :set_script, only: [:show, :update, :destroy]
#   before_action :authenticate_user!, only: [:create]
#   # GET /scripts
#   def index
#     @scripts = Script.all
#
#     render json: @scripts
#   end
#
#   # GET /scripts/1
#   def show
#     render json: @script
#   end
#
#   # POST /scripts
#   def create
#     @script = Script.new(script_params)
#
#     if @script.save
#       render json: @script, status: :created, location: api_v1_script_url(@script)
#     else
#       render json: @script.errors, status: :unprocessable_entity
#     end
#   end
#
#   # PATCH/PUT /scripts/1
#   def update
#     if @script.update(script_params)
#       render json: @script
#     else
#       render json: @script.errors, status: :unprocessable_entity
#     end
#   end
#
#   # DELETE /scripts/1
#   def destroy
#     @script.destroy
#   end
#
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_script
#       @script = Script.find(params[:id])
#     end
#
#     # Only allow a trusted parameter "white list" through.
#     def script_params
#       params.require(:script).permit(:name, :skill, :bot_for, :game_for, :user_id)
#     end
#   end
# end
