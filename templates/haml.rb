run 'rm app/views/layouts/application.html.erb'

create_file 'app/views/layouts/application.html.haml' do
<<-HAML
!!! 5
%html
  %head
    %title= @title ? "#{app_name} | \#\{\@title\}\" : '#{app_name}'
    = stylesheet_link_tag    "application"
    = javascript_include_tag "application"
    = csrf_meta_tags
  %body
    = yield
HAML
end