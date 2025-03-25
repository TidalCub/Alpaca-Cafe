require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    context "when user is signed in" do
      it "redirects to user_home_path" do
        subject.stub(:user_signed_in?).and_return(true)
        get :index
        expect(response).to redirect_to(user_home_path)
      end
    end

    context "when user is not signed in" do
      it "renders the index template" do
        subject.stub(:user_signed_in?).and_return(false)
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end