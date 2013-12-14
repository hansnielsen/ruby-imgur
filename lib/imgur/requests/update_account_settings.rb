class Imgur::Client
  class Real
    def update_account_settings(params={})
      path = "/account/me/settings"
      request(
        :method => :post,
        :path   => path,
        :body   => params,
      )
    end
  end
end
