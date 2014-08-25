class DebtAccount < Account
  belongs_to :user
  validates :context, inclusion: { in: ["credit card", "student loan", "other"] }
end