class Imgur::Client
  class Real
    def get_account_settings(params={})
      path = "/account/#{params[:url]}/settings"
      request(
        :method => :get,
        :path   => path,
      )
    end
  end
end
