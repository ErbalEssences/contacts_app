class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\A\w+[@]\w{3,}[.]\w{2,}\z/, message: "must be a valid email format"}

  belongs_to :user

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end
  def full_name
    full_name = "#{first_name} #{middle_name} #{last_name}"
  end

  def japan_number
    japan_phone_number = "+81 #{phone_number}"
  end
end
