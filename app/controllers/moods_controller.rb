class MoodsController < ApplicationController
  def index
    @users = User.all
    @moods = @users.map { |user| user.latest_mood }.
      detect { |m| m != nil }
  end

  def show
    user = User.friendly.find(params[:user_slug])
    mood = user.moods.find(params[:id])

    redirect_to(edit_user_mood_path(user, mood))
  end

  def edit
    @mood = current_user.moods.find(params[:id])
  end

  def create

    mood = current_user.moods.new
    # TODO: record mood info
    mood.status = params[:status]
    mood.save!

    respond_to do |format|
      format.html do
        redirect_to(user_mood_path(user, mood))
      end

      format.json do
        render json: {}
      end
    end
  end
end
