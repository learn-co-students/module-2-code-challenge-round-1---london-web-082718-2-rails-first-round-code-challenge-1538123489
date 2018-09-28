class AddHeroineIdToPowers < ActiveRecord::Migration[5.0]

  def change
    add_column :powers, :heroine_id, :integer

# action you want #table  # column name    #column type

  end
end
