require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # VERIFY
    visit "/"

    # ASSERT
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "adding a product" do
    # SETUP
    products_count = Product.count
    # Accessing fixtures by their keys:
    user = users(:jujuba)
    login_as user

    # VERIFY
    visit "/products/new"

    fill_in "Name", with: "Hello Watch"
    fill_in "Tagline", with: "Useful to tell the time."
    click_on "Create Product"

    # ASSERT
    # I have a new product
    last_product = Product.last
    assert_equal "Hello Watch", last_product.name
    assert_equal products_count + 1, Product.count
    assert_text "Useful to tell the time."
  end
end
