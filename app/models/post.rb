# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates_presence_of :body
end
