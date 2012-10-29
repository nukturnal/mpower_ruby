module MPower
  module Utilities
    def http_json_request(baseurl,params={})
      conn = Faraday.new(:url => baseurl, :ssl => {:verify => false}) do |faraday|
        faraday.request  :json
        faraday.adapter  Faraday.default_adapter
      end

      result = conn.post do |req|
        req.headers.merge!(params[:headers]) unless params[:headers].blank?
        req.headers["User-Agent"] = "MPower Checkout API Ruby client v1 aka Don Nigalon"
        req.headers['MP-Public-Key'] = MPower::Setup.public_key
        req.headers['MP-Private-Key'] = MPower::Setup.private_key
        req.headers['MP-Master-Key'] = MPower::Setup.master_key
        req.headers['MP-Token'] = MPower::Setup.token
        req.headers['MP-Mode'] = MPower::Setup.mode
        req.body = hash_to_json params[:data]
      end
      json_to_hash(result.body)
    end

    def http_get_request(baseurl,params={})
      conn = Faraday.new(:url => baseurl, :ssl => {:verify => false})

      result = conn.get do |req|
        req.headers.merge!(params[:headers]) unless params[:headers].blank?
        req.headers["User-Agent"] = "MPower Checkout API Ruby client v1 aka Don Nigalon"
        req.headers['MP-Public-Key'] = MPower::Setup.public_key
        req.headers['MP-Private-Key'] = MPower::Setup.private_key
        req.headers['MP-Master-Key'] = MPower::Setup.master_key
        req.headers['MP-Token'] = MPower::Setup.token
        req.headers['MP-Mode'] = MPower::Setup.mode
      end
      
      json_to_hash(result.body)
    end

    def hash_to_json(params={})
      MultiJson.dump params
    end

    def json_to_hash(params={})
      MultiJson.load params
    end
  end
end