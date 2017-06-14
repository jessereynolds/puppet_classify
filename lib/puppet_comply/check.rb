
# download module
#
# download dependencies
#
# verify each class and defined type in the module has an associated rspec test - fail if no
#
# run rspec tests in the module, inserting our shared examples into their context
#

require 'puppet_forge'

module PuppetComply
  module Check
    def self.run(opts)
      self.download_module(forge)
      self.download_dependencies
    end

    def self.download_module

      modules_dir = File.join(Dir.pwd, 'modules')
      unless File.exist?(modules_dir)
        Dir.mkdir(modules_dir)
      end

      release_slug = "puppetlabs-apache-1.6.0"
      release_tarball = release_slug + ".tar.gz"
      dest_dir = File.join(modules_dir, 'apache')
      tmp_dir = File.join(Dir.pwd, 'tmp')
      unless File.exist?(tmp_dir)
        Dir.mkdir(tmp_dir)
      end

      # Fetch Release information from API
      # @raise Faraday::ResourceNotFound error if the given release does not exist
      release = PuppetForge::Release.find release_slug

      # Download the Release tarball
      # @raise PuppetForge::ReleaseNotFound error if the given release does not exist
      release.download(Pathname(release_tarball))

      # Verify the MD5
      # @raise PuppetForge::V3::Release::ChecksumMismatch error if the file's md5 does not match the API information
      release.verify(Pathname(release_tarball))

      # Unpack the files to a given directory
      # @raise RuntimeError if it fails to extract the contents of the release tarball
      PuppetForge::Unpacker.unpack(release_tarball, dest_dir, tmp_dir)
    end

    def self.download_dependencies
    end

  end
end

