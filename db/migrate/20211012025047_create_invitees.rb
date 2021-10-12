class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :party, foreign_key: true

      t.timestamps
    end
  end
end
