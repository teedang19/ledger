class Account < ActiveRecord::Base
  validates :type, inclusion: { in: ["Debt", "Asset"] }
end