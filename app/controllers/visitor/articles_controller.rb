class Visitor::ArticlesController < ApplicationController

  def index
    @articles = []
  end

  def create
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
#THIS API CAN TAKE THE IDs and GET DOCUMENT SUMMARY!
# ESummary (document summary downloads)
# eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi
# Responds to a list of UIDs from a given database with the corresponding document summaries.

# Basic Downloading
# esummary.fcgi?db=<database>&id=<uid_list>
# Input: List of UIDs (&id); Entrez database (&db)
#
# Output: XML DocSums
#
# Example: Download DocSums for these protein GIs: 6678417,9507199,28558982,28558984,28558988,28558990
#
# https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=protein&id=6678417,9507199,28558982,28558984,28558988,28558990
  end

end
