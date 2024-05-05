# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :reviews

  validates_presence_of :username
  validates_uniqueness_of :username
end
