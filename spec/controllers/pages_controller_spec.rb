RSpec.describe PagesController, type: :controller do
  describe "GET #main" do
    it "renders the main page" do
      get :main
      expect(response).to render_template(:main)
    end

    it "assigns @database_options" do
      get :main
      expect(assigns(:database_options)).to eq(%w[mysql postgresql oracle sqlite3])
    end

    it "assigns @selected_database" do
      get :main
      expect(assigns(:selected_database)).to eq('sqlite3')
    end
  end

  describe "POST #generate" do
    it "generates the correct Rails command with default database" do
      post :generate
      expect(assigns(:command)).to eq("rails new myapp --database=sqlite3")
    end

    it "generates the correct Rails command with selected database" do
      post :generate, params: { database: 'postgresql' }
      expect(assigns(:command)).to eq("rails new myapp --database=postgresql")
    end
  end
end
