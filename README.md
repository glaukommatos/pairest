Pairest

Please create a ~/.pairest.yml with the following format (right now it'll crash if you don't):
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


As of right now, this isn't linked into any $PATH by default, so you'll need to do that yourself until it's packaged as a gem.

The main executable is 'pairest' and usage is like this:
```
    $ pairest hp bl
```

Keep in mind that the Git commands it runs are not with the --global flag. This was on purpose, but if it's useful to configure this behavior, it can be made configurable in the future.