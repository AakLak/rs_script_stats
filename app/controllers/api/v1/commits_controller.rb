module Api::V1
  class CommitsController < ApiController
    before_action :set_commit, only: %i[show update destroy]
    before_action :authenticate_user!, only: [:create]

    # GET /commits
    # def index
    #   @commits = Commit.all
    #
    #   render json: @commits
    # end

    # GET /commits/1
    # def show
    #   render json: @commit
    # end

    # POST /commits
    def create
      params = commit_params
      params[:user_id] = User.find(params[:user_id]).id
      params[:script_id] = Script.find(params[:script_id]).id
      @commit = Commit.new(params)

      if @commit.save
        render json: @commit, status: :created, location: api_v1_commit_url(@commit)
      else
        render json: @commit.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /commits/1
    # def update
    #   if @commit.update(commit_params)
    #     render json: @commit
    #   else
    #     render json: @commit.errors, status: :unprocessable_entity
    #   end
    # end

    # DELETE /commits/1
    # def destroy
    #   @commit.destroy
    # end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_commit
      @commit = Commit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def commit_params
      params.require(:commit).permit(:task, :runtime, :script_id, :user_id, stats_attributes: %i[task amount commit_id])
    end
  end
end
