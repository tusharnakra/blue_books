class DocumentListsController < ApplicationController
  # GET /document_lists
  # GET /document_lists.json
  def index
    @document_lists = DocumentList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_lists }
    end
  end

  # GET /document_lists/1
  # GET /document_lists/1.json
  def show
    @document_list = DocumentList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_list }
    end
  end

  # GET /document_lists/new
  # GET /document_lists/new.json
  def new
    @document_list = DocumentList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_list }
    end
  end

  # GET /document_lists/1/edit
  def edit
    @document_list = DocumentList.find(params[:id])
  end

  # POST /document_lists
  # POST /document_lists.json
  def create
    @document_list = DocumentList.new(params[:document_list])

    respond_to do |format|
      if @document_list.save
        format.html { redirect_to @document_list, notice: 'Document list was successfully created.' }
        format.json { render json: @document_list, status: :created, location: @document_list }
      else
        format.html { render action: "new" }
        format.json { render json: @document_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_lists/1
  # PUT /document_lists/1.json
  def update
    @document_list = DocumentList.find(params[:id])

    respond_to do |format|
      if @document_list.update_attributes(params[:document_list])
        format.html { redirect_to @document_list, notice: 'Document list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_lists/1
  # DELETE /document_lists/1.json
  def destroy
    @document_list = DocumentList.find(params[:id])
    @document_list.destroy

    respond_to do |format|
      format.html { redirect_to document_lists_url }
      format.json { head :no_content }
    end
  end
end
