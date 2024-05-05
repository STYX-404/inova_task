# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :username
  validates_uniqueness_of :username
end
