require 'rails_helper'

RSpec.describe SemestersController, type: :controller do
 fixtures :users
  # This should return the minimal set of attributes required to create a valid
  # Semester. As you add validations to Semester, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Summer 2016", start_date: "Tue, 21 Jun 2016", end_date: "Fri, 19 Aug 2016" }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SemestersController. Be sure to keep this updated too.
  let(:valid_session) { sign_in users(:admin) }

  describe "GET #index" do
    it "assigns all semesters as @semesters" do
      semester = Semester.create! valid_attributes
      get :index, {}, valid_session
      expect(Semester.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "assigns the requested semester as @semester" do
      semester = Semester.create! valid_attributes
      get :show, {:id => semester.to_param}, valid_session
      expect(assigns(:semester)).to eq(semester)
    end
  end

  describe "GET #new" do
    it "assigns a new semester as @semester" do
      get :new, {}, valid_session
      expect(assigns(:semester)).to be_a_new(Semester)
    end
  end

  describe "GET #edit" do
    it "assigns the requested semester as @semester" do
      semester = Semester.create! valid_attributes
      get :edit, {:id => semester.to_param}, valid_session
      expect(assigns(:semester)).to eq(semester)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Semester" do
        expect {
          post :create, {:semester => valid_attributes}, valid_session
        }.to change(Semester, :count).by(1)
      end

      it "assigns a newly created semester as @semester" do
        post :create, {:semester => valid_attributes}, valid_session
        expect(assigns(:semester)).to be_a(Semester)
        expect(assigns(:semester)).to be_persisted
      end

      it "redirects to the created semester" do
        post :create, {:semester => valid_attributes}, valid_session
        expect(response).to redirect_to(Semester.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved semester as @semester" do
        post :create, {:semester => invalid_attributes}, valid_session
        expect(assigns(:semester)).to be_a_new(Semester)
      end

      it "re-renders the 'new' template" do
        post :create, {:semester => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {start_date: "Wed, 22 Jun 2016"}
      }

      it "updates the requested semester" do
        semester = Semester.create! valid_attributes
        put :update, {:id => semester.to_param, :semester => new_attributes}, valid_session
        semester.reload
        expect(semester.start_date).to eq(("2016-06-22").to_date)
      end

      it "assigns the requested semester as @semester" do
        semester = Semester.create! valid_attributes
        put :update, {:id => semester.to_param, :semester => valid_attributes}, valid_session
        expect(assigns(:semester)).to eq(semester)
      end

      it "redirects to the semester" do
        semester = Semester.create! valid_attributes
        put :update, {:id => semester.to_param, :semester => valid_attributes}, valid_session
        expect(response).to redirect_to(semester)
      end
    end

    context "with invalid params" do
      it "assigns the semester as @semester" do
        semester = Semester.create! valid_attributes
        put :update, {:id => semester.to_param, :semester => invalid_attributes}, valid_session
        expect(assigns(:semester)).to eq(semester)
      end

      it "re-renders the 'edit' template" do
        semester = Semester.create! valid_attributes
        put :update, {:id => semester.to_param, :semester => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested semester" do
      semester = Semester.create! valid_attributes
      expect {
        delete :destroy, {:id => semester.to_param}, valid_session
      }.to change(Semester, :count).by(-1)
    end

    it "redirects to the semesters list" do
      semester = Semester.create! valid_attributes
      delete :destroy, {:id => semester.to_param}, valid_session
      expect(response).to redirect_to(semesters_url)
    end
  end

end
