
guard 'livereload' do
  extensions = {
    css: :css,
    js: :js,
    html: :html,
    png: :png,
    gif: :gif,
    jpg: :jpg,
    jpeg: :jpeg,
  }

  exts = %w(erb haml html)

  # file types LiveReload may optimize refresh for
  compiled_exts = extensions.values.uniq
  watch(%r{__output/public/.+\.(#{compiled_exts * '|'})})

  # file needing a full reload of the page anyway
  watch(%r{__output/.+\.(#{exts * '|'})$})
end

guard 'rake', :task => 'testify:run' do
  watch(%r{basket/*.*})
end
