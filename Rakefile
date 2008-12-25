require 'rubygems'
require 'rake'

task :spec do
  Dir["*-spec.io"].each {|s| system("iospec #{s}") }
end

task :default => :spec