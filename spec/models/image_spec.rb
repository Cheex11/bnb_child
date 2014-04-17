require 'spec_helper'

describe Image do
  it { should belong_to :listing }

  it { should have_attached_file(:photo) }
  it { should validate_attachment_content_type(:photo).
                allowing('image/png', 'image/gif', 'image/jpeg').
                rejecting('text/plain', 'text/xml') }
end
