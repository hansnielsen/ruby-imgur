class Imgur::Client
  class Real
    def get_account_stats(params={})
      path = "/account/#{params[:url]}/stats"
      request(
        :method => :get,
        :path   => path,
      )
    end
  end
end
