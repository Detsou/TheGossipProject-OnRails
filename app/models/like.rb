class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validates :user_id,
    :uniqueness => { :scope => :gossip_id, message: "Un like par gossip" }
end
