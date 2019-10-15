require 'pry'

class User
 attr_accessor :email, :age
 @@list = []

 def initialize(emaili, lage)
   @email = emaili
   @age = lage
   @@list << emaili
  end
end
