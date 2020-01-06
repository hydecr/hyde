require "yaml"

module Hyde
  class Frontmatter

    @yaml : YAML::Any?

    getter content : String

    forward_missing_to @yaml

    private def initialize(@yaml : YAML::Any, @content : String)
    end

    def self.parse(data : String)
      parsed = data.match(/(?:(?:\-{3,}\s+)([\S\s]+)(?:\s+\-{3,}))?([\S\s]+)/)
      return new(nil, "") unless captures = parsed.try &.captures
      yaml, content = captures
      new(yaml, content)
    end
  end
end
