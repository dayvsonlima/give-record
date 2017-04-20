# encoding: utf-8
require File.expand_path("../lib/give-record/version", __FILE__)

Gem::Specification.new do |s|
    #Metadata
    s.name = "give-record"
    s.version = GiveRecord::VERSION
    s.authors = ["dayvsonlima"]
    s.email = ["dayvsonlima31@gmail.com"]
    s.homepage = ""
    s.summary = %q{Optimizes how to fetch records in the database with the rails}
    s.description = %q{Optimizes how to fetch records in the database with the rails}
    s.licenses = ['']

    #Manifest
    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ['lib']

    s.add_development_dependency 'rspec', '~> 3'

    s.add_dependency 'activerecord'
end
