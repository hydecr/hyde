module Hyde
  module Extensions
    class_getter registered
    @@registered = {} of String => Hyde::Extension

    def self.register(name : String, extension : Hyde::Extension, options = nil)
    end


  end
end
