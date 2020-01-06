require "clim"
require "./hyde"

module Hyde
  class CLI < Clim
    main do
      desc "Hyde CLI #{Hyde::VERSION}\n  " +
        "Command line interface for Hyde. See https://hydecr.com for usage information."
      usage "hyde <sub_command> [arguments]"

      version "Hyde CLI #{Hyde::VERSION}"
      help short: "-h"

      run do |opts, args|
        puts opts.help_string # => help string.
      end

      sub "new" do
        desc "generate a new Hyde project in the current directory"
        usage "hyde new <path> [arguments]"
        alias_name "init", "n"

        option "-v", "--verbose",
          type: Bool,
          desc: "run in verbose mode",
          default: false

        option "--force",
          type: Bool,
          desc: "force creation, even if <path> already exists",
          default: false

        option "--blank",
          type: Bool,
          desc: "create scaffolding, but with empty files",
          default: false

        option "--template=NAME",
          type: String,
          desc: "specify the template to use (by name or git url)",
          default: "default"

        run do |opts, args|
          Hyde.init(opts, args)
        end
      end

      sub "build" do
        desc "build the Hyde project in the current directory"
        usage "hyde build [arguments]"
        alias_name "b"

        option "-s DIR", "--source=DIR",
          type: String,
          desc: "source directory",
          default: "./"

        option "-d DIR", "--destination=DIR",
          type: String,
          desc: "destination directory",
          default: "./_build"

        option "-v", "--verbose",
          type: Bool,
          desc: "run in verbose mode",
          default: false

        option "--watch",
          type: Bool,
          desc: "watch the project and recompile when things change",
          default: false

        run do |opts, args|
          Hyde.build(opts, args)
        end
      end

      sub "serve" do
        desc "serve your Hyde site locally"
        usage "hyde serve [arguments]"
        alias_name "server", "s"

        option "-s DIR", "--source=DIR",
          type: String,
          desc: "source directory",
          default: "./"

        option "-v", "--verbose",
          type: Bool,
          desc: "run in verbose mode",
          default: false

        option "-h HOST", "--host=HOST",
          type: String,
          desc: "host to serve on",
          default: "127.0.0.1"

        option "-p PORT", "--port=PORT",
          type: Int32,
          desc: "port to serve on",
          default: 3000

        option "-o", "--open",
          type: Bool,
          desc: "open your site in browser",
          default: false

        option "-d", "--daemon",
          type: Bool,
          desc: "run the server in the background",
          default: false

        option "--ssl-key=PATH",
          type: String,
          desc: "set path to the ssl key to use"

        option "--livereload",
          type: Bool,
          desc: "rebuild and reload when things change",
          default: false

        run do |opts, args|
          Hyde.serve(opts, args)
        end
      end

      sub "docs" do
        desc "open the Hyde docs in your default browser"
        usage "hyde docs"

        run do |opts, args|
          Hyde.open_docs
        end
      end
    end
  end
end

Hyde::CLI.start(ARGV)
