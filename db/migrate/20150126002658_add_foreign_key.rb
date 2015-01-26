class AddForeignKey < ActiveRecord::Migration
  def change
  	change_table :songs do |t|
  		add_foreign_key :users, :primary_key
  	end
  end
end