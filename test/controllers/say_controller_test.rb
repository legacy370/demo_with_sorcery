require "test_helper"

class SayControllerTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration
  setup do
    @user = users(:noam)
    post sessions_path, params: {email: @user.email, password: 'secret'}
    follow_redirect!
  end

  test "should get hello" do
    get say_hello_url
    assert_response :success
  end

  test "should get goodbye" do
    get say_goodbye_url
    assert_response :success
  end
end
