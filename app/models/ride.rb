class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
        # binding.pry 
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        
        elsif self.user.height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."

        elsif self.user.tickets < self.attraction.tickets 
                return  "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else 
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            
            self.user.update(:tickets=> self.user.tickets)
            self.user.update(:happiness=> self.user.happiness)
            self.user.update(:nausea=> self.user.nausea)
            return "Thanks for riding the #{self.attraction.name}!"
        end

    end 
end 
