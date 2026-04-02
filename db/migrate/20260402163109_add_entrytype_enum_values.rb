class AddEntrytypeEnumValues < ActiveRecord::Migration[8.1]
  def up
    add_enum_value :entry_type, "transfer"
  end
end
