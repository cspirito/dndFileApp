class CreateFileobjs < ActiveRecord::Migration
  def self.up
    create_table :fileobjs do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :fileobjs
  end
end
