# if Rails.env.test? or Rails.env.cucumber?
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end
# end
#
# if Rails.env.development?
#   CarrierWave.configure do |config|
#     config.storage = :file
#   end
# end
#
# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.storage = :s3
#   end
# end
#
# AttachmentUploader