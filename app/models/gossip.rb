class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips
  has_many :comments

  validates :title,
    presence: true,
    length: { minimum: 4, maximum: 14, message: "= Le titre ne peut pas faire moins de 3 caractères ni plus de 14 caractères."}
  validates :content,
    presence: true
end
