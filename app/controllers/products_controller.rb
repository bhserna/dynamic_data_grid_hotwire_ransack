class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    set_default_sort
    scope = @q.result(distinct: true)

    @pagy, @products = pagy(scope, items: 10)
  end

  private

  def set_default_sort
    @q.sorts = "name asc" if @q.sorts.empty?
  end
end
