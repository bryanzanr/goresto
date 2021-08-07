=begin
Swagger Petstore

This is a sample server Petstore server.  You can find out more about     Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).      For this sample, you can use the api key `special-key` to test the authorization     filters.

OpenAPI spec version: 1.0.0
Contact: apiteam@swagger.io
Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

class InitTables < ActiveRecord::Migration
  def change
    create_table "api_response".pluralize.to_sym, id: false do |t|
      t.integer :code
      t.string :type
      t.string :message

      t.timestamps
    end

    create_table "category".pluralize.to_sym, id: false do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end

    create_table "order".pluralize.to_sym, id: false do |t|
      t.integer :id
      t.integer :pet_id
      t.integer :quantity
      t.datetime :ship_date
      t.string :status
      t.boolean :complete

      t.timestamps
    end

    create_table "pet".pluralize.to_sym, id: false do |t|
      t.integer :id
      t.string :category
      t.string :name
      t.string :photo_urls
      t.string :tags
      t.string :status

      t.timestamps
    end

    create_table "tag".pluralize.to_sym, id: false do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end

    create_table "user".pluralize.to_sym, id: false do |t|
      t.integer :id
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :phone
      t.integer :user_status

      t.timestamps
    end

  end
end
