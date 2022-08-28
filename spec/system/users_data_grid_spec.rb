require "system_helper"

RSpec.describe "Users data grid" do
  include ActionView::RecordIdentifier

  it "displays the products" do
    product1 = create :product
    product2 = create :product

    visit products_path

    expect(page).to display_product(product1)
    expect(page).to display_product(product2)
  end

  it "sorts the products by column" do
    product1 = create :product, name: "A"
    product2 = create :product, name: "B"

    visit products_path

    expect(ordered_rows_ids).to eq([dom_id(product1), dom_id(product2)])

    click_on "Name"

    expect(ordered_rows_ids).to eq([dom_id(product2), dom_id(product1)])
  end

  def display_product(product)
    have_css "#product_#{product.id}"
  end

  def ordered_rows_ids
    page.all("tbody tr").map { |row| row[:id] }
  end
end