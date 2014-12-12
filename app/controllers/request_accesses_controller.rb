class RequestAccessesController < ApplicationController
  # # GET /request_accesses
  # # GET /request_accesses.json
  # def index
  #   @request_accesses = RequestAccess.all
  #
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @request_accesses }
  #   end
  # end

  # GET /request_accesses/1
  # GET /request_accesses/1.json
  def show
    @request_access = RequestAccess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_access }
    end
  end

  # GET /request_accesses/new
  # GET /request_accesses/new.json
  def new
    @request_access = RequestAccess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_access }
    end
  end

  # GET /request_accesses/1/edit
  def edit
    @request_access = RequestAccess.find(params[:id])
  end

  # POST /request_accesses
  # POST /request_accesses.json
  def create
    @request_access = RequestAccess.new(params[:request_access])

    respond_to do |format|
      if @request_access.save
        # Uncomment line below after configuring the server for email functionality
        UserMailer.send_request(@request_access)
        format.html { redirect_to @request_access, notice: 'Request was successfully sent.' }
        format.json { render json: @request_access, status: :created, location: @request_access }

        
      else
        format.html { render action: "new" }
        format.json { render json: @request_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PUT /request_accesses/1
  # # PUT /request_accesses/1.json
  # def update
  #   @request_access = RequestAccess.find(params[:id])
  #
  #   respond_to do |format|
  #     if @request_access.update_attributes(params[:request_access])
  #       format.html { redirect_to @request_access, notice: 'Request access was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @request_access.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /request_accesses/1
  # # DELETE /request_accesses/1.json
  # def destroy
  #   @request_access = RequestAccess.find(params[:id])
  #   @request_access.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to request_accesses_url }
  #     format.json { head :no_content }
  #   end
  # end
end
