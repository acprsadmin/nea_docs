class DbfieldsController < ApplicationController
  before_action :set_dbfield, only: [:show, :edit, :update, :destroy]

  # GET /dbfields
  # GET /dbfields.json
  def index
    @dbfields = Dbfield.all
  end

  # GET /dbfields/1
  # GET /dbfields/1.json
  def show
  end

  # GET /dbfields/new
  def new
    @dbfield = Dbfield.new
  end

  # GET /dbfields/1/edit
  def edit
  end

  # POST /dbfields
  # POST /dbfields.json
  def create
    @dbfield = Dbfield.new(dbfield_params)

    respond_to do |format|
      if @dbfield.save
        format.html { redirect_to @dbfield, notice: 'Dbfield was successfully created.' }
        format.json { render :show, status: :created, location: @dbfield }
      else
        format.html { render :new }
        format.json { render json: @dbfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dbfields/1
  # PATCH/PUT /dbfields/1.json
  def update
    respond_to do |format|
      if @dbfield.update(dbfield_params)
        format.html { redirect_to @dbfield, notice: 'Dbfield was successfully updated.' }
        format.json { render :show, status: :ok, location: @dbfield }
      else
        format.html { render :edit }
        format.json { render json: @dbfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dbfields/1
  # DELETE /dbfields/1.json
  def destroy
    @dbfield.destroy
    respond_to do |format|
      format.html { redirect_to dbfields_url, notice: 'Dbfield was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbfield
      @dbfield = Dbfield.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dbfield_params
      params.require(:dbfield).permit(:name, :dbname, :description, :fieldtype)
    end
end
