require 'json'

class ParseJson

  attr_accessor :json_file

  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
  end

end

example = ParseJson.new('json_exchange_rates.json')
p example.json_file
