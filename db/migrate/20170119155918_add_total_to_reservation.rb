class AddTotalToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :total, :integer
  end
end
