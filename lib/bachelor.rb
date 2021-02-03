require 'pry'
require 'json'
file = File.read('./spec/fixtures/contestants.json')
contestants = JSON.parse(file)

def get_first_name_of_season_winner(data, season)
  winner = data[season].find { | contestant | contestant["status"] == "Winner" }
      winner["name"].split[0]
end

def all_contestant_data(data)
  data.values.flatten
end

def get_contestant_name(data, occupation)
  name = nil
  contestants = all_contestant_data(data)
  contestants.find do |attributes|
    if attributes["occupation"] == occupation
      name = attributes["name"]
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  contestants = all_contestant_data(data)
  contestants.count do |contestant|
      contestant["hometown"] == hometown
  end
end

def get_occupation(data, hometown)
  occupation = nil
  contestants = all_contestant_data(data)
  contestants.find do |attributes|
    if attributes["hometown"] == hometown
      occupation = attributes["occupation"]
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  total_age = data[season].sum { |contestant|
    contestant["age"].to_f }
  total_contestants = data[season].length
  (total_age.to_f / total_contestants.to_f).round
end

