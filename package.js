Package.describe({
  summary: " \* Fill me in! *\ ",
  version: "1.0.0",
  git: " \* Fill me in! *\ "
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.3.1');

  api.use('coffeescript');
  api.use('email');
  api.use('underscore');
  api.use('cmather:handlebars-server');
  
  api.addFiles(
    [
      'lib/server/pretty-emails.coffee',
      'lib/templates/shared/footer.handlebars',
      'lib/templates/call-to-action.handlebars',
      'lib/templates/activation.handlebars'
    ], 
    'server');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('yogiben:pretty-emails');
});
