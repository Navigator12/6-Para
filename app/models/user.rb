# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :active_relationships, class_name: 'Relationship',
            foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  validates :username, uniqueness: true, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 1 }

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
