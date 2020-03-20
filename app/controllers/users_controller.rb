class UsersController < ApplicationController
    def show_all
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
    end

end
