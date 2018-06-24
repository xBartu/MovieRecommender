require 'test_helper'

class MoviepeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movieperson = moviepeople(:one)
  end

  test "should get index" do
    get moviepeople_url
    assert_response :success
  end

  test "should get new" do
    get new_movieperson_url
    assert_response :success
  end

  test "should create movieperson" do
    assert_difference('Movieperson.count') do
      post moviepeople_url, params: { movieperson: { movie_id: @movieperson.movie_id, person_id: @movieperson.person_id, role_name: @movieperson.role_name } }
    end

    assert_redirected_to movieperson_url(Movieperson.last)
  end

  test "should show movieperson" do
    get movieperson_url(@movieperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_movieperson_url(@movieperson)
    assert_response :success
  end

  test "should update movieperson" do
    patch movieperson_url(@movieperson), params: { movieperson: { movie_id: @movieperson.movie_id, person_id: @movieperson.person_id, role_name: @movieperson.role_name } }
    assert_redirected_to movieperson_url(@movieperson)
  end

  test "should destroy movieperson" do
    assert_difference('Movieperson.count', -1) do
      delete movieperson_url(@movieperson)
    end

    assert_redirected_to moviepeople_url
  end
end
