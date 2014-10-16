OriginalHandlebars.registerHelper 'footer', ->
  options = _.extend(@, PrettyEmail.options)
  Handlebars.templates.footer(options)

@PrettyEmail =
  options: {}
  style:
    fontFamily: 'Helvetica'
    textColor: '#606060'
    buttonColor: '#FFFFFF'
    buttonBgColor: '#007FFF'

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
