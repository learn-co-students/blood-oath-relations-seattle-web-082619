class BloodOath
    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize (initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult 
        @follower = follower
        @@all << self
        standard_date
    end

    def self.all 
        @@all
    end

    def blood_oath_year
        self.initiation_date.slice(0, 4).to_i
    end

    def blood_oath_month
        self.initiation_date.slice(5, 2).to_i
    end

    def blood_oath_day
        self.initiation_date.slice(-2, 2).to_i
    end

    def self.first_oath
        oldest_oath_year = self.all.first.blood_oath_year
        oldest_oath_month = self.all.first.blood_oath_month
        oldest_oath_day = self.all.first.blood_oath_day
        follower = self.all.first.follower
        self.all.each do |f|
            if f.blood_oath_year <= oldest_oath_year && f.blood_oath_month <= oldest_oath_month && f.blood_oath_day < oldest_oath_day
                oldest_oath_year = f.blood_oath_year
                oldest_oath_month = f.blood_oath_month
                oldest_oath_day = f.blood_oath_day
                follower = f.follower
            end
        end
        follower
    end

    def standard_date
        if @initiation_date.slice(4) != '-' && @initiation_date.slice(7) != '-'
            puts "Please enter initiation date using the standard of YYYY-MM-DD."
            puts "This new Blood Oath will not be saved."
            @@all.pop
        elsif blood_oath_day < 1 || blood_oath_day > 31
            puts "Please enter initiation date using the standard of YYYY-MM-DD."
            puts "This new Blood Oath will not be saved."
            @@all.pop
        elsif blood_oath_month < 1 || blood_oath_month > 12
            puts "Please enter initiation date using the standard of YYYY-MM-DD."
            puts "This new Blood Oath will not be saved."
            @@all.pop
        elsif blood_oath_year < 1 || blood_oath_year > 2019
            puts "Please enter initiation date using the standard of YYYY-MM-DD."
            puts "This new Blood Oath will not be saved."
            @@all.pop
        end
    end


end