require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_names
    @menu.xpath('//name')
  end

  def xpath_get_calories
    @menu.xpath('/breakfast_menu/food/calories')
  end

  def get_food
    @menu.xpath('/breakfast_menu/food')
  end

  def xpath_get_price
    # @menu.xpath('/breakfast_menu/food/price').map { |price| price.to_s.split(/[^\d]/).join.to_f }
    price_array = []
    @menu.xpath('/breakfast_menu/food/price').each do |price|
      price_array << price.text.gsub('£', '').to_f
    end

    price_array
  end

  def get_calories_except_full_breaky
    answer = []
    get_food.each do |food|
      if !food.children[1].text.include?('Full Breakfast')
        answer << food.children[7].text.to_i
      end
    end
    answer
  end

  def get_waffles_des
    answer = []

    get_food.each do |item|
      if item.children[1].text.include?('Waffle')
        answer << item.children[5].text
      end
    end

    answer
  end

  menu = GuiseppesMenu.new
  puts menu.get_menu_names
  puts menu.xpath_get_calories
  puts menu.xpath_get_price

  # Place your methods here

end
