require "rack/delete_cookies_from_public_requests/version"

module Rack
  class DeleteCookiesFromPublicRequests
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      if headers && /public/.match(headers["Cache-Control"])
        headers.delete("Set-Cookie")
      end
      [status, headers, body]
    end
  end
end
