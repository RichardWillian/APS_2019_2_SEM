class CreateDicas < ActiveRecord::Migration[5.1]
  def change
    create_table :dicas do |t|
      t.string :nome
      t.string :mensagem

      t.timestamps
    end
  end
end
