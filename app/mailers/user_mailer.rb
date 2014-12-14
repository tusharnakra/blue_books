class UserMailer < ActionMailer::Base
  def send_request(request_access)

    admin_id = Group.find(:all, :conditions => ["name LIKE ?", "Admin"]).first[:id]
    emails = []
    Member.find(:all, :conditions => ["group_id LIKE ?", admin_id]).each do |table_entry|
      emails << table_entry[:email_address]
    end

    Mail.deliver do
      from    'fileshare597@gmail.com'
      to      emails
      subject request_access.subject
      body    request_access.description
    end
    
  end
  
  
  def send_doc_for_approval(send_document)
    admin_id = Group.find(:all, :conditions => ["name LIKE ?", "Admin"]).first[:id]
    emails = []
    Member.find(:all, :conditions => ["group_id LIKE ?", admin_id]).each do |table_entry|
      emails << table_entry[:email_address]
    end

    Mail.deliver do
      from    'fileshare597@gmail.com'
      to      emails
      subject send_document.subject
      attachments.inline[File.basename(send_document.attachment.path)] = File.read(send_document.attachment.path)
      body    send_document.description
    end
  end
end
