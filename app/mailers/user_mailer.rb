class UserMailer < ActionMailer::Base
  def send_request(request_access, current_member)

    admin_id = Group.where(:name => "Admin").first[:id]
    emails = []
    Member.where(:group_id => admin_id).each do |table_entry|
      emails << table_entry[:email_address]
    end
    
    temp = "Name : #{current_member.first_name} #{current_member.last_name} \n" + "Pennkey: #{current_member.pennkey} \n" + "Email: #{current_member.email} \n\n" + request_access.description
    
    Mail.deliver do
      from    'fileshare597@gmail.com'
      to      emails
      subject request_access.subject
      body    temp
    end
    
  end
  
  
  def send_doc_for_approval(send_document, current_member, book_path, book_name)
    admin_id = Group.where(:name => "Admin").first[:id]
    emails = []
    Member.where(:group_id => admin_id).each do |table_entry|
      emails << table_entry[:email_address]
    end
    
    temp = "Name : #{current_member.first_name} #{current_member.last_name} \n" + "Pennkey: #{current_member.pennkey} \n" + "Email: #{current_member.email} \n"
    temp = temp + "Book : #{book_name} \n\n"
    temp =  temp + send_document.description if send_document.description?
    
    Mail.deliver do
      from    'fileshare597@gmail.com'
      to      emails
      subject send_document.subject
      body    temp
      #attachments.inline[File.basename(send_document.attachment.path)] = File.read(send_document.attachment.path)
      add_file :filename => 'original_book.pdf', :content => File.read(book_path)
      add_file :filename => 'modified_book.pdf', :content => File.read(send_document.attachment.path)
    end
  end
end
