require 'pry'
class Actor < ActiveRecord::Base

    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        roles = []
        Show.all.map do |show| 
            show.characters.map do |character|
                if character.actor_id == self.id
                  roles << "#{character.name} - #{show.name}"
                end
            end
        end
        roles
    end
  
end