RSpec.describe StudentsController do
  fixtures :users, :students
  let(:valid_session) { sign_in users(:admin) }
  let(:valid_attributes) {{first_name: "Susan", last_name: "Noetal"}}
  
  describe "GET #index" do
    it "assigns all students as @students" do
      student = Student.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to render_template('index')
    end
  end

end
