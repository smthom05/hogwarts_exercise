class HogwartsService
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def get_members
    response = conn.get
    members = JSON.parse(response.body)['data']
    members.first['attributes']['students']
  end

  def conn
    Faraday.new(url: "http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['API_KEY']}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
