OriginalHandlebars.registerHelper 'footer', ->
  options = _.extend(@, PrettyEmail.options)
  if options.companyName
    Handlebars.templates.footer(options)

@PrettyEmail =
  options: {}
  style:
    fontFamily: 'Helvetica'
    fontColor: '#606060'
    buttonColor: '#FFFFFF'
    buttonBgColor: '#3071a9'

  send: (template, options) ->
    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: @render template, options
  render: (template, options) ->
    options.style = @style
    options = _.extend(@options, options)
    Handlebars.templates[template](options)

Accounts.emailTemplates.verifyEmail.subject = ->
  'Activate your account'
Accounts.emailTemplates.verifyEmail.html = (user, verifyEmailUrl) ->
  PrettyEmail.render 'call-to-action',
    subject: Accounts.emailTemplates.verifyEmail.subject(user)
    heading: 'Just one more step...'
    message: 'Click on the big button below to activate your account'
    buttonText: 'Activate account'
    buttonUrl: verifyEmailUrl

Accounts.emailTemplates.resetPassword.subject = ->
  'Reset your password'
Accounts.emailTemplates.resetPassword.html = (user, resetPasswordUrl) ->
  PrettyEmail.render 'call-to-action',
    subject: Accounts.emailTemplates.resetPassword.subject(user)
    heading: 'Reset your password'
    message: 'Click the big button below to reset your password'
    buttonText: 'Reset password'
    buttonUrl: resetPasswordUrl

Accounts.emailTemplates.enrollAccount.subject = ->
  'An account has been created for you'
Accounts.emailTemplates.enrollAccount.html = (user, enrollAccountUrl) ->
  PrettyEmail.render 'call-to-action',
    subject: Accounts.emailTemplates.enrollAccount.subject(user)
    heading: 'To start using service, simply click the button below'
    buttonText: 'Change password'
    buttonUrl: enrollAccountUrl

Meteor.startup ->
  if PrettyEmail.options.from
    Accounts.emailTemplates.from = PrettyEmail.options.from