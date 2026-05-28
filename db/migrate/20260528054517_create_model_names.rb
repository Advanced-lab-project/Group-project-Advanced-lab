class CreateModelNames < ActiveRecord::Migration[8.1]
  def change
    create_table :model_names do |t|
      t.timestamps
    end
  end
end
