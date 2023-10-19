class AddProfToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :prof, :string
  end
end
