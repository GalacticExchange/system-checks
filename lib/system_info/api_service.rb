module SystemInfo
  class ApiService

    def self.api_do_request(url, method, data, headers={})
      #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?blocks=stackoverflow')
      #puts response.body, response.code, response.message, response.headers.inspect

      headers['Content-Type'] = "application/json"
      headers['Accept'] = "application/json"

      # do http request
      response = nil
      begin
        timeout(10) do
          request_params = {:query=>data, :headers => headers,  timeout: 10}

          if method==:post
            response = HTTParty.post(url, request_params)
          elsif method==:get
            response = HTTParty.get(url, request_params)
          elsif method==:put
            response = HTTParty.put(url, request_params)
          elsif method==:delete
            response = HTTParty.delete(url, request_params)
          end
        end

      rescue Timeout::Error
        return nil
      rescue HTTParty::Error => e
        return nil
      rescue => e
        return nil
      end

      return nil if response.nil?
      #
      resp_data = JSON.parse(response.body)

      #
      unless [200,201].include? response.code
        return nil
      end


      # OK.
      return resp_data

    rescue => error
      return nil
    end
  end
end
