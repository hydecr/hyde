module Hyde
  module Extensions
    class_getter registered
    @@registered = {} of Symbol => Hyde::Extension

    def self.register(name : Symbol, extension : Hyde::Extension, options = nil)
    end
  end
end
