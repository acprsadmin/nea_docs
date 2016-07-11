class DbtablesController < ApplicationController
  before_action :set_dbtable, only: [:show, :edit, :update, :destroy]

  # GET /dbtables
  # GET /dbtables.json
  def index
    @dbtables = Dbtable.all
  end

  # GET /dbtables/1
  # GET /dbtables/1.json
  def show
  end

  # GET /dbtables/new
  def new
    @dbtable = Dbtable.new
  end

  # GET /dbtables/1/edit
  def edit
  end

  # POST /dbtables
  # POST /dbtables.json
  def create
    @dbtable = Dbtable.new(dbtable_params)

    respond_to do |format|
      if @dbtable.save
        format.html { redirect_to @dbtable, notice: 'Dbtable was successfully created.' }
        format.json { render :show, status: :created, location: @dbtable }
      else
        format.html { render :new }
        format.json { render json: @dbtable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dbtables/1
  # PATCH/PUT /dbtables/1.json
  def update
    respond_to do |format|
      if @dbtable.update(dbtable_params)
        format.html { redirect_to @dbtable, notice: 'Dbtable was successfully updated.' }
        format.json { render :show, status: :ok, location: @dbtable }
      else
        format.html { render :edit }
        format.json { render json: @dbtable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dbtables/1
  # DELETE /dbtables/1.json
  def destroy
    @dbtable.destroy
    respond_to do |format|
      format.html { redirect_to dbtables_url, notice: 'Dbtable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbtable
      @dbtable = Dbtable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dbtable_params
      params.require(:dbtable).permit(:name, :dbname, :description, :tabletype)
    end
end
