class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index




    if !params[:moveit].nil?
      section = Section.find(params[:section_id])
      if params[:moveit] == '1'
        section.oldorder = section.ordernum
        section.ordernum = section.oldorder - 1.5
      end
      if params[:moveit] == '2'
        section.oldorder = section.ordernum
        section.ordernum = section.oldorder + 1.5
      end
      if params[:moveit] == '3'
        vlevel = section.level_id
        section.level_id = vlevel + 1
      end
      if params[:moveit] == '4'
        vlevel = section.level_id
        section.level_id = vlevel - 1
      end
      section.save
    end

    #self.allgen
    self.reorder
    @sections = Section.order(:ordernum)
  end


  def reorder
    sections = Section.order(:ordernum)
    v1=1
    sections.each do |y|
      y.oldorder = y.ordernum
      y.ordernum = v1
      y.save
      v1 = v1 + 1
    end
  end

  def allgen
    sections = Section.order(:ordernum)
    sections.each do |z|
      #z.book = 0
      z.pagetype = 0

      z.save
    end
  end









  def renumber
    sections = Section.order(:ordernum)
    v1=0
    v2=0
    v3=0
    sections.each do |y|
      if y.level_id == 1
        toc1=v1+1
      elsif y.level_id == 2
        toc2=v2+1
      elsif y.level_id ==3
        toc3=v3+1
      end
      y.ordernum = v1
      y.save
      v1 = v1 + 1
    end
  end


  # GET /sections/1
  # GET /sections/1.json
  def show
    @maxnum = Section.maximum("ordernum")
    @comments = Comment.where('(commentable_type = ? and commentable_id = ?)', 'Section', @section.id)
    @new_comment = Comment.new


    nextord = (@section.ordernum + 1)
    backord = (@section.ordernum - 1)
    @nextid = @section.getidfromord(nextord)
    @backid =  @section.getidfromord(backord)


  end

  # GET /sections/new
  def new

    @section = Section.new

    @section.level_id = params[:level]
    @section.ordernum = params[:ordnum]

  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    #before_action :authenticate_user!
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to action: "index", notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update

   #before_action :authenticate_user!
    respond_to do |format|
      if @section.update(section_params)
        format.html {  redirect_to action: "index", notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :body, :ordernum, :chapter_id, :image, :imageset, :caption, :adminnotes, :level_id, :book, :toc1, :toc2, :toc3, :pagetype)
    end
end
