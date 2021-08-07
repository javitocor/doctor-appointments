class SearchesController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to users_index_path
      # redirect_to users_url
  else
      @results = User.search(params[:search])
  end
  end
end
