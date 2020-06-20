class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    skip_forgery_protection
end
