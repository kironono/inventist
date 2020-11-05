module ProductsHelper

  def product_status_color(product, status)
    defines = {
      in_stock: 'is-link',
      few_in_stock: 'is-warning',
      out_of_stock: 'is-danger'
    }
    return defines[status.intern] if status.intern == product.status.intern
    return 'is-light'
  end
end
