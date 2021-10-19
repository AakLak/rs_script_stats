require 'rails_helper'

describe ScriptsController, type: :controller do
  let!(:user) do
    User.create!(
      email: 'ueferfrfrf@u1.com',
      password: 'useruser',
      password_confirmation: 'useruser'
    )
  end

  let!(:script1) do
    Script.create!(
      name: 'YWoodcutter',
      skill: 'Woodcutting',
      bot_for: 'TRiBot',
      game_for: 'Oldschool Runescape 07',
      user_id: user.id
    )
  end

  describe 'GET #index' do
    it 'assigns @scripts' do
      get :index
      expect(assigns(:scripts)).to eq([script1])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested contact to @contact'
    it 'renders the :show template'
  end

  describe 'GET #new' do
    it 'assigns a new Contact to @contact'
    it 'renders the :new template'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new contact in the database'
      it 'redirects to the home page'
    end

    context 'with invalid attributes' do
      it 'does not save the new contact in the database'
      it 're-renders the :new template'
    end
  end
end
