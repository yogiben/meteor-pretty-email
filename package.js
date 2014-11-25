Package.describe({
  summary: "Send pretty emails",
  version: "0.0.3",
  git: "https://github.com/yogiben/meteor-pretty-email"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1.0');

  api.use('coffeescript');
  api.use('email');
  api.use('underscore');
  api.use('accounts-password');
  api.use('cmather:handlebars-server@0.2.0');
  
  api.addFiles(
    [
      'lib/server/pretty-emails.coffee',
      'lib/templates/shared/footer.handlebars',
      'lib/templates/call-to-action.handlebars',
    ], 
    'server');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('yogiben:pretty-emails');
});
