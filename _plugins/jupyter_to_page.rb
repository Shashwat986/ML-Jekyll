module Jekyll
  class JupyterToPage < Generator
    def generate(site)
      site.static_files.each do |file|
        if file.extname == '.ipynb'
          site.pages << JupyterPage.new(
            site,
            site.source,
            file
          )
        end
      end
    end
  end

  class JupyterPage < Page
    def initialize(site, base, file)
      super(site, base, file.instance_variable_get(:@dir), file.name)
    end
  end
end
