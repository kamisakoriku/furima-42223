class Item < ApplicationRecord
  def sold_out?
    order.present?
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :shipping_fee_id,
            :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: 'must be other than 1' }
end
