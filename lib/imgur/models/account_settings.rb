class Imgur::Client::AccountSettings < Imgur::Model
  identity :id

  attribute :email,                   type: :string
  attribute :high_quality,            type: :boolean
  attribute :public_images,           type: :boolean
  attribute :album_privacy,           type: :string
  attribute :pro_expiration,          type: :integer
  attribute :accepted_gallery_terms,  type: :boolean
  attribute :active_emails,           type: :array
  attribute :message_enabled,         type: :boolean
  attribute :blocked_users
end
