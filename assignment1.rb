#1. Convert this string
#string = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"
#to this hash:
#h = {"key" => [["value_1", "value_2"],["value_3", "value4"]], #5=>"10:00AM"}
#then convert h to JSON.
#Please note that the brackets are unbalanced on purpose.

string = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"

#make required string manupaltions 
s2 = string.split(':', 3).join('=>').sub(']],',']]=>').split('=>')

s2[0].gsub!('{','')

s2[1] = s2[1].delete('[]').split(',').map(&:strip).each_slice(2).to_a

s2[2] = s2[2].to_i

s2[3].gsub!(']}','')

#expected hash value
hash = Hash[s2.each_slice(2).to_a]
puts "Expected Hash: #{hash}"


#expected json value
require 'json'
json = hash.to_json
puts "Expected JSON: #{json}"

#verify the json value by converting it back to hash
hash2 = JSON.parse json
#this step is required as parsing leads to key name in string format and this needs to be converted to integer type
hash2[5] = hash2.delete "5"


puts "Match: #{hash == hash2}"