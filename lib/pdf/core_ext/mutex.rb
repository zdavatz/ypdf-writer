
unless RUBY_VERSION < '1.9'
  class ::Mutex
    def _dump(level)
      return ""
    end unless method_defined?(:_dump)
    def self._load(data)
      return new
    end unless method_defined?(:_load)
  end
end

