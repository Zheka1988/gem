$:.push File.expand_path(".", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mortgage'
  s.version     = '1.0.1'
  s.date        = '2020-08-06'
  s.summary     = 'Mortgage - Simple gem for calculate 
annuity and differential payments'
  s.description = 'Mortgage - Simple gem for calculate 
annuity and differential payments'
  s.author      = 'Kveladze Yevgeniy'
  s.email       = 'kveladze.kz@mail.ru'
  s.homepage    = 'https://github.com/Zheka1988/gem.git'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
end


