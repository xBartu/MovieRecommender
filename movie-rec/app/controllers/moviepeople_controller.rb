class MoviepeopleController < ApplicationController
  before_action :set_movieperson, only: [:show, :edit, :update, :destroy]

  # GET /moviepeople
  # GET /moviepeople.json
  def index
    @moviepeople = Movieperson.all
  end

  # GET /moviepeople/1
  # GET /moviepeople/1.json
  def show
  end

  # GET /moviepeople/new
  def new
    @movieperson = Movieperson.new
  end

  # GET /moviepeople/1/edit
  def edit
  end

  # POST /moviepeople
  # POST /moviepeople.json
  def create
    @movieperson = Movieperson.new(movieperson_params)

    respond_to do |format|
      if @movieperson.save
        format.html { redirect_to @movieperson, notice: 'Movieperson was successfully created.' }
        format.json { render :show, status: :created, location: @movieperson }
      else
        format.html { render :new }
        format.json { render json: @movieperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviepeople/1
  # PATCH/PUT /moviepeople/1.json
  def update
    respond_to do |format|
      if @movieperson.update(movieperson_params)
        format.html { redirect_to @movieperson, notice: 'Movieperson was successfully updated.' }
        format.json { render :show, status: :ok, location: @movieperson }
      else
        format.html { render :edit }
        format.json { render json: @movieperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviepeople/1
  # DELETE /moviepeople/1.json
  def destroy
    @movieperson.destroy
    respond_to do |format|
      format.html { redirect_to moviepeople_url, notice: 'Movieperson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movieperson
      @movieperson = Movieperson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movieperson_params
      params.require(:movieperson).permit(:person_id, :movie_id, :role_name)
    end
end
