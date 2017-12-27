require 'rails_helper'

describe 'AuditLog Feature' do
  describe 'index' do

    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :user)
    end

    it 'has an index page that can be reached' do
      visit(audit_logs_path)
      expect(page.status_code).to be(200)
    end

    it 'renders audit log content' do
      FactoryBot.create(:audit_log)
      visit(audit_logs_path)
      expect(page).to have_content(/SNOW/)
    end

    it 'cannotbe accessedby non-admin users' do
      
    end
  end
end
