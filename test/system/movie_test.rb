require "test_helper"

# I read through the materials, but don't quite understand what is arbitrary naming vs what is required. Looking at the example I'm getting some sense of what this looks like

class MoviesTest < ApplicationSystemTestCase

  test  "creating a director" do
    
  end


  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "List of all movies"
  end

  test "creating a Movie" do
    original_movie_count = Movie.count

    visit movies_url
    click_on "Add a new movie"

    fill_in "Description", with: "A new movie's descroption"
    fill_in "Title", with: "A new movie's title"
    click_on "Create movie"

    assert_text "Movie created successfully"
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count + 1, ending_movie_count
  end

  test "updating a Movie" do
    @movie = movies(:one)

    visit "/movies/#{@movie.id}/edit"

    fill_in "Description", with: "Some other description"
    fill_in "Title", with: "Some other title"

    click_on "Update movie"
    
    assert_text "Movie updated successfully"

    @movie.reload # Why do we need this?
    assert_equal "Some other title", @movie.title
    assert_equal "Some other description", @movie.description
  end

  test "destroying a Movie" do
    @movie = movies(:one)
    original_movie_count = Movie.count

    visit movies_url
    click_on "Show details", match: :first
    click_on "Delete movie"

    assert_text "Movie deleted successfully"
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count - 1, ending_movie_count
  end
end