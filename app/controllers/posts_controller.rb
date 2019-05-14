class PostsController < ApplicationController
  get '/posts' do
    "List of publicly available posts."
  end

  get '/posts/new' do
    # Chcecking if logged in and redirecting if they aren't.
    if !logged_in?
      redirect "/login"
    else
      "A new post form"
    end
  end

  get '/posts/:id/:edit' do
    if !logged_in?
      redirect "/login"
    else
      "An edit post form"
    end
  end

end
