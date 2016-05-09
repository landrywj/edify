require 'rails_helper'

RSpec.describe OfferingsController do
  fixtures :semesters, :courses, :users

  # This should return the minimal set of attributes required to create a valid
  # Offering. As you add validations to Offering, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {course_id: courses(:one).id, semester_id: semesters(:one).id }
  }

  let(:invalid_attributes) {
    {course_id: nil, semester_id: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OfferingsController. Be sure to keep this updated too.
  let(:valid_session) { sign_in users(:admin) }

  describe "GET #index" do
    it "assigns all offerings as @offerings" do
      offering = Offering.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:offerings)).to eq([offering])
    end
  end

  describe "GET #show" do
    it "assigns the requested offering as @offering" do
      offering = Offering.create! valid_attributes
      get :show, {:id => offering.to_param}, valid_session
      expect(assigns(:offering)).to eq(offering)
    end
  end

  describe "GET #new" do
    it "assigns a new offering as @offering" do
      get :new, {}, valid_session
      expect(assigns(:offering)).to be_a_new(Offering)
    end
  end

  describe "GET #edit" do
    it "assigns the requested offering as @offering" do
      offering = Offering.create! valid_attributes
      get :edit, {:id => offering.to_param}, valid_session
      expect(assigns(:offering)).to eq(offering)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Offering" do
        expect {
          post :create, {:offering => valid_attributes}, valid_session
        }.to change(Offering, :count).by(1)
      end

      it "assigns a newly created offering as @offering" do
        post :create, {:offering => valid_attributes}, valid_session
        expect(assigns(:offering)).to be_a(Offering)
        expect(assigns(:offering)).to be_persisted
      end

      it "redirects to the created offering" do
        post :create, {:offering => valid_attributes}, valid_session
        expect(response).to redirect_to(Offering.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved offering as @offering" do
        post :create, {:offering => invalid_attributes}, valid_session
        expect(assigns(:offering)).to be_a_new(Offering)
      end

      it "re-renders the 'new' template" do
        post :create, {:offering => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {credits: 3, format: "online"}
      }

      it "updates the requested offering" do
        offering = Offering.create! valid_attributes
        put :update, {:id => offering.to_param, :offering => new_attributes}, valid_session
        offering.reload
        expect(offering.credits).to eq(3)
      end

      it "assigns the requested offering as @offering" do
        offering = Offering.create! valid_attributes
        put :update, {:id => offering.to_param, :offering => valid_attributes}, valid_session
        expect(assigns(:offering)).to eq(offering)
      end

      it "redirects to the offering" do
        offering = Offering.create! valid_attributes
        put :update, {:id => offering.to_param, :offering => valid_attributes}, valid_session
        expect(response).to redirect_to(offering)
      end
    end

    context "with invalid params" do
      it "assigns the offering as @offering" do
        offering = Offering.create! valid_attributes
        put :update, {:id => offering.to_param, :offering => invalid_attributes}, valid_session
        expect(assigns(:offering)).to eq(offering)
      end

      it "re-renders the 'edit' template" do
        offering = Offering.create! valid_attributes
        put :update, {:id => offering.to_param, :offering => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested offering" do
      offering = Offering.create! valid_attributes
      expect {
        delete :destroy, {:id => offering.to_param}, valid_session
      }.to change(Offering, :count).by(-1)
    end

    it "redirects to the offerings list" do
      offering = Offering.create! valid_attributes
      delete :destroy, {:id => offering.to_param}, valid_session
      expect(response).to redirect_to(offerings_url)
    end
  end

end
