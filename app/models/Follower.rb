class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all 
        @@all
    end

    def cults
        cult = []
        BloodOath.all.select { |c| cult << c.cult if c.follower == self }
        cult
    end

    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, cult, self)
    end

    def self.of_a_certain_age(num)
        self.all.select { |f| f.age >= num }
    end

    def my_cults_slogans
        puts self.cults.collect { |c| c.slogan }
    end

    def self.most_active
        follower = nil
        cults = 0
        self.all.each do |c|
            if c.cults.length > cults
                cults = c.cults.length 
                follower = c 
            end
        end
        follower
    end

    def self.cult_count
        cult_count = {}
        BloodOath.all.map do |c| 
            cult_count[c.follower] ? cult_count[c.follower] += 1 : cult_count[c.follower] = 1
        end
        cult_array = cult_count.sort_by { |k, v| -v }
        cult_array.collect { |i| i[0] }
    end

    def self.top_ten
        top_ten = []
        self.cult_count[0...10].each { |i| top_ten << i }
        top_ten
    end
    
end