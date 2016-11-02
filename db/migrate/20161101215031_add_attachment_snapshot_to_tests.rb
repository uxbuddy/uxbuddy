class AddAttachmentSnapshotToTests < ActiveRecord::Migration
  def self.up
    change_table :tests do |t|
      t.attachment :snapshot
    end
  end

  def self.down
    remove_attachment :tests, :snapshot
  end
end
