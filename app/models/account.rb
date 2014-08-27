class Account < ActiveRecord::Base
  validates :type, inclusion: { in: ["DebtAccount", "AssetAccount"] }
end