require 'json'

class ParseJson

  attr_reader :json_file

  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
  end

  def get_base
    @json_file["base"]
  end

  def get_date
    @json_file["date"]
  end

  def get_rates_values
    @json_file["rates"].values
  end

  def get_rates_length
    @json_file["rates"].keys.length
  end

  end

example = ParseJson.new('json_exchange_rates.json')
p example.json_file
