class SendDocumentsController < ApplicationController
  # GET /send_documents
  # GET /send_documents.json
  # def index
#     @send_documents = SendDocument.all
#
#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @send_documents }
#     end
#   end

  # GET /send_documents/1
  # GET /send_documents/1.json
  def show
    @send_document = SendDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @send_document }
    end
  end

  # GET /send_documents/new
  # GET /send_documents/new.json
  def new
    @send_document = SendDocument.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @send_document }
    end
  end

  # GET /send_documents/1/edit
  # def edit
#     @send_document = SendDocument.find(params[:id])
#   end

  # POST /send_documents
  # POST /send_documents.json
  def create
    @send_document = SendDocument.new(params[:send_document])
    respond_to do |format|
      if @send_document.save
        UserMailer.send_doc_for_approval(@send_document)
        format.html { redirect_to @send_document, notice: 'Document was sent for approval.' }
        format.json { render json: @send_document, status: :created, location: @send_document }
      else
        format.html { render action: "new" }
        format.json { render json: @send_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /send_documents/1
  # PUT /send_documents/1.json
  # def update
#     @send_document = SendDocument.find(params[:id])
#
#     respond_to do |format|
#       if @send_document.update_attributes(params[:send_document])
#         format.html { redirect_to @send_document, notice: 'Send document was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @send_document.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /send_documents/1
#   # DELETE /send_documents/1.json
#   def destroy
#     @send_document = SendDocument.find(params[:id])
#     @send_document.destroy
#
#     respond_to do |format|
#       format.html { redirect_to send_documents_url }
#       format.json { head :no_content }
#     end
#   end
end
