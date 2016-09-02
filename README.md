# Pairest

## Installation
To install Pairest, do a ```gem build pairest.gemspec``` then do a ```gem install``` on the file that is created.

The main executable is 'pairest' and usage is like this:
```
    $ pairest hp bl
```

## Setup
Please create a ```~/.pairest.yml``` with the following format (if you don't one will be created for you):
```
hp:
  name: Haskell Pointer
  email: kyle.pointer@asynchrony.com
  key_name: kyle.pointer
bl:
  name: Brian Lai
  email: brian.lai@asynchrony.com
  key_name: brian.lai

```

Pairest will manage keys under ```~/.ssh/```, so the key name refers to the name of a key file in the ```~/.ssh/``` directory. If you don't know how to create an SSH key, google the documentation for ```ssh-keygen``` or read it's ```man``` page.

# Caveats
Keep in mind that the Git commands it runs are not with the ```--global``` flag. This was on purpose, but if it's useful to configure this behavior, it can be made configurable in the future.
