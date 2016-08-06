class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end
  
  def can_add_stock?(ticker)
    unless already_added_stock?(ticker)
      return true if under_stock_limit?
      return false
    end
  end
  
  def under_stock_limit?
    user_stocks.count < 10
  end
  
  def already_added_stock?(ticker)
    stock = Stock.find_by_ticker(ticker)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
end
