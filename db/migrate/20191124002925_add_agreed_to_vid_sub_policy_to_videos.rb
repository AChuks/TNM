class AddAgreedToVidSubPolicyToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :agreed_to_vid_sub_policy, :boolean, :default => false
  end
end
