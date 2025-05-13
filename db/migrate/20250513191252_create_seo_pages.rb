class CreateSeoPages < ActiveRecord::Migration[8.0]
  def change
    create_table :seo_pages do |t|
      t.string :keyword
      t.string :slug
      t.string :pillar
      t.string :meta_title
      t.string :meta_description
      t.text :headline
      t.text :subheading
      t.text :content
      t.timestamps
    end

    add_index :seo_pages, :keyword
    add_index :seo_pages, :slug
    add_index :seo_pages, :pillar
  end
end
