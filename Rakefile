# -*- ruby -*-

require 'rubygems'
require 'hoe'
require "rake/extensiontask"

Hoe.plugins.delete :rubyforge
Hoe.plugin :minitest
Hoe.plugin :gemspec # `gem install hoe-gemspec`
Hoe.plugin :git     # `gem install hoe-git`

Hoe.spec 'av_capture' do
  developer('Aaron Patterson', 'tenderlove@ruby-lang.org')
  self.readme_file   = 'README.markdown'
  self.history_file  = 'CHANGELOG.rdoc'
  self.extra_rdoc_files  = FileList['*.{rdoc,markdown}']

  self.spec_extras = {
    :extensions            => ["ext/av_capture/extconf.rb"],
    :required_ruby_version => '>= 2.0.0'
  }

  license 'MIT'

  Rake::ExtensionTask.new "av_capture", spec do |ext|
    ext.lib_dir = File.join(*['lib', ENV['FAT_DIR']].compact)
  end
end

task :test => [:compile]

# vim: syntax=ruby
