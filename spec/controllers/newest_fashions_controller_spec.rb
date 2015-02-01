require 'spec_helper'

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

describe NewestFashionsController do

  # This should return the minimal set of attributes required to create a valid
  # NewestFashion. As you add validations to NewestFashion, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "url" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NewestFashionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all newest_fashions as @newest_fashions" do
      newest_fashion = NewestFashion.create! valid_attributes
      get :index, {}, valid_session
      assigns(:newest_fashions).should eq([newest_fashion])
    end
  end

  describe "GET show" do
    it "assigns the requested newest_fashion as @newest_fashion" do
      newest_fashion = NewestFashion.create! valid_attributes
      get :show, {:id => newest_fashion.to_param}, valid_session
      assigns(:newest_fashion).should eq(newest_fashion)
    end
  end

  describe "GET new" do
    it "assigns a new newest_fashion as @newest_fashion" do
      get :new, {}, valid_session
      assigns(:newest_fashion).should be_a_new(NewestFashion)
    end
  end

  describe "GET edit" do
    it "assigns the requested newest_fashion as @newest_fashion" do
      newest_fashion = NewestFashion.create! valid_attributes
      get :edit, {:id => newest_fashion.to_param}, valid_session
      assigns(:newest_fashion).should eq(newest_fashion)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new NewestFashion" do
        expect {
          post :create, {:newest_fashion => valid_attributes}, valid_session
        }.to change(NewestFashion, :count).by(1)
      end

      it "assigns a newly created newest_fashion as @newest_fashion" do
        post :create, {:newest_fashion => valid_attributes}, valid_session
        assigns(:newest_fashion).should be_a(NewestFashion)
        assigns(:newest_fashion).should be_persisted
      end

      it "redirects to the created newest_fashion" do
        post :create, {:newest_fashion => valid_attributes}, valid_session
        response.should redirect_to(NewestFashion.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved newest_fashion as @newest_fashion" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewestFashion.any_instance.stub(:save).and_return(false)
        post :create, {:newest_fashion => { "url" => "invalid value" }}, valid_session
        assigns(:newest_fashion).should be_a_new(NewestFashion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewestFashion.any_instance.stub(:save).and_return(false)
        post :create, {:newest_fashion => { "url" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested newest_fashion" do
        newest_fashion = NewestFashion.create! valid_attributes
        # Assuming there are no other newest_fashions in the database, this
        # specifies that the NewestFashion created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        NewestFashion.any_instance.should_receive(:update).with({ "url" => "MyString" })
        put :update, {:id => newest_fashion.to_param, :newest_fashion => { "url" => "MyString" }}, valid_session
      end

      it "assigns the requested newest_fashion as @newest_fashion" do
        newest_fashion = NewestFashion.create! valid_attributes
        put :update, {:id => newest_fashion.to_param, :newest_fashion => valid_attributes}, valid_session
        assigns(:newest_fashion).should eq(newest_fashion)
      end

      it "redirects to the newest_fashion" do
        newest_fashion = NewestFashion.create! valid_attributes
        put :update, {:id => newest_fashion.to_param, :newest_fashion => valid_attributes}, valid_session
        response.should redirect_to(newest_fashion)
      end
    end

    describe "with invalid params" do
      it "assigns the newest_fashion as @newest_fashion" do
        newest_fashion = NewestFashion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewestFashion.any_instance.stub(:save).and_return(false)
        put :update, {:id => newest_fashion.to_param, :newest_fashion => { "url" => "invalid value" }}, valid_session
        assigns(:newest_fashion).should eq(newest_fashion)
      end

      it "re-renders the 'edit' template" do
        newest_fashion = NewestFashion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewestFashion.any_instance.stub(:save).and_return(false)
        put :update, {:id => newest_fashion.to_param, :newest_fashion => { "url" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested newest_fashion" do
      newest_fashion = NewestFashion.create! valid_attributes
      expect {
        delete :destroy, {:id => newest_fashion.to_param}, valid_session
      }.to change(NewestFashion, :count).by(-1)
    end

    it "redirects to the newest_fashions list" do
      newest_fashion = NewestFashion.create! valid_attributes
      delete :destroy, {:id => newest_fashion.to_param}, valid_session
      response.should redirect_to(newest_fashions_url)
    end
  end

end