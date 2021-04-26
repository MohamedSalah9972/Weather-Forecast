class WeatherController < ApplicationController
  require 'net/http'
  require 'uri'

  def index

  end

  def search
    query = params.permit(:search_name)
    uri = URI("http://api.weatherapi.com/v1/search.json?key=b327a9d2b25d4573853112229201912&q=" + query[:search_name])
    res = Net::HTTP.get_response(uri)
    res = JSON.parse(res.body)
    @search_list = res
  end

  def show
    query = params.permit(:id)
    uri = URI('http://api.weatherapi.com/v1/forecast.json?key=b327a9d2b25d4573853112229201912&q='+query.to_s)
    res = Net::HTTP.get_response(uri)
    json_response = JSON.parse(res.body)
    @city = json_response['location']['name']
    @country = json_response['location']['country']
    @localtime = json_response['location']['localtime']
    @condition = json_response['current']['condition']
    @temp_c = json_response['current']['temp_c'].to_i
    @temp_f = json_response['current']['temp_f'].to_i
  end

end
