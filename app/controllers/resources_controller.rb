class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    self.fixresources
    @search = Resource.search do
      fulltext params[:search_term]
      if !params[:technicalarea_ids].nil?
        with(:technicalarea_ids, params[:technicalarea_ids].reject(&:blank?))
      end
      if !params[:targetgroup_ids].nil?
        with(:targetgroup_ids, params[:targetgroup_ids].reject(&:blank?))
      end
      if !params[:organization_ids].nil?
      with(:organization_id, params[:organization_ids].reject(&:blank?)) if params[:organization_ids].present?
      end
      if !params[:series_ids].nil?
          with(:series_id,  params[:series_ids].reject(&:blank?))   if params[:series_ids].present?
      end
      with(:publish_month, params[:month]) if params[:month].present?
      order_by(:published_at, :desc)
      facet :publish_month, :technicalarea_ids, :targetgroup_ids, :organization_id, :series_id

    end

    @resources = @search.results


  end

  def search_resources


    #@orgselectlist = Technicalarea.joins(technicalareas: :translations).where('locale = ?', I18n.locale)

    render 'resources/search_form'
  end






  def fixresources

    @fixareas = TechnicalareasResource.where("resource_id is NULL")
    @fixgroups = TargetgroupsResource.where("resource_id is NULL")
    @fixdocs = SiteDocument.where("documentable_id is NULL")
    @fixproj = Resource.where("project_id is NULL")

    arabicnamed = [1,3,85,86,87,88,89,90,91,92]
    @fixorgs = Organization.where("id not IN (?)" , arabicnamed)
    arabicnamed = [93,91,92]
    @fixproj2 = Project.where("id not IN (?)" , arabicnamed)


    @fixproj2.each do |p|
      updater=Resource.where('orgname = ? ', p.name).update_all(organization_id: p.id)

    end
    @fixorgs.each do |org|
      updater=Resource.where('orgname = ? ', org.name).update_all(organization_id: org.id)

    end






    #upres = { 1 => { "title" => "NEED ENGLISH TRANSLATION" }}
    #Resource.update(upres.keys, upres.values).where('id in (?)', '798,36,20,1084,793,742,740,744,733,1073,735,926,1153,1156,1155,1154' )

    @fixareas.each do |fa|
      rnode= Resource.find_by_nid(fa.nid)
      tnode= Technicalarea.find_by_tid(fa.tid)
      if !rnode.nil?
      fa.resource_id = rnode.id
      end
      if !tnode.nil?
      fa.technicalarea_id = tnode.id

      end
      fa.save

    end

    @fixgroups.each do |fg|
      rnode= Resource.find_by_nid(fg.nid)
      tnode= Targetgroup.find_by_tid(fg.tid)
      if !rnode.nil?
      fg.resource_id = rnode.id
      end
      if !tnode.nil?
      fg.targetgroup_id = tnode.id

      end
      fg.save
    end

    @fixdocs.each do |fd|
      dnode= Resource.find_by_nid(fd.nid)
      if !dnode.nil?
      fd.documentable_id = dnode.id

      fd.save
      end

    end


    @newones= Resource.where('series_id is NULL and pnid > 0')
    @newones.each do |n|
      getparent= Series.find_by_nid(n.pnid)
      n.series_id = getparent.id
      n.save
    end

    #@fixtrans= Resource.where('tid is NULL and tnid > 0')
    #@fixtrans.each do |tran|
    #  geteng= Resource.find_by_nid(tran.tnid)
    #  tran.tid = geteng.id
    #  tran.save
    #end







  end





  # GET /resources/1
  # GET /resources/1.json
  def show



    @resourcedocuments = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'resource', @resource.id)
    @new_site_document = SiteDocument.new

    @resourceimages = SiteImage.where('imageable_type = ? and imageable_id = ?', 'resource', @resource.id)
    @new_site_image = SiteImage.new
    @logo = @resourceimages.where('is_logo is true')
    #mytechnicalareas = TechnicalareasResource.where("nid = ?", params[:id])
    #@mytargetgroups = TargetgroupsResource.where("nid = ?", params[:id])
    if !@resource.series_id.nil?
    @parent = Series.find_by_id(@resource.series_id)
    end
    @en_trans = Resource::Translation.where('locale = ? and resource_id = ?', :en, @resource.id)
    @ar_trans = Resource::Translation.where('locale = ? and resource_id = ?', :ar, @resource.id)
    @fr_trans = Resource::Translation.where('locale = ? and resource_id = ?', :fr, @resource.id)

    @allcomments=Comment.all
    @mycomments = Comment.where('commentable_type = ? and commentable_id = ?', 'Resource', @resource.id).order('created_at desc')
    @new_comment = Comment.new
    
  end

  def set_technicalarea_list
    return Technicalarea.all
  end

  def set_targetgroup_list
    return Targetgroup.all
  end
  def set_country_list
    return Country.all
  end
  def set_tag_list
    return Tag.all
  end




  # GET /resources/new
  def new
    @resource = Resource.new
    @technicalarea_list = set_technicalarea_list
    @targetgroup_list = set_targetgroup_list
    @country_list = set_country_list
    @tag_list = set_tag_list


    if params[:language] != '1'
     #@en_base = Resource.find(params[:engid])
     #@resource.language = params[:language]
      #@resource.tid = params[:engid]
    end

  end


        # GET /resources/1/edit
  def edit

    @technicalarea_list = set_technicalarea_list
    @targetgroup_list = set_targetgroup_list
    @country_list = set_country_list
    @tag_list = set_tag_list
    #@en_base = Resource.find(@resource.tid)


  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    I18n.locale = params[:locale]

    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def checkorgs
    @resources = Resource.order('orgname')
    render 'resources/admin_check_orgs'

  end




  def updatelogos
    @site_images = SiteImage.update(params[:site_images].keys, params[:site_images].values)
    @site_images.reject! { |p| p.errors.empty? }

      redirect_to resource_url(params[:resource_id])


  end



  def updatelangs
    @site_documents = SiteDocument.update(params[:site_documents].keys, params[:site_documents].values)
    @site_documents.reject! { |p| p.errors.empty? }

    redirect_to resource_url(params[:resource_id])


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :body, :submitter, :language, :series_id, :tid, :position, :organization, :organization_id, :project_id, :submitter_email, :submitter_phone, :mepi_project, :mepi_project_number, :focus_women,
                                       :focus_youth, :published_at,  :series_id, :is_featured, technicalarea_ids: [], targetgroup_ids: [], country_ids: [], tag_ids: [])
    end
end
