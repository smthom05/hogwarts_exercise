require 'rails_helper'

describe 'Hogwarts Service' do
  it 'exists' do
    house = 'ravenclaw'
    hs = HogwartsService.new(house)

    expect(hs).to be_a(HogwartsService)
  end

  describe 'instance methods' do
    it '#get_members' do
      house = 'ravenclaw'
      hs = HogwartsService.new(house)

      result = hs.get_members.first

      expect(result).to be_a(Hash)
      expect(result).to have_key('name')
      expect(result).to have_key('id')
    end
  end

end
