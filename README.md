# Pairest

[![Build Status](https://travis-ci.org/glaukommatos/pairest.svg?branch=master)](https://travis-ci.org/glaukommatos/pairest)
[![Code Climate](https://codeclimate.com/github/glaukommatos/pairest/badges/gpa.svg)](https://codeclimate.com/github/glaukommatos/pairest)
[![Test Coverage](https://codeclimate.com/github/glaukommatos/pairest/badges/coverage.svg)](https://codeclimate.com/github/glaukommatos/pairest/coverage)
[![Issue Count](https://codeclimate.com/github/glaukommatos/pairest/badges/issue_count.svg)](https://codeclimate.com/github/glaukommatos/pairest)

## Installation
To install Pairest, do
```
    gem install pairest
```

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

Pairest will also create an ```~/.ssh/config``` if you do not have one already. You'll need to edit it before you can use pairest. If you already have an ```~/.ssh/config```, then you'll have to add an entry for whichever git origin you're accessing via SSH and tell it to point at ```~/.ssh/current_key```.

Pairest will manage keys under ```~/.ssh/```, so the key name in ```./pairest.yml``` refers to the name of a key file in the ```~/.ssh/``` directory. If you don't know how to create an SSH key, google the documentation for ```ssh-keygen``` or read its ```man``` page. Pairest works by changing the current_key link inside of your ```~/.ssh/``` directory, so it will create a default ssh config file that points at this private key for an example host. You'll have to change it to be the host you actually care about. You can read up on the ssh config file format [here](http://linux.die.net/man/5/ssh_config) or by doing ```man ssh_config```.

# Caveats
Keep in mind that the Git commands it runs are not with the ```--global``` flag. This was on purpose, but if it's useful to configure this behavior, it can be made configurable in the future.

# Issues
Please feel welcome to open issues and pull requests on this repository if you have any issues or feature requests. Thanks!
