class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async

  has_many :accounts

  def admin?
    admin
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  def asset_accounts
    self.accounts.where(account_classification: "Asset Account")
  end

  def assets_total
    asset_accounts.pluck(:balance).inject(:+)
  end

  def debt_accounts
    self.accounts.where(account_classification: "Debt Account")
  end

  def debts_total
    debt_accounts.pluck(:balance).inject(:+)
  end

  def net_worth
    assets_total + debts_total
  end

  rails_admin do
    
    object_label_method do
      :full_name
    end

    list do
      field :id
      field :first_name
      field :last_name
      field :email
    end

    show do
      field :first_name
      field :last_name
      field :email
      field :accounts
    end

    edit do
      field :first_name
      field :last_name
      field :email
      field :accounts do
        read_only true
      end
    end

  end

end
