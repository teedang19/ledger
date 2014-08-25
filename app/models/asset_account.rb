class AssetAccount < Account
  belongs_to :user
  validates :context, inclusion: { in: ["liquid", "investment", "insurance", "other"] }
end