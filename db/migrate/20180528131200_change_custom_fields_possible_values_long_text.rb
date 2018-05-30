class ChangeCustomFieldsPossibleValuesLongText < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.adapter_name =~ /mysql/i
      max_size = 4294967295
      change_column :custom_fields, :possible_values, :text, :limit => max_size
    end
  end

  def down
    # nothing to revert
  end
end
