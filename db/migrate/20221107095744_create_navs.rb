class CreateNavs < ActiveRecord::Migration[6.1]
  def change
    create_table :navs do |t|
      t.string :laber
      t.string :url

      t.timestamps
    end
  end
end
