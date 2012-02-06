class ChangeWikiTemplatesgTextLimit < ActiveRecord::Migration
  def self.up
    # Migrates MySQL databases only
    # Postgres would raise an error (see http://dev.rubyonrails.org/ticket/3818)
    # Not fixed in Rails 2.3.5
    if ActiveRecord::Base.connection.adapter_name =~ /mysql/i
      max_size = 16.megabytes
      change_column :wiki_templatesgs, :text, :text, :limit => max_size
    end
  end

  def self.down
    # no-op
  end
end
