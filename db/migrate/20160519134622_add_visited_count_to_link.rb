class AddVisitedCountToLink < ActiveRecord::Migration
  def change
    add_column :links, :Visited_count, :integer, default:0
  end
end
