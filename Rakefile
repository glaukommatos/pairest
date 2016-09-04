require 'gem_version'

task :spec do
  sh 'rspec spec'
end

task :lint do
  sh 'rubocop'
end

task :build_gem do
  sh 'gem build pairest.gemspec'
end

spec = Gem::Specification.new do |s|
  s.name        = 'pairest'
  s.version     = GemVersion.next_version
  s.date        = Time.now.strftime '%Y-%m-%d'
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

desc 'generate new gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
  GemVersion.increment_version
end

task default: [:spec, :lint]
task build: [:default, :gemspec, :build_gem]

