class User < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 12 }, format: {
    with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{12,}\z/,
    message: "muss mindestens 12 Zeichen lang sein und Buchstaben, Zahlen und Sonderzeichen enthalten"
  }, if: :password_required?

  validates :password_confirmation, presence: true, if: :password_required?

  def admin?
    role == "admin"
  end

  has_paper_trail
end
