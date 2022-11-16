# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    _, headers, = @app.call(env)

    return [403, headers, []] if request.path.start_with?('/admin')

    @app.call(env)
    # END
  end
end
