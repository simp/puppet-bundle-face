# encoding: utf-8

require 'puppet/face'
require 'puppet/resource/catalog'
require 'puppet/util/colors'

Puppet::Face.define(:ls, '1.0.0') do
  extend Puppet::Util::Colors

  license "Apache-2.0"
  copyright "SIMP Team", 2016
  author "SIMP TEAM <simp@simp-project.com>"

  summary "Bundles control repo assets into a portable package that can be used with `puppet apply`"
  action :bundle do
    default
    summary "Bundle files and directories"
    description <<-'EOT'
      Bundle files and directories
      Reads and lists file resources from the catalog.
      The source of the catalog can be managed with the `--catalog_terminus` and
      the `--catalog_cache_terminus` option.
    EOT
    notes <<-'EOT'
      To be able to specify the -r option without a path you need to specify the
      subcommand as well: `puppet ls list -r`
    EOT
    returns <<-'EOT'
      Nothing.
    EOT
    arguments "[<path>]"
    when_invoked do |*args|
      options = args.pop
      if args.empty?
        path = Dir.pwd
      else
        path = File.expand_path args.pop
      end
      path = path[0..-2] if path.end_with? File::SEPARATOR
      color = :green
      description = "My face says strings!"
      puts colorize(color, path)
      puts "  #{description}" if description
    nil
    end
  end
end
