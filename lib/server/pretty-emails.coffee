OriginalHandlebars.registerHelper 'footer', ->
  options = _.extend(@, PrettyEmail.options)
  if options.companyName
    Handlebars.templates.footer(options)

OriginalHandlebars.registerHelper 'eachLine', (options) ->
  _.reduce @message?.split('\n'), (result, content) ->
    result + options.fn(content)
  , ''

PrettyEmail =
  options: {}
  defaults:
    verifyEmail:
      heading: 'Just one more step...'
      message: 'Click on the big button below to activate your account'
      buttonText: 'Activate account'
    resetPassword:
      heading: 'Reset your password'
      message: 'Click the big button below to reset your password'
      buttonText: 'Reset password'
    enrollAccount:
      heading: 'To start using service, simply click the button below'
      buttonText: 'Change password'

  style:
    fontFamily: 'Helvetica'
    fontColor: '#606060'
    buttonColor: '#FFFFFF'
    buttonBgColor: '#3071a9'

  send: (template, options) ->
    options = _.extend {}, @options, options

    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: @render template, options
  render: (template, options) ->
    options.style = @style
    options = _.extend {}, @options, options

    if typeof template == 'string'
      template = Handlebars.templates[template]

    if typeof template == 'function'
      template(options)
    else
      throw new Error "PrettyEmail can't render template. Pass template name or handlebars function."

Accounts = Package['accounts-base']?.Accounts

Accounts?.emailTemplates?.verifyEmail.subject = ->
  'Activate your account'
Accounts?.emailTemplates?.verifyEmail.html = (user, verifyEmailUrl) ->
  options = _.extend {}, PrettyEmail.defaults.verifyEmail,
    subject: Accounts.emailTemplates.verifyEmail.subject(user)
    buttonUrl: verifyEmailUrl
  PrettyEmail.render 'call-to-action', options

Accounts?.emailTemplates?.resetPassword.subject = ->
  'Reset your password'
Accounts?.emailTemplates?.resetPassword.html = (user, resetPasswordUrl) ->
  options = _.extend {}, PrettyEmail.defaults.resetPassword,
    subject: Accounts.emailTemplates.resetPassword.subject(user)
    buttonUrl: resetPasswordUrl
  PrettyEmail.render 'call-to-action', options

Accounts?.emailTemplates?.enrollAccount.subject = ->
  'An account has been created for you'
Accounts?.emailTemplates?.enrollAccount.html = (user, enrollAccountUrl) ->
  options = _.extend {}, PrettyEmail.defaults.enrollAccount,
    subject: Accounts.emailTemplates.enrollAccount.subject(user)
    buttonUrl: enrollAccountUrl
  PrettyEmail.render 'call-to-action', options

Meteor.startup ->
  if PrettyEmail.options.from
    Accounts.emailTemplates.from = PrettyEmail.options.from
