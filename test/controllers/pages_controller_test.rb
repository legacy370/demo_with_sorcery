require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration
  setup do
    @user = users(:noam)
    post sessions_path, params: { email: @user.email, password: "secret"}
    follow_redirect!
  end

  test "should get index" do
    get secret_path
    assert_response :success
  end
end
