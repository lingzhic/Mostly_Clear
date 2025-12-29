# Auto-assign a date to foto_posts documents using the leading YYYY-MM-DD- in the filename
# so they can sort and show dates like regular blog posts.
require 'date'

Jekyll::Hooks.register :documents, :pre_render do |document|
  next unless document.collection.label == 'foto_posts'
  next if document.data['date']

  if document.basename_without_ext =~ /\A(\d{4}-\d{2}-\d{2})-/
    document.data['date'] = Date.parse(Regexp.last_match(1))
  end
end
