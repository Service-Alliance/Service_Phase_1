class Company < ActiveRecord::Base
  include PgSearch
  include Trackable

  has_many :notes, as: :noteable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
  belongs_to :address

  pg_search_scope :name_search,
  against: [:name],
  associated_against: {
    :address => [:address_1, :address_2, :city]
  },
  using: {
    tsearch: {dictionary: 'english', prefix: true}
  }

  def self.search_suggestions(param)
    results = name_search(param)
    return results.limit(10)
  end
end
