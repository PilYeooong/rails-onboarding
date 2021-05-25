class DiariesController < ApplicationController
  before_action :authorized

  def index
    @diaries = Diary.find(user_id: @user.id, is_deleted: false)

    render json: { diaries: @diaries }, status: :ok
  end

  def create
    @diary = Diary.create(create_params)
    @diary.user_id = @user.id

    if @diary.save
      render json: @diary, status: :created
    else
      render json: { message: 'Failed to create Diary', errors: @diary.errors }, status: :bad_request
    end
  end

  private
  def create_params
    params.permit(:title, :contents)
  end

end
