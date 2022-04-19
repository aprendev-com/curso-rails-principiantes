class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Tu producto se ha creado correctamente'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: 'Tu producto se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
end
