class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, presence: true
    validates :city, presence: true
    validates :addresses, presence: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }, presence: true
    validates :token, presence: true
    validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, price: Item.find(item_id).price)
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
    true
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error "保存エラー: #{e.message}"
    false
  end
end
