require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe BrandsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Brand. As you add validations to Brand, be sure to
  # adjust the attributes here as well.

  let(:admin) {create(:admin, password: 'password')}

  let(:valid_attributes) {
    {
      title: "Brand Title",
      logo: "http://example.com/logo.png",
      url: "http://example.com",
      description: "A great description about this Brand.",
      published: false
    }
  }

  let(:invalid_attributes) {
    {
      title: "",
      logo: "",
      url: "",
      description: "",
      published: ""
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BrandsController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: admin.id } }

  describe "GET #index" do
    it "assigns all brands as @brands" do
      brand = Brand.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:brands)).to eq([brand])
    end
  end

  describe "GET #show" do
    it "assigns the requested brand as @brand" do
      brand = Brand.create! valid_attributes
      get :show, {:id => brand.to_param}, valid_session
      expect(assigns(:brand)).to eq(brand)
    end
  end

  describe "GET #new" do
    it "assigns a new brand as @brand" do
      get :new, {}, valid_session
      expect(assigns(:brand)).to be_a_new(Brand)
    end
  end

  describe "GET #edit" do
    it "assigns the requested brand as @brand" do
      brand = Brand.create! valid_attributes
      get :edit, {:id => brand.to_param}, valid_session
      expect(assigns(:brand)).to eq(brand)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Brand" do
        expect {
          post :create, {:brand => valid_attributes}, valid_session
        }.to change(Brand, :count).by(1)
      end

      it "assigns a newly created brand as @brand" do
        post :create, {:brand => valid_attributes}, valid_session
        expect(assigns(:brand)).to be_a(Brand)
        expect(assigns(:brand)).to be_persisted
      end

      it "redirects to the created brand" do
        post :create, {:brand => valid_attributes}, valid_session
        expect(response).to redirect_to(Brand.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved brand as @brand" do
        post :create, {:brand => invalid_attributes}, valid_session
        expect(assigns(:brand)).to be_a_new(Brand)
      end

      it "re-renders the 'new' template" do
        post :create, {:brand => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title: "A new Brand Title",
          logo: "http://example.com/logo.png",
          url: "http://example.com",
          description: "A great description about this Brand.",
          published: true
        }
      }

      it "updates the requested brand" do
        brand = Brand.create! valid_attributes
        put :update, {:id => brand.to_param, :brand => new_attributes}, valid_session
        brand.reload
        expect(brand.title).to eq("A new Brand Title")
        expect(brand.published).to eq(true)
      end

      it "assigns the requested brand as @brand" do
        brand = Brand.create! valid_attributes
        put :update, {:id => brand.to_param, :brand => valid_attributes}, valid_session
        expect(assigns(:brand)).to eq(brand)
      end

      it "redirects to the brand" do
        brand = Brand.create! valid_attributes
        put :update, {:id => brand.to_param, :brand => valid_attributes}, valid_session
        expect(response).to redirect_to(brand)
      end
    end

    context "with invalid params" do
      it "assigns the brand as @brand" do
        brand = Brand.create! valid_attributes
        put :update, {:id => brand.to_param, :brand => invalid_attributes}, valid_session
        expect(assigns(:brand)).to eq(brand)
      end

      it "re-renders the 'edit' template" do
        brand = Brand.create! valid_attributes
        put :update, {:id => brand.to_param, :brand => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested brand" do
      brand = Brand.create! valid_attributes
      expect {
        delete :destroy, {:id => brand.to_param}, valid_session
      }.to change(Brand, :count).by(-1)
    end

    it "redirects to the brands list" do
      brand = Brand.create! valid_attributes
      delete :destroy, {:id => brand.to_param}, valid_session
      expect(response).to redirect_to(brands_url)
    end
  end

end
