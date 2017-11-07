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
      flash[:success] = "kitten creation successful"
      redirect_to kittens_show_path(@kitten, kitten_id: @kitten.id)
    else
      flash[:failure] = "form filled out incorrectly"
      render kittens_create_path
    end
  end

  def show
    @kitten = Kitten.find_by(id: params[:kitten_id].to_i)
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def edit
    @kitten = Kitten.find(params[:format])
  end

  def update
    @kitten = Kitten.find(params[:kitten_id])
    @kitten.update(kitten_params)
    if @kitten.valid?
      redirect_to kittens_show_path(@kitten, kitten_id: @kitten.id)
    end
  end

  def destroy
    flash[:success] = "kitten destroyed"
    Kitten.find(params[:format]).destroy
    redirect_back(fallback_location: root_path)
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end