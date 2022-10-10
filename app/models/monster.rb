class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  validate :phone_number_must_be_valid_and_from_argentina

  def phone_number_must_be_valid_and_from_argentina
    if PhoneValidator.new(phone).valid?
      return
    else
      errors.add(:phone, :invalid)
    end
  end
end
