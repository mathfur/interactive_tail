# -*- encoding: utf-8 -*-

class CreateLogFiles < ActiveRecord::Migration
  def change
    create_table :log_files do |t|
      t.string :file_name, :null => false
      t.string :type
      t.integer :pos, :null => false, :default => 0

      t.timestamps
    end
  end
end
