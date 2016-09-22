# your code goes here
def begins_with_r(words)
  !words.any? do |word|
    word[0].upcase != "R"
  end
end

def contain_a(words)
  words.select do |word|
    word.include?("a")
  end
end

def first_wa(words)
  words.find do |word|
    word[0..1].upcase == "WA"
  end
end

def remove_non_strings(array)
  array.map do |item|
    item if item.is_a? String
  end.compact
end

def count_elements(array)
  count_array = array.uniq.each do |hash|
    hash[:count] = 0
    #[{:name_key => name, :count => 0}, {:name_key => name, :count => 0}]
  end
  count_array.each do |name_count_hash|
    array.each do |hash|
      if name_count_hash.first == hash.first  #first entry of each count_array, the name == first entry of the one-entry hash
        name_count_hash[:count] += 1
      end
    end
  end
  count_array
end

def merge_data(keys, data) # data is a size one array with a hash in it
  new_hash_array = []
  data[0].each_with_index do |(name, traits_hash), index|
    # new_hash_array << person_hash.values.first
    # new_hash_array[index][:first_name] = keys[index][:first_name]
    new_hash_array[index] = keys[index]
    traits_hash.each do |trait, value|
      new_hash_array[index][trait] = value
    end
  end
  new_hash_array

end




def find_cool(cool_hash)
  cool_hash.map do |person_hash|
    person_hash if person_hash[:temperature] == "cool"
  end.compact
end

def organize_schools(schools_hash)
  organized_schools = {}
  schools_hash.each do |school_name, loc_hash|
    location = loc_hash[:location]
    if !organized_schools.keys.include?(location)
      organized_schools[location] = [school_name]
    else
      organized_schools[location] << school_name
    end
  end
  organized_schools
end
