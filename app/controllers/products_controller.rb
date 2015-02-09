class ProductsController < ApplicationController

  def index
    render json: {product: Product.all.map{|product| product_json(product)}}
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: {product: product_json(product)}
    else
      render json: {errors: product.errors}, status: 422
    end
  end

  def show
    product = Product.find(params[:id])
    render json: {product: product_json(product)}
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: {product: product_json(product)}
    else
      render json: {errors: product.errors}, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    unless product.destroy
      render json: {errors: product.errors}, status: 422
    end
  end

private

  def product_json(product)
    {
      id: product.id,
      name: product.name,
      description: product.description,
      price_in_cents: product.price_in_cents
    }
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
