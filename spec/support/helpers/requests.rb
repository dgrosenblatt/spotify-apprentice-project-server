module Helpers
  module Requests
    def json
      @json ||= parse_json(response.body)
    end

    def errors
      json['errors'].to_s if json['errors']
    end

    def api_version
      1
    end

    def accept_header
      "application/vnd.spotify-apprentice-app.com+json; version=#{api_version}"
    end

    def accept_headers
      { 'Accept' => accept_header,
        'Content-Type' => 'application/json' }
    end
  end
end
