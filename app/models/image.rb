class Image < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, :styles =>{:medium => "300x300>", :thumb => "100x100"}
  validates_attachment_content_type :photo,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'

end
