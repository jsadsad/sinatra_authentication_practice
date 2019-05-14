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
      if post = current_user.posts.find_by(params[:id])
        "An edit post from #{current_user.email} is editing post ##{post.id}"
      else
        redirect '/posts'
      end
    end
  end

end
