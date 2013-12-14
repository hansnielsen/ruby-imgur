class Imgur::Client::Account < Imgur::Model
  identity :id

  attribute :url
  attribute :bio
  attribute :reputation, type: :float
  attribute :created,    type: :integer

  def images
    data = []
    image_array = []
    page = 0
    until data.count > 0 && data.count != 50
      path = "/account/#{url}/images/#{page}"
      data = connection.get_images(path: path).body["data"]
      data.each { |i| image_array << i }
      page += 1
    end
    connection.images.load(image_array)
  end

  def albums
    path = "/account/#{url}/albums"
    data = connection.get_albums(path: path).body["data"]
    connection.albums.load(data)
  end

  def notifications
    data = connection.get_notifications.body('data')
    connection.notifications.load(data)
  end

  def stats
    path = "/account/#{url}/stats"
    data = connection.get_account_stats(path: path).body["data"]

    top_images = connection.images.load(data["top_images"])
    top_albums = connection.albums.load(data["top_albums"])
    top_gallery_comments = connection.comments.load(data["top_gallery_comments"])

    Imgur::Client::AccountStats.new(data, top_images, top_albums, top_gallery_comments)
  end

  def settings
    path = "/account/#{url}/settings"
    data = connection.get_account_settings(path: path).body["data"]
    Imgur::Client::AccountSettings.new(data)
  end
end
