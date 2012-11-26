require 'redmine'

# Including dispatcher.rb in case of Rails 2.x
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

if Rails::VERSION::MAJOR >= 3
	ActionDispatch::Callbacks.to_prepare do
		# use require_dependency if you plan to utilize development mode
		require_dependency 'wiki_controller'
	  WikiController.send(:include, WikiControllerPatch)
	  require_dependency 'projects_helper'
	  ProjectsHelper.send(:include, ProjectsHelperPatch)
	  require_dependency 'projects_controller'
	  ProjectsController.send(:include, ProjectsControllerPatch)
	end
else
	Dispatcher.to_prepare :redmine_gsc_plantillas do
	  require_dependency 'wiki_controller'
	  WikiController.send(:include, WikiControllerPatch)
	  require_dependency 'projects_helper'
	  ProjectsHelper.send(:include, ProjectsHelperPatch)
	  require_dependency 'projects_controller'
	  ProjectsController.send(:include, ProjectsControllerPatch)
	end
end

Redmine::Plugin.register :redmine_gsc_plantillas do
  name 'Redmine Gsc Plantillas plugin'
  author 'Marta Gonzalez de Chaves Aguilera'
  description 'This is a plugin for Redmine. Show a template when you add a new page'
  version '0.1.0'
  url 'http://www.gsc.es'
  author_url 'http://www.gsc.es'
  project_module :templates do
  	permission :view_templates, :templates => :find_project
	permission :create_templates, :templates => [:new, :find_project]
	permission :delete_templates, :templates => [:destroy, :find_project]
	permission :edit_templates, :templates => [:edit, :find_project]
  end
  menu :admin_menu, :templatesg, { :controller => 'templatesg', :action => 'index' }, :caption => :app_menu_global_templates

end

class RedmineToolbarHookListener < Redmine::Hook::ViewListener
   def view_layouts_base_html_head(context)
     stylesheet_link_tag('gsc_plantillas', :plugin => :redmine_gsc_plantillas )
   end
end
