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
  defaults:
    'activation':
      title: 'Activate your account'
      heading: 'Just one more step...'
      message: 'Click the big button below to activate your account'
      buttonText: 'Activate account'
    'call-to-action': {}

  send: (template, options) ->
    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: @render template, options
  render: (template, options) ->
    options.style = @style
    options = _.extend(@defaults[template], @options, options)
    Handlebars.templates[template](options)
