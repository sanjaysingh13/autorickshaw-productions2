class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  before_filter :authorize, :except => [:index, :show, :feature]
  

  # GET /films
  # GET /films.json
  
  def index
    
    #@films = Film.all
  end
  def addfilm
    @films = Film.all
  end
  def feature
    
    @featurefilm = Film.where(feature:true).first
    


  end

  # GET /films/1
  # GET /films/1.json
  def show
    @film = Film.find(params[:id])


  end

  # GET /films/new
  def new
    @film = Film.new
    @film.stills.build
  end

  # GET /films/1/edit
  def edit
  end
  

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)
    #authorize @film
    respond_to do |format|
      if @film.save
        #if params[:images]
         # params[:images].each { |image|
          #  @film.stills.create(image: image)
          #}
          #end

        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    #authorize @film
    respond_to do |format|
     if @film.update(params[:film].permit(:name,:link,:url,:writeup,:credits,:feature, stills_attributes: [:id, :film_id, :image, :_destroy]))
      # to handle multiple images upload on update when user add more picture
      #if params[:images]
      #  params[:images].each { |image|
       #   @film.stills.create(image: image)
       # }
      #end
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end
    def counter
      @@i = 0
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:name, :link, :url, :writeup, :credits, :feature, stills_attributes: [:id, :film_id, :image, :_destroy])
    end
end
