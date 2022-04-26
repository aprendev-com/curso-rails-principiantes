require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    visit categories_url
    click_on "New category"

    fill_in "Name", with: @category.name
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "should update Category" do
    visit category_url(@category)
    click_on "Edit this category", match: :first

    fill_in "Name", with: @category.name
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    visit category_url(@category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
