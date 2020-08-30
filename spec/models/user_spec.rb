require 'rails_helper'

RSpec.describe User, type: :model do
  context "Migrations" do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false, unique: true) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:email) }

    context "email unique?" do
      subject { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end
  end
end
