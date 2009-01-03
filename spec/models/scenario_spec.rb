require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Scenario do
  
  it "should be defined non empty Array of root types" do
    Scenario::ROOT_TYPES.class.should == Array
    Scenario::ROOT_TYPES.should_not be_empty
  end
  
  it "should be defined non empty Array of children types" do
    Scenario::CHILD_TYPES.class.should == Array
    Scenario::CHILD_TYPES.should_not be_empty
  end

  context "adding new" do
    before(:all) do
      # fake data to ensure test more
      # how to do it better to have no mistake of first record, meybe blueprints ?
      @scenario_fake_0 = Scenario.create(:content => 'Manage Features fake 0', :type_id => Scenario::SCENARIO)
      @scenario = Scenario.create(:content => 'Manage Features', :type_id => Scenario::SCENARIO)
    end
    context "type Scenario" do
      it "should be parent set to nil" do
        @scenario.parent_id.should be_nil
      end
      it "should be content set properly" do
        @scenario.content.should == 'Manage Features'
      end
      it "should be type set properly (Scenario)" do
        @scenario.type_id.should == Scenario::SCENARIO
      end
      it "should position been set" do
        @scenario.position.should_not be_nil
      end
      it "should return content on title" do
        @scenario.title.should == 'Manage Features'
      end
      it "should return empty array on given" do
        @scenario.given.should be_empty
      end
      it "should return empty array on when" do
        @scenario.when.should be_empty
      end
      it "should return empty array on then" do
        @scenario.then.should be_empty
      end
    end
    context "type Given" do
      before(:all) do
        @given_fake0 = Scenario.create(:content => 'I am on new scenario page fake 0', :type_id => Scenario::GIVEN, :parent_id => @scenario_fake_0.id)
        @given_fake1 = Scenario.create(:content => 'I am on new scenario page fake 1', :type_id => Scenario::GIVEN, :parent_id => @scenario_fake_0.id)
        @given = Scenario.create(:content => 'I am on new scenario page', :type_id => Scenario::GIVEN, :parent_id => @scenario.id)
        @given2 = Scenario.create(:content => 'I am on show page', :type_id => Scenario::GIVEN, :parent_id => @scenario.id)
      end
      it "should have parent assigned" do
        @given.parent.should == @scenario
      end
      it "should be type set properly (Given)" do
        @given.type_id.should == Scenario::GIVEN
      end
      it "should position been set" do
        @given.position.should_not be_nil
      end
      it "should return content on title" do
        @given.title.should == 'Manage Features'
      end
      it "should return all this type object, connected with parent on given" do
        @given.given.should == [@given, @given2]
      end
      it "scenario should have two GIVEN items" do
        @scenario.given.should have(2).items
      end
    end
    context "type When" do
      before(:all) do
        @when_fake0 = Scenario.create(:content => 'I file aaa in bbb fake 0', :type_id => Scenario::WHEN, :parent_id => @scenario_fake_0.id)
        @when_fake1 = Scenario.create(:content => 'I file aaa in bbb fake 1', :type_id => Scenario::WHEN, :parent_id => @scenario_fake_0.id)
        @when = Scenario.create(:content => 'I fill content with \'I fill title with aaaa\'', :type_id => Scenario::WHEN, :parent_id => @scenario.id)
        @when2 = Scenario.create(:content => 'I fill type with \'I fill title with bbbb\'', :type_id => Scenario::WHEN, :parent_id => @scenario.id)
      end
      it "should have parent assigned" do
        @when.parent.should == @scenario
      end
      it "should be type set properly (Given)" do
        @when.type_id.should == Scenario::WHEN
      end
      it "should position been set" do
        @when.position.should_not be_nil
      end
      it "should return content on title" do
        @when.title.should == 'Manage Features'
      end
      it "should return all this type object, connected with parent on when" do
        @when.when.should == [@when, @when2]
      end
      it "scenario should have two WHEN items" do
        @scenario.when.should have(2).items
      end
    end
    context "type Then" do
      before(:all) do
        @then_fake0 = Scenario.create(:content => 'I see fake 0', :type_id => Scenario::THEN, :parent_id => @scenario_fake_0.id)
        @then_fake1 = Scenario.create(:content => 'I see fake 1', :type_id => Scenario::THEN, :parent_id => @scenario_fake_0.id)
        @then = Scenario.create(:content => 'I see aaa', :type_id => Scenario::THEN, :parent_id => @scenario.id)
        @then2 = Scenario.create(:content => 'I see bbb', :type_id => Scenario::THEN, :parent_id => @scenario.id)
      end
      it "should have parent assigned" do
        @then.parent.should == @scenario
      end
      it "should be type set properly (Then)" do
        @then.type_id.should == Scenario::THEN
      end
      it "should position been set" do
        @then.position.should_not be_nil
      end
      it "should return content on title" do
        @then.title.should == 'Manage Features'
      end
      it "should return all this type object, connected with parent on then" do
        @then.then.should == [@then, @then2]
      end
      it "scenario should have two WHEN items" do
        @scenario.then.should have(2).items
      end
    end
  end

end
