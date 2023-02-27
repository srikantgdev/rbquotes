require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = Quote.ordered.first
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "should create quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    
    click_on "New quote"
    fill_in "Name", with: "Capybara quote"
    
    assert_selector "h1", text: "Quotes"
    click_on "Create Quote"
    
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
    click_on "Back"
  end

  test "should update Quote" do
    # visit quote_url(@quote)
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    
    click_on "Edit this quote", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "should destroy Quote" do
    # visit quote_url(@quote)
    visit quote_path
    assert_text @quote.name

    click_on "Destroy this quote", match: :first
    assert_no_text @quote.name

    assert_text "Quote was successfully destroyed"
  end
end
