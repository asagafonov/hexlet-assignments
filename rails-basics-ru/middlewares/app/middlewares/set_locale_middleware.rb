# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)

    I18n.locale = extract_locale_from_accept_language_header(@headers)

    [@status, @headers, @response]
  end

  private

  def extract_locale_from_accept_language_header(headers)
    lng_header = headers['HTTP_ACCEPT_LANGUAGE']
    locale = lng_header.scan(/^[a-z]{2}/).first if lng_header
    if locale && I18n.available_locales.include?(locale)
      locale
    else
      I18n.default_locale
    end
  end
  # END
end
