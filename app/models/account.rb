class Account < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :account_classification, :context, :balance
  validates :account_classification, inclusion: { in: ["Debt Account", "Asset Account"] }
  validate :context_by_classification

  private

    def context_by_classification
      case account_classification
      when "Asset Account"
        ["Liquid", "Investment", "Insurance", "Other"].include?(context)
      when "Debt Account"
        ["Credit Card", "Student Loan", "Other"].include?(context)
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