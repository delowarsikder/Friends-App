class FriendsController < ApplicationController

  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]


  # GET /friends or /friends.json
  def index
    # @friends = Friend.all
    @friends = current_user.friends   ##show only login user friend list
    
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
    # @friend=correct_user.friends.build ###added by myself
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)
    # @friend=correct_user.friends.build(friend_params) ###added by myself ##create friend 

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  ###check the current user ##myself
  def correct_user
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: "Not Authorized To Access This Friend !" if @friend.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:First_name, :Last_name, :Phone, :Email, :user_id)
    end
end
