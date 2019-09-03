require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# code examples for testing

f1 = Follower.new("Tom Cruise", 53, "*intense stare*")
f2 = Follower.new("John Travolta", 65, "Grease Lightening!")
f3 = Follower.new("Laura Prepon", 38, "70s Show")
f4 = Follower.new("Beck Hansen", 48, "music")
f5 = Follower.new("Avi Flo", 32, "cult in culture")

c1 = Cult.new("Celebritiology", "Kansas", 1983, "Celebs and money")
c2 = Cult.new("Flatiron", "New York", 2011, "Code")
c3 = Cult.new("Kansas Cult", "Kansas", 2011, "Kansas is culty")

bo1 = BloodOath.new("1993-12-29", c1, f1)
bo2 = BloodOath.new("1985-12-18", c1, f2)
bo3 = BloodOath.new("2002-02-13", c1, f3)
bo4 = BloodOath.new("2001-03-09", c1, f4)
bo5 = BloodOath.new("2012-07-07", c2, f5)
bo6 = BloodOath.new("2014-11-11", c3, f3)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
