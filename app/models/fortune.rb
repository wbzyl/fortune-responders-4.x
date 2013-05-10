class Fortune < ActiveRecord::Base
  validates :quotation, presence: true
  validates :quotation, length: { maximum: 256 }
  validates :quotation, uniqueness: { case_sensitive: false }

  validates :source, length: { in: 3..64 }, allow_blank: true
end
