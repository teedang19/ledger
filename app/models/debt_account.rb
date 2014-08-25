class DebtAccount < Account
  belongs_to :user
  validates :context, inclusion: { in: ["Credit Card", "Student Loan", "Other"] }
end