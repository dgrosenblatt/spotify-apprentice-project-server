module Helpers
  module Requests
    def json
      @json ||= JSON.parse(response.body)
    end

    def errors
      json['errors'].to_s if json['errors']
    end

    def api_version
      1
    end

    def accept_header
      "application/vnd.spotify-apprentice-app.com; version=#{api_version}"
    end

    def accept_headers
      { 'Accept' => accept_header,
        'Content-Type' => 'application/json' }
    end

    def paginated_total
      response.headers['Total'].to_i
    end

    def paginated_per_page
      response.headers['Per-Page'].to_i
    end
  end
end
