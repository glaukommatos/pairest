require 'rake'

Gem::Specification.new do |s|
  s.name        = 'pairest'
  s.version     = '0.1.0'
  s.date        = '2016-09-03'
  s.summary     = 'Pairest is a pair switching utility for Git written in Ruby!'
  s.description = 'Have you ever wanted a git pair utility but also care about your SSH keys? Then Pairest might be for you. Maybe.'
  s.authors     = ['Haskell Pointer', 'Brian Lai', 'Kali Olsen']
  s.email       = 'haskell.pointer@asynchrony.com'
  s.files       = FileList['lib/*.rb'].to_a
  s.homepage    =
    'https://gitlab.asynchrony.com/kyle.pointer/pairest'
  s.license     = 'MIT'
  s.executables << 'pairest'
end
