class Taggable < ActiveRecord::Base
  attr_accessible :tag_id, :transaction_id

  belongs_to :tag
  belongs_to :transaction

  validates :tag_id, :transaction_id, :presence => true
end
