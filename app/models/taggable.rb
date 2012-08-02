class Taggable < ActiveRecord::Base
  attr_accessible :tag_id, :purchase_id

  belongs_to :tag
  belongs_to :purchase

  validates :tag_id, :purchase_id, :presence => true
end
