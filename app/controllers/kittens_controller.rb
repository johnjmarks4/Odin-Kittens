class KittensController < ApplicationController
  def new
  end

  def create
  end

  def show
    @kitten = Kitten.find_by(id: params[:kitten_id].to_i)
    if @kitten.nil?
      render html: '<p>No kittens to display</p>'.html_safe #use flash instead?
    end
  end

  def index
    @kittens = Kitten.all
    if @kittens.empty?
      render html: '<p>No kittens to display</p>'.html_safe #use flash instead?
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Kitten.find(params[:format]).destroy
    redirect_back(fallback_location: root_path)
  end
end