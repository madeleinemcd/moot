require 'rails_helper'
require 'devise'

RSpec.describe ReviewsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  before do
    # Create a sample user and some sample reviews in the database
    @user = User.create!(email: 'user@email.com',
                        username: 'user',
                        password: 'password1',
                        first_name: 'User',
                        last_name: 'User',
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

    sign_in @user

  end

  it 'allows the user to search for a review' do
    # controller = ReviewsController.new

    # Stub the database query to return expected results for the search
    # allow(Review).to receive(:where).and_return([@review1])

    # # Simulate a request to the root path
    get :index

    # Fill in the search form with a query
    post :index, params: { query: 'Sample Review 1' }

    # Check if the search results page contains the expected content
    expect(response).to have_content('Sample Review 1')
    expect(response).to have_content(@review1.content)

    # Check that the other review is not present
    expect(response).not_to have_content('Sample Review 2')
    expect(response).not_to have_content(@review2.content)
  end
end

# class PostsControllerTest < ReviewsController::TestCase
#   include Devise::Test::IntegrationHelpers # Rails >= 5

#   RSpec.describe YourController, type: :controller do
