require 'spec_helper'
RSpec.describe BuildingsController, type: :controller do
  fixtures :users

  # This should return the minimal set of attributes required to create a valid
  # building. As you add validations to building, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "Landry Library"}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # buildingsController. Be sure to keep this updated too.
  let(:valid_session) { sign_in users(:admin) }

  describe "GET #index" do
    it "assigns all buildings as @buildings" do
      building = Building.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:buildings)).to include(building)
    end
  end

  describe "GET #show" do
    it "assigns the requested building as @building" do
      building = Building.create! valid_attributes
      get :show, {:id => building.to_param}, valid_session
      expect(assigns(:building)).to eq(building)
    end
  end

  describe "GET #new" do
    it "assigns a new building as @building" do
      get :new, {}, valid_session
      expect(assigns(:building)).to be_a_new(Building)
    end
  end

  describe "GET #edit" do
    it "assigns the requested building as @building" do
      building = Building.create! valid_attributes
      get :edit, {:id => building.to_param}, valid_session
      expect(assigns(:building)).to eq(building)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new building" do
        expect {
          post :create, {:building => valid_attributes}, valid_session
        }.to change(Building, :count).by(1)
      end

      it "assigns a newly created building as @building" do
        post :create, {:building => valid_attributes}, valid_session
        expect(assigns(:building)).to be_a(Building)
        expect(assigns(:building)).to be_persisted
      end

      it "redirects to the created building" do
        post :create, {:building => valid_attributes}, valid_session
        expect(response).to redirect_to(Building.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved building as @building" do
        post :create, {:building => invalid_attributes}, valid_session
        expect(assigns(:building)).to be_a_new(Building)
      end

      it "re-renders the 'new' template" do
        post :create, {:building => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Landry Memorial Library"}
      }

      it "updates the requested building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => new_attributes}, valid_session
        building.reload
        expect(building.name).to include("Memorial")
      end

      it "assigns the requested building as @building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => valid_attributes}, valid_session
        expect(assigns(:building)).to eq(building)
      end

      it "redirects to the building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => valid_attributes}, valid_session
        expect(response).to redirect_to(building)
      end
    end

    context "with invalid params" do
      it "assigns the building as @building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => invalid_attributes}, valid_session
        expect(assigns(:building)).to eq(building)
      end

      it "re-renders the 'edit' template" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested building" do
      building = Building.create! valid_attributes
      expect {
        delete :destroy, {:id => building.to_param}, valid_session
      }.to change(Building, :count).by(-1)
    end

    it "redirects to the buildings list" do
      building = Building.create! valid_attributes
      delete :destroy, {:id => building.to_param}, valid_session
      expect(response).to redirect_to(buildings_url)
    end
  end

end
