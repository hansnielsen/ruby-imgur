class Imgur::Client::AccountStats < Imgur::Model
  identity :id

  attribute :total_images,          type: :integer
  attribute :total_albums,          type: :integer
  attribute :disk_used,             type: :string
  attribute :bandwidth_used,        type: :string
  attribute :top_images
  attribute :top_albums
  attribute :top_gallery_comments

  def initialize(data, top_images, top_albums, top_gallery_comments)
    super(data)
    self.top_images = top_images
    self.top_albums = top_albums
    self.top_gallery_comments = top_gallery_comments
  end
end
