class Person < ActiveRecord::Base
  
  attr_accessible :email, :encrypted_password, :family, :name, :salt, :password
  
  def password=(pwd)
    return if pwd.blank?
    new_salt = 'Machinery' + self.id.to_s + rand.to_s
    self.update_attributes encrypted_password: Person.encrypt_password!(pwd, new_salt), salt: new_salt
  end

  def self.authenticate(email, pwd)
    user = Person.first(conditions: { email: email })
    return user if user and user.encrypted_password == Person.encrypt_password!(pwd, user.salt)
    return nil
  end

  # def admin?
  #   Usergroup.find_by_name('Administrator').people.include?(self) rescue false
  # end

private

  def self.encrypt_password!(pwd, salt)
    Digest::SHA1.hexdigest(pwd + salt)
  end
    
end
