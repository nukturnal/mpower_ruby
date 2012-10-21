module MPower
  module Utilities
    def http_request(baseurl,params={},debug=false)
      conn = Faraday.new(:url => BASE_URL, :ssl => {:verify => false}) do |faraday|
        faraday.request  :json
        faraday.response :logger if debug
        faraday.adapter  Faraday.default_adapter
      end

      result = conn.post do |req|
        req.headers.merge!(params[:headers]) unless params[:headers].blank?
        req.headers["User-Agent"] = "MPower Checkout API Ruby client v1 aka Don Nigalon"
        req.body = MultiJson.dump params[:data]
      end
      { :status => response.status, :body => response.body }
    end
  end
end