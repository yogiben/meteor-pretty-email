Send pretty emails
==================

Pretty email templates for meteor.

`meteor add yogiben:pretty-emails`

### Usage ###

1) Install the package

2) Set up global options

e.g.

```
PrettyEmail.options =
  logoUrl: 'http://mycompany.com/logo.png'
  companyName: 'myCompany'
  companyUrl: 'http://mycompany.com'
  companyAddress: '123 Street, ZipCode, City, Country'
  companyTelephone: '+1234567890'
  companyEmail: 'support@mycompany.com'
  siteName: 'mycompany'
```

3) Send your email

```
PrettyEmail.send 'activation',
  from: 'support@mycompany.com'
  to: 'myuser@myuser.com'
  userName: 'Michal'
```

### Templates ###

#### Call to action ####

```
PrettyEmail.send 'call-to-action', options
```

**Options**

``from`` - required

``to`` - required

``subject`` - required

``heading`` - required. Primary heading

``headingSmall`` - optional. Secondary heading

``message`` - required. Message to the user (e.g. 'Your bill has been paid')

``buttonText`` - required. e.g. 'See your bill'

``buttonUrl`` - required. e.g. 'http://mycompany.com/bills/12341234'

#### Activation ####

```
PrettyEmail.send 'activation', options
```

**Options**

``from`` - required

``to`` - required

``subject`` - optional. Defaulted to 'Activate your account'

``heading`` - optional. Primary heading. Defaulted to 'Just one more step...'

``message`` - optional. Message to the user. Defaulted to 'Click the big button below to activate your account'

``buttonText`` - optional. Defaulted to 'Activate account'

### Custom style ###

You can change the style of your emails by manipulating ``PrettyEmail.style`` object. See default values below:

```
PrettyEmail.style =
  fontFamily: 'Helvetica'
  textColor: '#606060'
  buttonColor: '#FFFFFF'
  buttonBgColor: '#007FFF'
```