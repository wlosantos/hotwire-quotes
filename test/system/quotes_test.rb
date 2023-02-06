require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test 'Creating a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'New Quote'
    fill_in 'Name', with: 'Capybara quote'

    assert_selector 'h1', text: 'Quote'
    click_on 'submit'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'
  end

  test 'Showing a quote' do
    visit quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test 'Updating a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'Edit', match: :first
    fill_in 'Name', with: 'Updated quote'

    assert_selector 'h1', text: 'Quote'
    click_on 'submit'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated quote'
  end

  test 'Destroying a quote' do
    visit quotes_path
    assert_text @quote.name

    click_on 'Delete', match: :first
    assert_text @quote.name
  end
end
