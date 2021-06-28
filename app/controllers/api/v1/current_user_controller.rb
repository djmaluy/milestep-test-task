class Api::V1::CurrentUserController < ApplicationController
  before_action :authenicate_user, only: [:show]
end