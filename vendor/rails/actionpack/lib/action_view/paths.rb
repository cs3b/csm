module ActionView #:nodoc:
  class PathSet < Array #:nodoc:
    def self.type_cast(obj)
      if obj.is_a?(String)
        if Base.warn_cache_misses && defined?(Rails) && Rails.initialized?
          Base.logger.debug "[PERFORMANCE] Processing view path during a " +
            "request. This an expense disk operation that should be done at " +
            "boot. You can manually process this view path with " +
            "ActionView::Base.process_view_paths(#{obj.inspect}) and set it " +
            "as your view path"
        end
        Path.new(obj)
      else
        obj
      end
    end

    def initialize(*args)
      super(*args).map! { |obj| self.class.type_cast(obj) }
    end

    def <<(obj)
      super(self.class.type_cast(obj))
    end

    def concat(array)
      super(array.map! { |obj| self.class.type_cast(obj) })
    end

    def insert(index, obj)
      super(index, self.class.type_cast(obj))
    end

    def push(*objs)
      super(*objs.map { |obj| self.class.type_cast(obj) })
    end

    def unshift(*objs)
      super(*objs.map { |obj| self.class.type_cast(obj) })
    end

    class Path #:nodoc:
      attr_reader :path, :paths
      delegate :hash, :inspect, :to => :path

      def initialize(path, load = false)
        raise ArgumentError, "path already is a Path class" if path.is_a?(Path)
        @path = path.freeze
        reload! if load
      end

      def to_s
        if defined?(RAILS_ROOT)
          path.to_s.sub(/^#{Regexp.escape(File.expand_path(RAILS_ROOT))}\//, '')
        else
          path.to_s
        end
      end

      def to_str
        path.to_str
      end

      def ==(path)
        to_str == path.to_str
      end

      def eql?(path)
        to_str == path.to_str
      end

      # Returns a ActionView::Template object for the given path string. The
      # input path should be relative to the view path directory,
      # +hello/index.html.erb+. This method also has a special exception to
      # match partial file names without a handler extension. So
      # +hello/index.html+ will match the first template it finds with a
      # known template extension, +hello/index.html.erb+. Template extensions
      # should not be confused with format extensions +html+, +js+, +xml+,
      # etc. A format must be supplied to match a formated file. +hello/index+
      # will never match +hello/index.html.erb+.
      #
      # This method also has two different implementations, one that is "lazy"
      # and makes file system calls every time and the other is cached,
      # "eager" which looks up the template in an in memory index. The "lazy"
      # version is designed for development where you want to automatically
      # find new templates between requests. The "eager" version is designed
      # for production mode and it is much faster but requires more time
      # upfront to build the file index.
      def [](path)
        if loaded?
          @paths[path]
        else
          Dir.glob("#{@path}/#{path}*").each do |file|
            template = create_template(file)
            if path == template.path_without_extension || path == template.path
              return template
            end
          end
          nil
        end
      end

      def loaded?
        @loaded ? true : false
      end

      def load
        reload! unless loaded?
        self
      end

      # Rebuild load path directory cache
      def reload!
        @paths = {}

        templates_in_path do |template|
          template.load!
          @paths[template.path] = template
          @paths[template.path_without_extension] ||= template
        end

        @paths.freeze
        @loaded = true
      end

      private
        def templates_in_path
          (Dir.glob("#{@path}/**/*/**") | Dir.glob("#{@path}/**")).each do |file|
            yield create_template(file) unless File.directory?(file)
          end
        end

        def create_template(file)
          Template.new(file.split("#{self}/").last, self)
        end
    end

    def load
      each { |path| path.load }
    end

    def reload!
      each { |path| path.reload! }
    end

    def [](template_path)
      each do |path|
        if template = path[template_path]
          return template
        end
      end
      nil
    end

    def find_template(path, *formats)
      if formats && formats.first == :all
        formats = Mime::EXTENSION_LOOKUP.values.map(&:to_sym)
      end
      formats.each do |format|
        if template = self["#{path}.#{format}"]
          return template
        end
      end
      if template = self[path]
        return template
      end
      nil
    end
  end
end
