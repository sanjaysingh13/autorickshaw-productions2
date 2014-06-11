class StillsController < ApplicationController
  before_action :set_still, only: [:show, :edit, :update, :destroy]
before_filter :authorize, :except => [:index, :show]
  # GET /stills
  # GET /stills.json
  def index
    @stills = Still.all
  end

  # GET /stills/1
  # GET /stills/1.json
  def show
  end

  # GET /stills/new
  def new
    @still = Still.new
  end

  # GET /stills/1/edit
  def edit
  end

  # POST /stills
  # POST /stills.json
  def create
    @still = Still.new(still_params)
    @still.save

    respond_to do |format|
      if @still.save
        format.html { redirect_to @still, notice: 'Still was successfully created.' }
        format.json { render :show, status: :created, location: @still }
      else
        format.html { render :new }
        format.json { render json: @still.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stills/1
  # PATCH/PUT /stills/1.json
  def update
    respond_to do |format|
      if @still.update(still_params)
        format.html { redirect_to @still, notice: 'Still was successfully updated.' }
        format.json { render :show, status: :ok, location: @still }
      else
        format.html { render :edit }
        format.json { render json: @still.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stills/1
  # DELETE /stills/1.json
  def destroy
    @still.destroy
    respond_to do |format|
      format.html { redirect_to stills_url, notice: 'Still was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_still
      @still = Still.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def still_params
      params.require(:still).permit(:film_id, :image)
    end
end
