class Imgur::Client
  class Real
    def get_account_stats(params={})
      path = params[:path]
      request(
        :method => :get,
        :path   => path,
      )
    end
  end
end
