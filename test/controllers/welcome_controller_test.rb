require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration
  setup do
    @user = users(:noam)
    post sessions_path, params: { email: @user.email, password: 'secret' }
    follow_redirect!
  end

  test "should get index" do
    get welcome_path
    assert_response :success
  end
end
