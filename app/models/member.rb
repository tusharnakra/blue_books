# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  pennkey       :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  email_address :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  school_id     :integer
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email_address, :first_name, :last_name, :pennkey, :school_id, :group_id, 
  :email, :password, :password_confirmation, :sign_in_count, :current_sign_in_at, :last_sign_in_at, 
  :remember_me, :current_sign_in_ip, :last_sign_in_ip 

  belongs_to :school
  belongs_to :group

  validates_uniqueness_of :email_address, message: 'already exists' 
  validates_uniqueness_of :pennkey, message: 'already exists'
  validates :email_address, :email => true, presence: {message: ' cannot be empty'}
  validates :first_name, presence: {message: ' cannot be empty'}
  validates :last_name, presence: {message: ' cannot be empty'}
  validates :pennkey, presence: {message: ' cannot be empty'}
end
