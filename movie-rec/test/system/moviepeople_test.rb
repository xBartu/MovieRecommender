require "application_system_test_case"

class MoviepeopleTest < ApplicationSystemTestCase
  setup do
    @movieperson = moviepeople(:one)
  end

  test "visiting the index" do
    visit moviepeople_url
    assert_selector "h1", text: "Moviepeople"
  end

  test "creating a Movieperson" do
    visit moviepeople_url
    click_on "New Movieperson"

    fill_in "Movie", with: @movieperson.movie_id
    fill_in "Person", with: @movieperson.person_id
    fill_in "Role Name", with: @movieperson.role_name
    click_on "Create Movieperson"

    assert_text "Movieperson was successfully created"
    click_on "Back"
  end

  test "updating a Movieperson" do
    visit moviepeople_url
    click_on "Edit", match: :first

    fill_in "Movie", with: @movieperson.movie_id
    fill_in "Person", with: @movieperson.person_id
    fill_in "Role Name", with: @movieperson.role_name
    click_on "Update Movieperson"

    assert_text "Movieperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Movieperson" do
    visit moviepeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movieperson was successfully destroyed"
  end
end
