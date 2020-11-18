class Product < ApplicationRecord

  enum status: {in_stock: 'in_stock', few_in_stock: 'few_in_stock', out_of_stock: 'out_of_stock'}

  validates :name, length: { maximum: 64 }
  validates :status, inclusion: { in: statuses.keys }

end
