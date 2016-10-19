# encoding: utf-8

require 'puppet/face'
require 'puppet/resource/catalog'
require 'puppet/util/colors'

Puppet::Face.define(:bundle, '0.1.0') do
  extend Puppet::Util::Colors

  license "Apache-2.0"
  copyright "SIMP Team", 2016
  author "SIMP TEAM <simp@simp-project.com>"

  summary "Bundles control repo assets into a portable (zip) package that can be used with `puppet apply`"
  action :bundle do
    default
    summary "Bundle files and directories for one-time deployments"
    description <<-'EOT'
      A puppet face that packages control repo assets into a portable (zipped) collection
      that can be used in a masterless context with `puppet apply`.
    EOT
    notes <<-'EOT'
      I should probably add some notes here.
    EOT
    returns <<-'EOT'
      Nothing.
    EOT
    arguments "[<dir>]"
    option "--dest", "-d" do
      summary "The destination directory of the zipped bundle. $vardir by default."
    end
    option "--aio", "-a" do
      summary "Bundle the Puppet AIO with the other assets."
    end
    when_invoked do |*args|
      if args.empty?
        STDERR.puts "You must specify a directory to bundle."
        exit 1
      end
      bundle_dir = args.pop
      color = :green
      description = "My face says strings!"
      puts colorize(color, bundle_dir)
      puts "  #{description}" if description
    nil
    end
    def zip(src, destdir=Puppet[:vardir])
      # Zip up dest dir for bundle
      File.open("#{destdir}/puppet_bundle.tar.gz", "wb") do |file|
        Zlib::GzipWriter.wrap(file) do |gz|                                                                                                                            
          Gem::Package::TarWriter.new(gz) do |tar|    
            Find.find(src) do |to_add|
              next if File.directory?(to_add)
              mode = File.stat(to_add).mode
              tar.add_file_simple(to_add, mode, to_add.length)
            end  
          end  
        end  
      end  
    end
  end
end
