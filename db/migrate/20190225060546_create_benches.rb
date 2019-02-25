class CreateBenches < ActiveRecord::Migration[5.0]
  def change
    create_table :benches do |t|
      t.float :bench_record
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
