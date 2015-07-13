require "rails_helper"

RSpec.describe Album, :type => :model do
  it "orders by name" do
    lindeman = Album.create!(name: "Andy", description: "Lindeman")
    chelimsky = Album.create!(name: "David", description: "Chelimsky")
    vikrant = Album.create!(name: "vikrant", description: "The creator")
    gaurav = Album.create!(name: "gaurav", description: "Same Same")

    expect(Album.order(:name)).to eq([lindeman, chelimsky, gaurav, vikrant])
  end
end