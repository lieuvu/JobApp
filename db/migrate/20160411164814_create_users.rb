class CreateUsers < ActiveRecord::Migration
  def change
   	create_table :users do |t|
    	t.string :email
    	t.string :access_code
    	t.string :username
    	t.string :role, default: "Company"
    end
  end
end
