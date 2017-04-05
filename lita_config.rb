Lita.configure do |config|
  # Require any of our own extensions that are not in gem format
  Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**.rb')).each { |file| require file }

  # The name your robot will use.
  config.robot.name = 'lita'
  config.robot.alias = 'bot'

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = ENV['LITA_LOG_LEVEL'] || :info

  # Redis Brain
  config.redis = { host: 'localhost', port: 6379 }

  # Adapter setup
  config.robot.adapter        = ENV['LITA_ADAPTER'] || :slack
  config.adapters.slack.token = ENV['LITA_SLACK_TOKEN'] || ''
  #config.robot.admins         = ENV['LITA_ROBOT_ADMINS'].split(',')
end
