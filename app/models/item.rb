class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :broker, class_name: "User", foreign_key: "broker_id"

  has_many :purchased_items
  has_many :buyers, class_name: "User", through: :purchased_items
end
