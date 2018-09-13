require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].collect do |holiday, event|
    event << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring].collect do |holiday, event|
    event << supply
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
     holiday_hash[season].merge!(holiday_name => supply_array)

end


def all_winter_holiday_supplies(holiday_hash)
  array = []
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, data|
    if season == :winter
    data.each do |holiday, supplies|
      array << supplies
      end
    end
  end
  return array.flatten
end

# given that holiday_hash looks like this:
holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
     format_season = season.to_s.capitalize()  + ":" # => "Winter:"
      puts format_season
       data.each do |holiday, supplies|
           format_holiday = holiday.to_s.split("_").map {|word| word.capitalize }.join(" ") + ":"
           puts "  #{format_holiday} #{supplies.join(", ")}"
        end
    end
end


# all_supplies_in_holidays(holiday_hash)
#call ruby lib/holiday.rb

def all_holidays_with_bbq(holiday_hash)
  # Write a method to collect all holidays with BBQ
  # return an array of holiday names (as symbols) where supply lists include the string "BBQ"
  holidays = []
  holiday_hash.each do |season, data|
    data.each do |holiday, supplies|

      supplies.each do |supply|
      if supply == "BBQ"
        holidays << holiday
        end
      end
    end
  end
  return holidays
end

# hash = { "a" => 100, "b" => 200, "c" => 300, "d" => 300 }
# hash.key(200)   #=> "b"
# hash.key(300)   #=> "c"
# clients.select{|key, hash| hash["client_id"] == "2180" }



# h = { "a" => 100, "b" => 200 }
# h.has_key?("a")   #=> true
# h.has_key?("z")   #=> false




# holidays_with_bbqs(holiday_supplies)
#=> [:fourth_of_july, :memorial_day]
