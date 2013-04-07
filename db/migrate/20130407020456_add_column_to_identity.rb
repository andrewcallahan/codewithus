class AddColumnToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :oauth_expires_at, :datetime
  end
end
