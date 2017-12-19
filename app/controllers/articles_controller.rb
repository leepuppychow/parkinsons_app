class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @patient = Patient.find(params[:patient_id])
  end

end
