class Listing < ActiveRecord::Base
  has_attached_file :image, :styles =>{:medium => "300x300>"}
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'

  belongs_to :user
  validates :user_id, presence: true
end
