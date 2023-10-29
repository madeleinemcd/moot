require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  render_views

  before do
    # Create a sample user and some sample reviews in the database
    @user = User.create!(email: 'user@email.com',
                        username: 'user',
                        password: 'password1',
                        first_name: 'User',
                        last_name: 'TestUser',
                        type: 'Admin')
    @review1 = Review.create!(title: 'Sample Review 1',
                              subtitle:'review 1 subtitle',
                              content: 'Sample Content 1',
                              category: 'movies & tv',
                              user: @user)
    @review2 = Review.create!(title: 'Sample Review 2',
                              subtitle:'review 2 subtitle',
                              content: 'Sample Content 2',
                              category: 'movies & tv',
                              user: @user)

    sign_in @user, scope: :admin

  end

  it 'allows the user to search for a review' do

    # Stub the database query to return expected results for the search
    # allow(Review).to receive(:where).and_return([@review1])


    # Fill in the search form with a query
    get :index, params: { query: 'Sample Review 1' }

    # require 'pry';
    # binding.pry
    # Check if the search results page contains the expected content
    expect(response.body).to have_content('Sample Review 1')
    expect(response.body).to have_content(@review1.content)

    # Check that the other review is not present
    expect(response.body).not_to have_content('Sample Review 2')
    expect(response.body).not_to have_content(@review2.content)
  end
end

# class PostsControllerTest < ReviewsController::TestCase
#   include Devise::Test::IntegrationHelpers # Rails >= 5

#   RSpec.describe YourController, type: :controller do
