class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :contents, :null => false
      t.string :location
      t.datetime :time, :null => false
      t.datetime :time_in_log

      t.timestamps
    end
  end
end
