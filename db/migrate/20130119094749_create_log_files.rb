# -*- encoding: utf-8 -*-

class CreateLogFiles < ActiveRecord::Migration
  def change
    create_table :log_files do |t|
      t.string :file_name, :null => false
      t.string :log_type
      t.integer :pos, :null => false, :default => 0
      t.integer :limit_of_skip, :null => false, :default => 30000

      t.timestamps
    end
  end
end
