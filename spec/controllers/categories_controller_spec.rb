require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns a 200" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'POST #create' do
    it 'successfully creates a new category' do
      expect{
          post :create, params: { category: { name: "category1", code: 'code1' } }
        }.to change(Category,:count).by(1)
    end
  end
  
  describe 'PUT #update' do
    let(:category2) { Category.create!(name: 'category2', code: 'code2') }
    
    it 'successfully updates an existing category' do
      put :update, params: { id: category2.id, category: { name: "category3" } }
      
      expect(response).to have_http_status(:found)
      expect(category2.reload.name).to eq('CATEGORY3')
    end
  end

  describe "GET #show" do
    it 'can be reached successfully'  do
      category = FactoryBot.create(:category)
      
      get :show, params: { id: category.id }
      
      expect(response.status).to eq(200)
    end
  end

end
