class Contact < ApplicationRecord
  belongs_to :group

  paginates_per 5

  validates :name, :email, :group_id, presence: true
  validates :name, length: {minimum: 2}

  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def gravatar
      # create the md5 hash
    hash = Digest::MD5.hexdigest(email.downcase)

    # compile URL which can be used in <img src="RIGHT_HERE"...
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
