class AddPublishedAttributeDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:articles, :published, false)
  end
end
