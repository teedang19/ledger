class AssetAccount < Account
  belongs_to :user
  validates :context, inclusion: { in: ["Liquid", "Investment", "Insurance", "Other"] }
end