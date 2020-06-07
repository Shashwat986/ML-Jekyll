require 'tempfile'

module Jekyll
  class JupyterConverter < Converter
    safe false
    priority :high

    def matches(ext)
      ext =~ /^\.ipynb$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      file = Tempfile.new('foo.ipynb')
      file.write(content)
      file.close

      content = `jupyter nbconvert --to html #{file.path} --stdout`

      file.unlink

      content
    end
  end
end
