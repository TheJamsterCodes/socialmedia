class EpicenterController < ApplicationController
  
    before_action :authenticate_user!

    def feed
  	    @following_tweets = []
        Tweet.all.each do |tweet|
            if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
                @following_tweets.push(tweet)
            end
        end
    end

    def all_users
        @users = User.order(:username)
    end

    def show_user
  	    @user = User.find(params[:id])
    end

    def tag_tweets
        @tag = Tag.find(params[:id])
    end

    def now_following
  	    def now_following
    	    current_user.following.push(params[:id].to_i)
    	    current_user.save
    	    redirect_to show_user_path(id: params[:id])
	    end
    end

    def unfollow
        current_user.following.delete(params[:id].to_i)
        current_user.save
        redirect_to show_user_path(id: params[:id])   
    end

end
