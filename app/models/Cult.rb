class Cult
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all 
        @@all
    end

    def recruit_follower(initiation_date, follower)
        BloodOath.new(initiation_date, self, follower)
    end

    def cult_members 
        mem = []
        BloodOath.all.select { |c| mem << c.follower if c.cult == self }
        mem
    end

    def cult_population
       self.cult_members.length
    end

    def self.find_by_name(cult)
        self.all.select { |c| c.name == cult }
    end

    def self.find_by_location(location)
        self.all.select { |c| c.location == location }
    end

    def self.find_by_founding_year(year)
        self.all.select { |c| c.founding_year == year }
    end

    def average_age
        self.cult_members.reduce(0) { |sum, a| sum + a.age }.to_f / self.cult_population
    end

    def my_followers_mottos
        self.cult_members.collect { |m| m.life_motto }
    end

    def self.least_popular
        cult = nil
        followers = self.all.first.cult_population
        self.all.each do |c|
            if c.cult_population < followers
                cult = c
                followers = c.cult_population
            end
        end
        cult 
    end

    def self.most_common_location
        locations = {}
        self.all.map do |c| 
            locations[c.location] ? locations[c.location] += 1 : locations[c.location] = 1
        end
        locations.key(locations.values.max)
    end

end