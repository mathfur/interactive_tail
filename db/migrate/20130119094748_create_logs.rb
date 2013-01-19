class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :contents
      t.string :location
      t.datetime :time
      t.datetime :time_in_log

      t.timestamps
    end
  end
end
