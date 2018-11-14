class Item < ApplicationRecord
  # attr_accessible  :title, :name, :real, :weight, :description

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  belongs_to :category

  after_initialize { }
  after_save { }
  after_create { category.inc(:items_count, 1) }
  after_update { }
  after_destroy { category.inc(:items_count, -1) }

end
