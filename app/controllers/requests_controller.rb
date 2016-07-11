class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end


  # GET /requests/1
  # GET /requests/1.json
  def show
    @comments = Comment.where('(commentable_type = ? and commentable_id = ?)', 'Request', @request.id)
    @new_comment = Comment.new

    @thisstatus = @request.textstatus

    @requestlog = Requestlog.where('request_id = ?', @request.id).order('created_at DESC')
    if @request.creator_id
      @creator = User.find(@request.creator_id)
    end

    if @request.submitter_id
      @submitter = User.find(@request.submitter_id)
    end

    if @request.responder_id
      @responder = User.find(@request.responder_id)
    end
    if @request.decided_by
      @decider = User.find(@request.decided_by)
    end
  end





  # GET /requests/new
  def new
    @request = Request.new
    @request.origin = params[:origin]
  end

  # GET /requests/1/edit
  def edit
    puts @request
    @status = @request.textstatus
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)


    respond_to do |format|
      if @request.save
        Requestlog.create(request_id: @request.id, user_id: current_user.id, reqaction: 'created')
        format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




def submit
  @request=Request.find(params[:request_id])
  puts '----------------------------------------------------------------------------------ddddddddddddddddddddddd----------------------'
  puts @request

  if params[:reqaction] == 'clone'
    newrequest = Request.create(subject: @request.subject, creator_id: current_user.id)

  else

    if params[:reqaction] == 'submit'
      @request.submitted_on = Date.today
      @request.submitter_id = current_user.id
      @request.responded_on = nil
    elsif params[:reqaction] == 'recommend'
        @request.submitted_on = Date.today
        @request.submitter_id = current_user.id
        @request.responded_on = Date.today
        @request.responder_id = current_user.id

    elsif params[:reqaction] == 'respond'
      @request.responded_on = Date.today
      @request.responder_id = current_user.id
    elsif params[:reqaction] == 'decide'
      @request.decided_on = Date.today

      @request.decided_by = current_user.id
    elsif params[:reqaction] == 'develop'
      @request.developed_on = Date.today
      @request.tested_on = nil
      @request.deployed_on = nil

    elsif params[:reqaction] == 'test'
      @request.tested_on = Date.today
    elsif params[:reqaction] == 'deploy'
      @request.deployed_on =Date.today

    end
    @request.save
    Requestlog.create(request_id: @request.id, user_id: current_user.id, reqaction: params[:reqaction], nea_decision: @request.nea_decision)


  end
  respond_to do |format|
  format.html { redirect_to @request, notice: 'Request was successfully updated.' }
  end

end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :oldcode, :submitted_on, :role, :submitter, :submitter_id, :requesttype, :urgent, :deployed_on, :origin,
                                      :subject, :description, :pillar_response, :impact_hour, :impact_duration, :impact_schedule, :tested_on, :developed_on, :responded_on,:responder_id,
                                      :approved, :approver_id, :approved_on, :nea_decision, :decided_on, :decisiontext, :conditions, :decided_by, :modernize, :creator_id)
    end
end
