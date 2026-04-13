require "test_helper"

class BackofficeSessionsTest < ActionDispatch::IntegrationTest
  test "admin sign in redirects to home" do
    get new_admin_session_path

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    assert_match "O login administrativo nao esta disponivel.", response.body
  end

  test "home does not show backoffice sign in button" do
    get root_path

    assert_response :success
    assert_select "a[href='/backoffice/sign_in']", count: 0
    assert_no_match "Entrar no backoffice", response.body
  end
end
