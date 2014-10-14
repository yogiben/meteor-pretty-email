OriginalHandlebars.registerHelper 'footer', ->
  options = _.extend(@, PrettyEmail.options)
  Handlebars.templates.footer(options)

@PrettyEmail =
  options: {}
  defaults:
    'activation':
      title: 'Activate your account'
      heading: 'Just one more step...'
      message: 'Click the big button below to activate your account'
      buttonText: 'Activate account'

  send: (template, options) ->
    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: @render template, options
  render: (template, options) ->
    options = _.extend(options, @options, @defaults[template])
    Handlebars.templates[template](options)
