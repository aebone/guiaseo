require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :name => "MyString",
      :text => "MyText",
      :category => nil
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contents_path(@content), :method => "post" do
      assert_select "input#content_name", :name => "content[name]"
      assert_select "textarea#content_text", :name => "content[text]"
      assert_select "input#content_category", :name => "content[category]"
    end
  end
end
