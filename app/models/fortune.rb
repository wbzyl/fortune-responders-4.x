# -*- coding: utf-8 -*-

class Fortune < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  validates :quotation, presence: true
  validates :quotation, length: { maximum: 256 }
  validates :quotation, uniqueness: { case_sensitive: false }

  validates :source, length: { in: 3..64 }, allow_blank: true

  def self.text_search(query)
    if query.present?
      # SQLite
      where('quotation like ?', "%#{query}%")
      # PostgreSQL; i – ignore case
      # where("quotation ilike :q or source ilike :q", q: "%#{query}%")
    else
      all
    end
  end

end
