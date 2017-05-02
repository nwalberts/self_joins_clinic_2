class User < ActiveRecord::Base
  has_many :employees, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User"


  has_many :items_for_sale, class_name: "Item", foreign_key: "seller_id"
  has_many :items_as_broker, class_name: "Item", foreign_key: "broker_id"

  has_many :purchased_items, foreign_key: "buyer_id"
  has_many :items, through: :purchased_items

end









# ======
# has_many :managers, through: :superiors, source: :relationships
# has_many :superiors, foreign_key: "superior_id", class_name: "Relationship"
#
# has_many :employees, through: :subordinates, source: :relationships
# has_many :subordinates, foreign_key: "subordinate_id", class_name: "Relationship"
# =======
