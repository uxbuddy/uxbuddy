IMGKit.configure do |config|
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltox').to_s if ENV['RACK_ENV'] == 'production'
end
