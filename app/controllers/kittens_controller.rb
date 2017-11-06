class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
    if !params[:kitten_id].nil?
      @kitten_id = params[:kitten_id]
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kittens_show_path(@kitten, kitten_id: @kitten.id)
    end
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
    @kitten = Kitten.find(params[:format]) #handle error?
  end

  def update
    @kitten = Kitten.find(params[:kitten_id])
    @kitten.update(kitten_params)
    if @kitten.valid?
      redirect_to kittens_show_path(@kitten, kitten_id: @kitten.id)
    end
  end

  def destroy
    Kitten.find(params[:format]).destroy
    redirect_back(fallback_location: root_path)
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end