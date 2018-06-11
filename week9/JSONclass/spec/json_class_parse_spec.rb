require 'spec_helper'

describe 'Testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

  it 'should be a hash data type' do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it 'should contain the base as EUR' do
    expect(@exchange_rates.get_base).to eq "EUR"
  end

  it 'should have a date string' do
    expect(@exchange_rates.get_date).to be_kind_of(String)
  end

  it 'should have 31 rates that is not zero' do
    expect(@exchange_rates.get_rates_length).to eq 31
    expect(@exchange_rates.get_rates_values).to all be > 0.0
  end

  it 'should have all rates be floats' do
    expect(@exchange_rates.get_rates_values).to all be_kind_of(Float)
  end

end
