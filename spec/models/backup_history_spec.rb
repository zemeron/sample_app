require 'spec_helper'

describe BackupHistory do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: backup_histories
#
#  id            :integer(4)      not null, primary key
#  emailedFrom   :string(255)
#  subject       :string(255)
#  body          :text
#  status        :string(255)
#  hostname      :string(255)
#  resource      :string(255)
#  backupProgram :string(255)
#  acknowledged  :boolean
#  finishDt      :datetime
#  created_at    :datetime
#  updated_at    :datetime
#

