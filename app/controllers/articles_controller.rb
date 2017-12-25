class ArticlesController < ApplicationController

  def index
    @articles = []
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @year = params[:year]
    @search = params[:search]
    @articles = []

    response = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=#{@search}+AND+#{@year}[pdat]")
    raw_data = response.body
    unprocessed_ids = Nokogiri::XML(raw_data).xpath("//Id").to_s
    pubmed_ids = unprocessed_ids.delete('<Id>').split("/")

    summaries = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{pubmed_ids.join(",")}")
    summaries_body = Nokogiri::XML(summaries.body)
    titles = summaries_body.xpath('//*[@Name="Title"]').map {|element| element.children.text}
    @articles = pubmed_ids.zip(titles) if pubmed_ids

    render :index
  end

  def show
    #this is for the patient's Twitter show page
    @patient = Patient.find(params[:patient_id])
  end

end
