# frozen_string_literal: true

# Users Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  has_many :debit_accounts, dependent: :nullify
  has_many :checking_accounts, dependent: :nullify
  has_many :credit_accounts, dependent: :nullify
end
