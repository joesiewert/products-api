class ProductsController < ApplicationController

  def index
    render json: {product: Product.all.map{|product| product_json(product)}}
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

end
