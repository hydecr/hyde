require "http/client"
require "file_utils"
require "zip"

require "./hyde/*"

# TODO: Write documentation
module Hyde
  def self.configure(&block)

  end

  def self.init(opts, args)
    path = args[0]?
    force = opts.force
    blank = opts.blank
    template_name = opts.template

    if blank
      template_path = "https://codeload.github.com/hydecr/hyde_template_blank/zip/master"
    # elsif template_name =~ /^https?:\/\//
    #   template_path = template_name.match(/\/(\S+\/\S+)$/)
    #   template_path = "https://codeload.github.com/hydecr/hyde_template_#{template_name}/zip/master"
    elsif template_name.includes?('/')
      template_path = "https://codeload.github.com/#{template_name}/zip/master"
    else
      template_path = "https://codeload.github.com/hydecr/hyde_template_#{template_name}/zip/master"
    end

    unless path
      return puts "Can't create a project without a path"
    end

    unless force
      if Dir.exists?(path)
        return puts "Path at '#{path}' already exists. Use '--force' to override."
      end
    end

    FileUtils.mkdir_p(path)
    response = HTTP::Client.get(template_path)

    if response.status_code != 200
      return puts "Requested template could not be found."
    end

    io = IO::Memory.new(response.body)
    Zip::File.open(io) do |zip|
      zip.entries.each do |file|
        _, filename = file.filename.split('/', 2)
        outpath = File.join(path, filename)
        if file.file?
          file.open do |file_io|
            File.write(outpath, file_io)
            puts "Wrote #{outpath}"
          end
        else
          FileUtils.mkdir_p(outpath)
          puts "Created directory #{outpath}"
        end
      end
    end

    puts "Initialized a new project at #{path}"
  end

  def self.build(opts, args)
    source = opts.source
    source_file = File.join(source, "hyde.cr")

    unless File.exists?(source_file)
      return puts "Can't find a 'hyde.cr' file. Are you sure you're in a Hyde project?"
    end

    main_file = File.open(source_file)
    main_file += "\n Hyde.build"


  end

  def self.serve(opts, args)

  end

  def self.open_docs
    puts "Opening Hyde documentation using xdg-open"
    `xdg-open https://docs.hydecr.com`
  end
end
