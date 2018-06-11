require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    # expect(@menu.xpath_get_price).to all be < 10
    @menu.xpath_get_price.each do |price|
      expect(price).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @menu.get_calories_except_full_breaky.each do |calorie|
      expect(calorie).to be <= 1000
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @menu.get_waffles_des.each do |waffle|
      expect(waffle.include?('Two')).to be TRUE
      expect(waffle.include?('waffles') || waffle.include?('Waffle')).to be TRUE
    end
  end
end
