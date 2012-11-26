module ProjectsControllerPatch
    def self.included(base)
    	base.send(:include, InstanceMethods)
	    base.class_eval do
	      alias_method_chain :settings, :template
	    end
    end
module InstanceMethods
  def settings_with_template 
    @issue_custom_fields = IssueCustomField.find(:all, :order => "#{CustomField.table_name}.position")
    @issue_category ||= IssueCategory.new
    @member ||= @project.members.new
    @trackers = Tracker.all
    @wiki ||= @project.wiki
    @project_id = @project.id
    @templates = WikiTemplates.find(:all,:conditions => ["project_id = ? " , @project_id ])
  end
end
end
