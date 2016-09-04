# Pairest

[![Build Status](https://travis-ci.com/glaukommatos/pairest.svg?token=R14gHPyWbqM9UH7Yoozf&branch=master)](https://travis-ci.com/glaukommatos/pairest)

## Installation
To install Pairest, do a ```gem build pairest.gemspec``` then do a ```gem install``` on the file that is created.

The main executable is 'pairest' and usage is like this:
```
    $ pairest hp bl
```

## Setup
Please create a ```~/.pairest.yml``` with the following format (if you don't one will be created for you):
```
jd:
  name: John Doe
  email: jd@anonymous.com
  key_name: john.doe
eu:
  name: Example User
  email: example.user@someplace.com
  key_name: example.user

```

Pairest will manage keys under ```~/.ssh/```, so the key name refers to the name of a key file in the ```~/.ssh/``` directory. If you don't know how to create an SSH key, google the documentation for ```ssh-keygen``` or read its ```man``` page.

# Caveats
Keep in mind that the Git commands it runs are not with the ```--global``` flag. This was on purpose, but if it's useful to configure this behavior, it can be made configurable in the future.
