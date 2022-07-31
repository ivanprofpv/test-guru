module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  #запуск блока на уровне класса в момент вызова модуля
  #благодаря extend, который выше
  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
