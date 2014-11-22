class UserMailer < ActionMailer::Base
  def send_request(request_access)
    admin_id = Group.find(:all, :conditions => ["name LIKE ?", "Admin"]).first[:id]
    emails = []
    EmailAddress.find(:all, :conditions => ["group_id LIKE ?", admin_id]).each do |table_entry|
      emails << table_entry[:name]
    end


    Mail.deliver do
      from    'shallav.varma@gmail.com'
      to      emails
      subject request_access.subject
      body    request_access.description
    end
    
  end
  
  def notify_groups()
     
  end
end
