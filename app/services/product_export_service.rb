# frozen_string_literal: true

class ProductExportService
  def export
    File.open('products.json', 'w') do |f|
      Product.find_each do |product|
        json_product = product_obj(product).to_json
        f.puts(json_product)
      end
    end
  end

  private

  def product_obj(product)
    {
      id: product.id.to_s,
      categories: product.category.name,
      title: product.name,
      priceInfo: {
        currencyCode: 'GBP',
        price: product.price
      }
    }
  end
end
