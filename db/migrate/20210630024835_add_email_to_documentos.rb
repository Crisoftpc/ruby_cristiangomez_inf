class AddEmailToDocumentos < ActiveRecord::Migration[6.1]
  def change
    add_column :documentos, :email, :string
  end
end
