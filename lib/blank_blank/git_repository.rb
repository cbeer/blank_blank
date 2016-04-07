require 'git'
require 'tmpdir'

module BlankBlank
  class GitRepository
    attr_reader :uri

    def initialize(uri)
      @uri = uri
    end

    def clone(dir)
      Git.clone(uri, 'repo', path: dir)
    end

    def within_temporary_clone
      Dir.mktmpdir do |dir|
        yield clone(dir)
      end
    end
  end
end
