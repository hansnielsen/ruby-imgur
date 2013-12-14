class Imgur::Client
  class Real
    def update_account_settings(params={})
      params = params.dup.select do |k,v|
        [:bio, :public_images, :messaging_enabled,
         :album_privacy, :accepted_gallery_terms].include? k
      end
      path = "/account/me/settings"
      request(
        :method => :post,
        :path   => path,
        :body   => params,
      )
    end
  end
end
