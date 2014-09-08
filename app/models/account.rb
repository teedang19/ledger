class Account < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :account_classification, :context, :balance
  validates :account_classification, inclusion: { in: ["Debt Account", "Asset Account"] }
  validate :context_by_classification
  validate :balance_reflects_asset_or_debt

  private

    def context_by_classification
      case account_classification
      when "Asset Account"
        unless ["Liquid", "Investment", "Insurance", "Other"].include?(context)
          errors.add(:account_classification, "must be either Liquid, Investment, Insurance, or Other for an Asset Account.")
        end
      when "Debt Account"
        unless ["Credit Card", "Student Loan", "Other"].include?(context)
          errors.add(:account_classification, "must be either Credit Card, Student Load, or Other for a Debt Account.")
        end
      end
    end

    def balance_reflects_asset_or_debt
      case account_classification
      when "Asset Account"
        unless balance > 0
          errors.add(:balance, "must be positive for an Asset Account.")
        end
      when "Debt Account"
        unless balance <= 0
          errors.add(:balance, "must be negative for a Debt Account.")
        end
      end
    end

  rails_admin do

    list do
      field :user
      field :name
      field :balance
      field :account_classification do
        label do
          "Type"
        end
      end
      field :context
    end

    show do
      field :user
      field :name
      field :balance
      field :account_classification do
        label do
          "Type"
        end
      end
      field :context
    end

    edit do
      field :user do
        read_only true
      end
      field :name
      field :balance do
        read_only true
      end
      field :account_classification, :enum do
        label do
          "Type"
        end
        enum do
          ["Asset Account", "Debt Account"]
        end
      end
      field :context, :enum do
        enum do
          ["Liquid", "Investment", "Insurance", "Other", "Credit Card", "Student Loan"]
        end
      end
    end

  end

end