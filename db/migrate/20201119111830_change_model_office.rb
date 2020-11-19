class ChangeModelOffice < ActiveRecord::Migration[6.0]
  def change
        remove_column :offices, :amenities, :boolean
        remove_column :offices, :address, :string
        remove_column :offices, :availability_description, :string
        remove_column :offices, :table_num, :string

        rename_column :offices, :price, :rate_per_day
        rename_column :offices, :name, :office_name

        add_column :offices, :address_street, :string
        add_column :offices, :address_zip, :string
        add_column :offices, :address_city, :string

        add_column :offices, :table_num, :integer

        add_column :offices, :placehold_url, :string
        add_column :offices, :drinks, :boolean
        add_column :offices, :snacks, :boolean
        add_column :offices, :social_events, :boolean
        add_column :offices, :community_slack, :boolean
        add_column :offices, :pets_allowed, :boolean
        add_column :offices, :night_shift, :boolean
        add_column :offices, :community_manager, :boolean
        add_column :offices, :outdoor_area, :boolean
        add_column :offices, :smoking_area, :boolean

        add_column :offices, :cat_open_space, :boolean
        add_column :offices, :cat_single_space, :boolean
        add_column :offices, :cat_corporate, :boolean
        add_column :offices, :cat_startup, :boolean
        add_column :offices, :cat_private_owner, :boolean
        add_column :offices, :cat_skyscraper, :boolean
        add_column :offices, :cat_city, :boolean
        add_column :offices, :cat_rural, :boolean
        add_column :offices, :cat_boutique, :boolean
        add_column :offices, :cat_black_lable, :boolean

  end
end

