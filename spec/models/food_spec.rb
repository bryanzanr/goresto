require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'Nasi Goreng'
    subject.description = 'Nasi yang digoreng'
    subject.price = 20.0
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.description = 'Nasi yang digoreng'
    subject.price = 20.0
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.name = 'Nasi Goreng'
    subject.description = 'Nasi yang digoreng'
    expect(subject).to_not be_valid
  end
end
