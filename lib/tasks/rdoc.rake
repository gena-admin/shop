RDoc::Task.new :rdoc do |rdoc|

  rdoc.rdoc_files.include(
    'app/controllers/*.rb',
    'app/models/*.rb',
    'lib/*.rb',
    'config/**/*.rb'
  )

  rdoc.rdoc_dir = 'doc'
  rdoc.title = 'Shop app Documentation'
  rdoc.options << '--all'
end
