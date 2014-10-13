@PrettyEmail =
  send: (template, options) ->
    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: Handlebars.templates[template](options)
