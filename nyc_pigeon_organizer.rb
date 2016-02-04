require 'pry'

#notes from lab review (2.4.16):
  # steps: 
  # first, we're going to need the names of all of the pigeons
  # set up initial data structure
  # populate the data structure
  # for each name find the associated property values 

def nyc_pigeon_organizer(data)
  names = names(data)

  initial_structure = initial_structure(names)

  populate(initial_structure, data, names)
end

def names(data)
  data.fetch(:gender).values.flatten #(.flatten into its own array VS 3 nested arrays))
end

# def properties(data)
#   data.keys
# end

def initial_structure(names)
  names.each_with_object({}) do |name, initial_structure| 
    initial_structure[name] = { color: [], gender: [], lives: [] } 
  end
end

def populate(initial_structure, data, names)
  names.each_with_object(initial_structure) do |name, initial_structure|
    initial_structure[name][:color] = find_pigeon_property_values(name, :color, data) 
    initial_structure[name][:gender] = find_pigeon_property_values(name, :gender, data) #
    initial_structure[name][:lives] = find_pigeon_property_values(name, :lives, data) #
    # ["white", "purple"]
  end
end

def find_pigeon_property_values(name, property, data)
  data.fetch(property).collect do |property_value, pigeons_with_property_value|
    if pigeons_with_property_value.include?(name)
      property_value.to_s
    end
  end.compact
end

# def pigeon_names(pigeon_data)
#   male_pigeons = pigeon_data[:gender][:male]
#   female_pigeons = pigeon_data[:gender][:female]

#   pigeons = male_pigeons + female_pigeons
# end
