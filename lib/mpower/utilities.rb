module MPower
  module Utilities
    def http_request(baseurl,params={},debug=false)
      conn = Faraday.new(:url => baseurl, :ssl => {:verify => false}) do |faraday|
        faraday.request  :json
        faraday.response :logger if debug
        faraday.adapter  Faraday.default_adapter
      end

      result = conn.post do |req|
        req.headers.merge!(params[:headers]) unless params[:headers].blank?
        req.headers["User-Agent"] = "MPower Checkout API Ruby client v1 aka Don Nigalon"

        if MPower.mode == "live"
          req.headers['MP-Public-Key'] = MPower.live_public_key
          req.headers['MP-Private-Key'] = MPower.live_private_key
          req.headers['MP-Master-Key'] = MPower.live_master_key
          req.headers['MP-Mode'] = "live"
        else
          req.headers['MP-Public-Key'] = MPower.test_public_key
          req.headers['MP-Private-Key'] = MPower.test_private_key
          req.headers['MP-Master-Key'] = MPower.test_master_key
          req.headers['MP-Mode'] = "test"
        end
        req.body = hash_to_json params[:data]
      end
      { :status => result.status, :body => result.body }
    end

    def hash_to_json(params={})
      MultiJson.dump params
    end

    def json_to_hash(params={})
      MultiJson.load params
    end
  end
end