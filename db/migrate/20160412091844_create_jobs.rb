class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.integer :company_id, null: false
    	t.string :job_title, null: false
    	t.text :job_des
    	t.date :date_posted, null: false
    	t.date :date_valid, null: false
    end
  end
end
