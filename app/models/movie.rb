class Movie < ApplicationRecord
  include ApplicationHelper
  has_many :likes
  has_many :comments, as: :commentable
  has_many :watchlists
  validates :Title, presence: true
  validates :imdbID, uniqueness: true

  after_create :update_movie_info


  def update_movie_info
    get_movie_by_id(self.imdbID)
  end
end
