class StoriesController < ApplicationController
  def index
    @search = Story.search(params[:q])
    @stories = @search.result(:distinct => true)
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render action: "new"
    end
    
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_url
  end
end
