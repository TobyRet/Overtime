namespace :notification do
  desc "Send SMS to employees asking them to log time"
  task sms: :environment do
    puts 'I am in rake task'
  end

end
