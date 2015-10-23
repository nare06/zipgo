class AddMfgDateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :mfg_date, :datetime
  end
end
