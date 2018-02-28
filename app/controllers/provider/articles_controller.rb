class Provider::ArticlesController < ApplicationController

    def index
      @articles = []
    end

    def pubmed_ids(search, year)
      response = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=#{search}+AND+#{year}[pdat]")
      unprocessed_ids = Nokogiri::XML(response.body).xpath("//Id")
      unprocessed_ids.map {|element| element.children.text}
    end

    def get_articles(search, year)
      summaries = Faraday.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{pubmed_ids(search, year).join(",")}")
      unprocessed_titles = Nokogiri::XML(summaries.body).xpath('//*[@Name="Title"]')
      titles = unprocessed_titles.map {|element| element.children.text}
      pubmed_ids(search, year).zip(titles)
    end

    def create
      @year = params[:year]
      @search = params[:search]
      @articles = get_articles(@search, @year)
      render :index
    end

end
