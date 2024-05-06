# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_presence_of :comment
  validates_numericality_of :rate, in: (0..5), allow_nil: true
end
