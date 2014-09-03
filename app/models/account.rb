class Account < ActiveRecord::Base
  belongs_to :user
  validates :account_classification, inclusion: { in: ["Debt Account", "Asset Account"] }
  validates :context_by_classification

  private

    def context_by_classification
      case account_classification
      when "Asset Account"
        ["Liquid", "Investment", "Insurance", "Other"].include?(context)
      when "Debt Account"
        ["Credit Card", "Student Loan", "Other"].include?(context)
      end
    end
    
end