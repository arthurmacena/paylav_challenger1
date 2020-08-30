require 'rails_helper'

RSpec.describe Report, type: :model do
  it "has a valid factory" do
    expect(build(:report)).to be_valid
  end

  context "Migrations" do
    it { is_expected.to have_db_column(:purchaser_name).of_type(:string) }
    it { is_expected.to have_db_column(:item_description).of_type(:text) }
    it { is_expected.to have_db_column(:item_price).of_type(:float) }
    it { is_expected.to have_db_column(:purchase_count).of_type(:integer) }
    it { is_expected.to have_db_column(:merchant_address).of_type(:text) }
    it { is_expected.to have_db_column(:merchant_name).of_type(:string) }
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:purchaser_name) }
    it { is_expected.to validate_presence_of(:item_description) }
    it { is_expected.to validate_presence_of(:item_price) }
    it { is_expected.to validate_presence_of(:purchase_count) }
    it { is_expected.to validate_presence_of(:merchant_address) }
    it { is_expected.to validate_presence_of(:merchant_name) }
  end
end
