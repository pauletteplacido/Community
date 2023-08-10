# frozen_string_literal: true

class AddPictureToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :picture, :string
  end
end
