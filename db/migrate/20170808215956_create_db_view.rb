class CreateDbView < ActiveRecord::Migration[5.1]
  def up
    self.connection.execute %Q( CREATE OR REPLACE VIEW number_of_orders_for_users AS
          SELECT users.email, COUNT("orders"."user_id") AS orders_count
          FROM "users"
          INNER JOIN "orders" ON "orders"."user_id" = "users"."id"
          GROUP BY users.id
          ORDER BY users.id
      )
  end

  def down
    self.connection.execute "DROP VIEW IF EXISTS number_of_orders_for_users;"
  end
end
