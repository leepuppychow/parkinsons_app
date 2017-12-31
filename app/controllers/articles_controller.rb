class ArticlesController < ApplicationController
  def index
    @articles = []
  end

  def create
    @year = params[:year]
    @search = params[:search]
    @articles = []

    response = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=#{@search}+AND+#{@year}[pdat]")
    unprocessed_ids = Nokogiri::XML(response.body).xpath("//Id")
    pubmed_ids = unprocessed_ids.map {|element| element.children.text}

    summaries = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{pubmed_ids.join(",")}")
    summaries_body = Nokogiri::XML(summaries.body).xpath('//*[@Name="Title"]')
    titles = summaries_body.map {|element| element.children.text}
    @articles = pubmed_ids.zip(titles) if pubmed_ids

    render :index
  end

  def show
    #this is for the patient's Twitter show page
  end

end
