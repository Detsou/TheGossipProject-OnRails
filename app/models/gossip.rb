class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips
  has_many :comments

  def self.find(id)
    all_gossips = self.all
    all_gossips[id.to_i - 1]
  end
end
