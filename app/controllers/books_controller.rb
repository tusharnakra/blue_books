class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    
    if @book.save
      redirect_to books_path, notice: "The book #{@book.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice:  "The book #{@book.name} has been deleted."
  end
  
  def showBook_pdf
    @book = Book.find(params[:id])

    #print "******************************** #{@document.all}"
    #pdf_filename = File.join(Rails.root, "tmp/my_pdf_doc.pdf")
    #send_file(pdf_filename, :filename => "your_document.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def book_search
    @books = Book.where("name LIKE ? ", "%#{params[:book_search]}%")  
    render :template =>"books/index"
  end
  
  def download_book
    book = Book.find(params[:id])
    send_file("#{Rails.root}/public" + book.attachment_url)
  end

  def update
    @book = Book.find(params[:id]);
    book_path = "#{Rails.root}/public" + @book.attachment_url
    book_name = @book.name
    if current_member.group.name.downcase.eql?"admin"
      render :template =>"books/update_post_approval"
    else
      redirect_to :controller => 'send_documents', :action => 'new', :book_path => book_path, :book_name => book_name
    end
  end

  
  def update_post_approval
    @book = Book.find(params[:id])
    @book.destroy
    @book = Book.new(params[:book])
    if @book.save
      redirect_to books_path, notice: "The book #{@book.name} has been updated."
    else
      render "new"
    end
  end

end
