class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @patient = Patient.find(params[:patient_id])
    #Twitter Standard search API
    #https://api.twitter.com/1.1/search/tweets.json
  end

  def create
    Article.destroy_all
    @patient = Patient.find(params[:patient_id])
    @year = params[:year]
    @search = params[:search]

    response = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=#{@search}+AND+#{@year}[pdat]")
    raw_data = response.body
    unprocessed_ids = Nokogiri::XML(raw_data).xpath("//Id").to_s
    pubmed_ids = unprocessed_ids.delete('<Id>').split("/")

    pubmed_ids.each do |id|
      Article.create!(title: ".", content: ".", address: id)
    end

    redirect_to patient_articles_path(@patient)
  end

end
