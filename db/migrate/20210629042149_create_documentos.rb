class CreateDocumentos < ActiveRecord::Migration[6.1]
  def change
    create_table :documentos do |t|
      t.text :docxml
      t.string :nit
      t.date :fecha_emision
      t.decimal :valor_total
      t.string :correo
      t.timestamps
    end
  end
end
