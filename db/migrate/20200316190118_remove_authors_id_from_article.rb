class RemoveAuthorsIdFromArticle < ActiveRecord::Migration[6.0]
  def change

    remove_column :articles, :authors_id, :bigint
    remove_column :articles, :author_id, :string
  end
end
