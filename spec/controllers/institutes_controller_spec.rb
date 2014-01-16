require "spec_helper"

describe InstitutesController do


  login_user

  let(:valid_attributes) { { :name => "test name" } }
  let(:invalid_attributes) { { :name => "" } }
  let(:valid_session) { {} }

  describe "GET INDEX" do
    context "With Institutes" do
      it "Assigns current user institutes to @institutes and render template" do
        subject.current_user.should_not be_nil
        current_institutes = FactoryGirl.create_list(:institute, 10, user_id: subject.current_user.id)
        other_institutes = FactoryGirl.create_list(:institute, 15, user_id: FactoryGirl.create(:user).id )
        get :index, {}, valid_session
        assigns(:institutes).should eq(current_institutes.first(5))
        assigns(:institutes).should_not eq(other_institutes.first(5))
        response.should render_template("index")  
      end
    end
    context "Without Institutes" do
      it "Assigns all institutes to @institutes and render template" do
        get :index, {}, valid_session
        assigns(:institutes).should eq([])
        response.should render_template("index")
      end
    end
    context "Institutes with pagination" do
      it "Assigns all institutes to @institutes and render template" do
        created_users = FactoryGirl.create_list(:institute, 10, user_id: subject.current_user.id)
        get :index, {}, valid_session
        assigns(:institutes).length == 5
        response.should render_template("index")
      end
    end
  end

  describe "Get NEW" do
    it "Assigns new institute to @institute and render template new" do
      get :new, {}, valid_session
      assigns(:institute).should be_a_new(Institute)
      response.should render_template("new")
    end
  end

  describe "Get Add New Course" do
    context "With normal flow" do
      it "Assigns institute to @institute" do
        institute = FactoryGirl.create(:institute)
        get :add_new_course, { :id => institute.to_param }, valid_session
        assigns(:institute).should eq(institute)
        assigns(:categories_group).should eq([])
        assigns(:course).should be_a_new(Course)
        response.should render_template("add_new_course")
      end
    end
    context "with data flow" do
      it "abc" do
      data = { "IT" => ["Java", "Ruby"], "Non-IT" => ["Spoken English", "BPO Services", "HR Traning"], "Others" => ["Painting"] }
      data.each do |key, value|
        c = FactoryGirl.create(:category, name: key)
        value.each do |sub_cat|
          c.sub_categories.create(name: sub_cat)
        end
      end
        institute = FactoryGirl.create(:institute)
        get :add_new_course, { :id => institute.to_param }, valid_session
a = [["IT", [["Java", 2], ["Ruby", 3]]], ["Non-IT", [["Spoken English", 5], ["BPO Services", 6], ["HR Traning", 7]]], ["Others", [["Painting", 9]]]]
      assigns(:categories_group).should == a
      end
    end
    
  end

#  describe "Get EDIT" do
#    it "Assigns institute to @institute" do
#      institute = FactoryGirl.create(:institute)
#      get :edit, { :id => institute.to_param }, valid_session
#      assigns(:institute).should eq(institute)
#      response.should render_template("edit")
#    end
#  end

#  describe "Institute CREATE" do
#    describe "With Valid Params" do
#      it "Saves Institute and redirect to show" do
#        expect {
#          institute :create, { :institute => valid_attributes }, valid_session
#        }.to change(Institute, :count).by(1)
#        assigns(:institute).should be_a(Institute)
#        assigns(:institute).should_not be_a_new(Institute)
#        response.should redirect_to(Institute.last)
#      end
#    end
#    describe "Without Valid Params" do
#      it "Saves Institute and redirect to show" do
#        expect {
#          institute :create, { :institute => invalid_attributes }, valid_session
#        }.to change(Institute, :count).by(0)
#        assigns(:institute).should be_a(Institute)
#        assigns(:institute).should be_a_new(Institute)
#        response.should render_template("new")
#      end
#    end
#  end

#  describe "Put UPDATE" do
#    describe "With Valid Params" do
#      it "updates institute" do
#        institute = FactoryGirl.create(:institute)
#        put :update, { :id => institute.to_param, :institute => valid_attributes }, valid_session
#        assigns(:institute).should be_a(Institute)
#        institute.reload
#        institute.name.should == valid_attributes[:name]
#        institute.subject.should == valid_attributes[:subject]
#        response.should redirect_to(institute)
#      end
#    end
#    describe "With InValid Params" do
#      it "will not update institute" do
#        institute = FactoryGirl.create(:institute)
#        put :update, { :id => institute.to_param, :institute => invalid_attributes }, valid_session
#        assigns(:institute).should be_a(Institute)
#        institute.reload
#        institute.name.should_not == invalid_attributes[:name]
#        institute.subject.should_not == invalid_attributes[:subject]
#        response.should render_template("edit")
#      end
#    end
#  end

#  describe "Get DESTROY" do
#    it "Destroy the institute and redirect to index" do
#      institute = FactoryGirl.create(:institute)
#      expect {
#        get :destroy, { :id => institute.to_param }, valid_session
#      }.to change(Institute, :count).by(-1)
#      response.should redirect_to(institutes_path)
#    end
#  end

end
