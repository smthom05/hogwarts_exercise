class HogwartsOutsourcedService
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def get_members
    houses = get_json("")
    get_house_data(houses)
  end

  def get_house_data(houses)
    id = 0
    houses.each do |house|
      if house["name"] == @house
        id = house['id']
      end
      id
    end
    get_json("#{id}")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: "https://hogwarts-as-a-service.herokuapp.com/api/v1/house/") do |faraday|
      faraday.headers['x_api_key'] = ENV['OUTSOURCED_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end



end
