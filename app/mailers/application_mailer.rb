class ApplicationMailer < ActionMailer::Base
  # default to: ENV['GMAIL_USERNAME']
  layout 'mailer'

  DEFAULT_RECIPIENTS = 'bradley.s.berger@gmail.com' # change this to include me, Jason, and Mike
end
