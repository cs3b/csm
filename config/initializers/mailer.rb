# Mailer configuration

#TODO in production mode we should propably use sendmail to deliver mails

# load config from mailer.yml file
mailer_config = YAML.load(File.open("#{RAILS_ROOT}/config/mailer.yml"))[RAILS_ENV.to_sym]
# require tls for cooperate with gmail
require 'smtp_tls'
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = 'utf-8'
ActionMailer::Base.smtp_settings = mailer_config