class UsersController < ApplicationController

  def new
  end

  # app/controllers/users_controller.rb
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      Rails.logger.info @user.errors.full_messages.inspect
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.expect(user: [:username, :email, :password])
  end
end
