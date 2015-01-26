class AddSongs < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
  		t.string :title
  		t.string :artist
  		t.string :link
  		t.datetime :created_at
  		t.datetime :updated_at
  	end
  end
end