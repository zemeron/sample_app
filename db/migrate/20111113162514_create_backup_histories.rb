class CreateBackupHistories < ActiveRecord::Migration
  def change
    create_table :backup_histories do |t|
      t.string :emailedFrom
      t.string :subject
      t.text :body
      t.string :status
      t.string :hostname
      t.string :resource
      t.string :backupProgram
      t.boolean :acknowledged
      t.datetime :finishDt

      t.timestamps
    end
  end
end
