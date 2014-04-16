require 'spec_helper'

describe Listing do
  it { should belong_to :user }
  it { should validate_presence_of :user_id }

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpeg').
                rejecting('text/plain', 'text/xml') }
end
