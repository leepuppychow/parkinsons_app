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

    pubmed_ids.each do |id|
      @articles << Article.new(title: ".", content: ".", address: id)
    end

    render :index
  end

  def show
    @patient = Patient.find(params[:patient_id])
  end

end
