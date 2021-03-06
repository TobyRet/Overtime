@user= User.create!(email: 'test@test.com', phone_number: '0876789879', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Toby', last_name: 'Retallick')

puts 'User has been created'

AdminUser.create!(email: 'admin@admin.com', phone_number: '0794324567', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Admin', last_name: 'User')

puts 'Admin user has been created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts '100 posts have been created'

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts '100 audit logs have been created'
