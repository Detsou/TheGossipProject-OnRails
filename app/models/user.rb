class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :comments

  has_secure_password

  validates :first_name,
    presence: { message: "Prénom obligatoire." }

  validates :last_name,
    presence: { message: "Nom obligatoire." }

  validates :age,
    presence: { message: "Age obligatoire." }

  validates :password,
    presence: { message: "Mot de passe obligatoire." },
    length: { minimum: 6, too_short: "Mot de passe trop court." }

  validates :email,
    presence: { message: "Email obligatoire." },
    uniqueness: { message: "Email déjà pris." },
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Format d'email invalide." }

  def full_name
    "#{first_name} #{last_name}"
  end
end
