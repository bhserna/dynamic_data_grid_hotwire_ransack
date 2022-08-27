require "system_helper"

RSpec.describe "Users data grid" do
  it "displays the products" do
    product1 = create :product
    product2 = create :product

    visit products_path

    expect(page).to display_product(product1)
    expect(page).to display_product(product2)
  end

  def display_product(product)
    have_css "#product_#{product.id}"
  end
end