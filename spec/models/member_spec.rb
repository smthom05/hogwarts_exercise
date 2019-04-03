require 'rails_helper'


describe "Member" do
  it 'exists' do
    data = {"name" => "scott", "id" => 3}
    member = Member.new(data)

    expect(member).to be_a(Member)
  end

  it 'has a name and an id' do
    data = {"name" => "scott", "id" => 3}
    member = Member.new(data)

    expect(member.name).to eq("scott")
    expect(member.id).to eq(3)
  end
end
