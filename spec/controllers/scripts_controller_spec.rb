require 'rails_helper'

describe ScriptsController, type: :controller do

  userID_1 = User.create!(
    email: 'ueferfrfrf@u1.com',
    password: 'useruser',
    password_confirmation: 'useruser'
  )

  script1 = Script.create!(
    name: 'YWoodcutter',
    skill: 'Woodcutting',
    bot_for: 'TRiBot',
    game_for: 'Oldschool Runescape 07',
    user_id: userID_1.id
  )
  script1.save

  describe "GET #index" do
    it "assigns @scripts" do
      get :index
      p script1
      #expect(assigns(:scripts)).to eq([script1])
      expect(assigns(:scripts)).not_to be_empty
    end
  end

  # p "********"
  # p assigns(:scripts).class.name
  # p assigns(:scripts)
  # p response
  # expect(assigns(:scripts)).not_to be_empty
  #it "renders the :index view"

  describe "GET #show" do
    it "assigns the requested contact to @contact"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Contact to @contact"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end
end
