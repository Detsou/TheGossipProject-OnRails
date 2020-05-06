class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validates :user,
    presence: { message: "Nous n'avons pas pu trouvé l'utilisateur associé." }

  validates :gossip,
    presence: { message: "Nous n'avons pas pu trouvé le Gossip associé." }

  validates :content,
    presence: { message: "Contenu obligatoire." }
end
