class Imgur::Client::Accounts < Cistern::Collection
  include Imgur::PagedCollection
  include Imgur::Collection

  model Imgur::Client::Account

  model_root "data"
  model_request :get_account

  collection_root "data"
  collection_request :get_accounts

  def by_url(url)
    options = {:path => "/account/#{url}"}
    all(options).first
  end

  def all(options={})
    path = options[:path] || "/account/me"

    data = connection.get_accounts(path: path).body["data"]
    connection.accounts.load([data])
  end
end
