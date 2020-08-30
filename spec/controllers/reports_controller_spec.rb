require "rails_helper"
RSpec.describe ReportsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Report. As you add validations to Report, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:report)
  end

  let(:invalid_attributes) do
    attributes_for(:report, purchaser_name: "")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReportsController. Be sure to keep this updated too.
  context "when user is authorized" do
    before(:each) do
      sign_in create(:user)
    end
    describe "GET #index" do
      it "returns a success response" do
        Report.create! valid_attributes
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        report = Report.create! valid_attributes
        get :show, params: { id: report.to_param }
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        report = Report.create! valid_attributes
        get :edit, params: { id: report.to_param }
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Report" do
          expect do
            post :create, params: { report: valid_attributes }
          end.to change(Report, :count).by(1)
        end

        it "redirects to the created report" do
          post :create, params: { report: valid_attributes }
          expect(response).to redirect_to(Report.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { report: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) do
          { purchaser_name: "New name" }
        end

        it "updates the requested report" do
          report = Report.create! valid_attributes
          put :update, params: { id: report.to_param, report: new_attributes }
          report.reload
          expect(report.purchaser_name).to eq(new_attributes[:purchaser_name])
        end

        it "redirects to the report" do
          report = Report.create! valid_attributes
          put :update, params: { id: report.to_param, report: new_attributes }
          expect(response).to redirect_to(report)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          report = Report.create! valid_attributes
          put :update, params: { id: report.to_param, report: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested report" do
        report = Report.create! valid_attributes
        expect do
          delete :destroy, params: { id: report.to_param }
        end.to change(Report, :count).by(-1)
      end

      it "redirects to the reports list" do
        report = Report.create! valid_attributes
        delete :destroy, params: { id: report.to_param }
        expect(response).to redirect_to(reports_url)
      end
    end

    describe "POST #import" do
      it "create imported requested reports" do
        file = fixture_file_upload('public/example_input.tab', 'text/tab')
        arr_of_row = CSV.read(file.path,{ :headers => true, :col_sep => "\t"})
        expect do
          post :import, params: { file: file }
        end.to change(Report, :count).by(+arr_of_row.length)
      end

      it "redirects to the reports list" do
        file = fixture_file_upload('public/example_input.tab', 'text/tab')
        post :import, params: { file: file }
        expect(response).to redirect_to(reports_url)
      end
    end
  end

  context "when user is not authorized" do
    
    describe "GET #index" do
      it "returns a success response" do
        Report.create! valid_attributes
        get :index, params: {}
        expect(response).not_to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        product = Report.create! valid_attributes
        get :show, params: { id: product.to_param }
        expect(response).not_to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}
        expect(response).not_to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        product = Report.create! valid_attributes
        get :edit, params: { id: product.to_param }
        expect(response).not_to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Report" do
          expect do
            post :create, params: { product: valid_attributes }
          end.to change(Report, :count).by(0)
        end

        it "redirects to the created product" do
          post :create, params: { product: valid_attributes }
          expect(response).not_to redirect_to(Report.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { product: invalid_attributes }
          expect(response).not_to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) do
          { purchaser_name: "New name" }
        end

        it "updates the requested product" do
          product = Report.create! valid_attributes
          put :update, params: { id: product.to_param, product: new_attributes }
          product.reload
          expect(product.purchaser_name).not_to eq(new_attributes[:purchaser_name])
        end

        it "redirects to the product" do
          product = Report.create! valid_attributes
          put :update, params: { id: product.to_param, product: new_attributes }
          expect(response).not_to redirect_to(product)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          product = Report.create! valid_attributes
          put :update, params: { id: product.to_param, product: invalid_attributes }
          expect(response).not_to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested product" do
        product = Report.create! valid_attributes
        expect do
          delete :destroy, params: { id: product.to_param }
        end.to change(Report, :count).by(0)
      end

      it "redirects to the product list" do
        product = Report.create! valid_attributes
        delete :destroy, params: { id: product.to_param }
        expect(response).not_to redirect_to(product)
      end
    end

    describe "POST #import" do
      it "create imported requested reports" do
        file = fixture_file_upload('public/example_input.tab', 'text/tab')
        arr_of_row = CSV.read(file.path,{ :headers => true, :col_sep => "\t"})
        expect do
          post :import, params: { file: file }
        end.to change(Report, :count).by(0)
      end

      it "redirects to the reports list" do
        file = fixture_file_upload('public/example_input.tab', 'text/tab')
        post :import, params: { file: file }
        expect(response).not_to redirect_to(reports_url)
      end
    end
  end
end
