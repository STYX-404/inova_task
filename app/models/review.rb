# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_presence_of :body
end
