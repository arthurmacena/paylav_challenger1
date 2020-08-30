require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  context "when user is authorized" do

    describe "GET #index" do
      it "returns a success response" do
        get :index, params: {}
        expect(response).to be_successful
      end
    end
  end
end
