class CreateWikiTemplates < ActiveRecord::Migration
  def self.up
    create_table :wiki_templates do |t|
      t.column :author_id, :integer
      t.column :text, :text
      t.column :name, :text
      t.column :updated_on, :datetime
      t.column :project_id, :integer
    end
  end

  def self.down
    drop_table :wiki_templates
  end
end
