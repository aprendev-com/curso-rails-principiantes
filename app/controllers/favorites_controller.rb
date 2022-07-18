class FavoritesController < ApplicationController
  def create
    product.favorite!
    redirect_to product_path(product)
  end

  def destroy
    product.unfavorite!
    redirect_to product_path(product), status: :see_other
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
