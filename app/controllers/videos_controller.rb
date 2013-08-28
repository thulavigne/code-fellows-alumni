class VideosController < ApplicationController
  def index
    @videos = Video.all
    if current_user.nil?
      redirect_to :root
    else
      @videos = current_user.videos
    end
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    @video.user = current_user
    if @video.save
      flash[:notice] = "Video has been saved."
      redirect_to videos_path
    else
      flash[:alert] = "Video has not been saved."
      render :action => "new"
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      flash[:notice] = "Video has been updated."
      redirect_to @video
    else
      flash[:alert] = "Video has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Video has been deleted"
    redirect_to current_user
  end
end
