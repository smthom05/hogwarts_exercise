class SearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def total_members
    service.get_members.count
  end

  def members
    response = service.get_members
    response.map do |member_data|
      Member.new(member_data)
    end
  end

  def service
    HogwartsService.new(@house)
  end

end
