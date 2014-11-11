class EmailGroupsController < ApplicationController
  # GET /email_groups
  # GET /email_groups.json
  def index
    @email_groups = EmailGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_groups }
    end
  end

  # GET /email_groups/1
  # GET /email_groups/1.json
  def show
    @email_group = EmailGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_group }
    end
  end

  # GET /email_groups/new
  # GET /email_groups/new.json
  def new
    @email_group = EmailGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_group }
    end
  end

  # GET /email_groups/1/edit
  def edit
    @email_group = EmailGroup.find(params[:id])
  end

  # POST /email_groups
  # POST /email_groups.json
  def create
    @email_group = EmailGroup.new(params[:email_group])

    respond_to do |format|
      if @email_group.save
        format.html { redirect_to @email_group, notice: 'Email group was successfully created.' }
        format.json { render json: @email_group, status: :created, location: @email_group }
      else
        format.html { render action: "new" }
        format.json { render json: @email_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_groups/1
  # PUT /email_groups/1.json
  def update
    @email_group = EmailGroup.find(params[:id])

    respond_to do |format|
      if @email_group.update_attributes(params[:email_group])
        format.html { redirect_to @email_group, notice: 'Email group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_groups/1
  # DELETE /email_groups/1.json
  def destroy
    @email_group = EmailGroup.find(params[:id])
    @email_group.destroy

    respond_to do |format|
      format.html { redirect_to email_groups_url }
      format.json { head :no_content }
    end
  end
end
