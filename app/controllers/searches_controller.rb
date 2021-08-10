class SearchesController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to :back
  else
      @results = Doctor.search(params[:search])
  end
  end
end
