# 2. Write a class `Sample` whose initialize method takes an arbitrary hash, e.g.
# `h = {"this" => [1,2,3,4,5,6], "that" => ['here', 'there', 'everywhere'], :other => 'here'}`
# and represent each key in the hash as an attribute of an instance of the class, such that I can say:
# `c = Sample.new(h)`
# and then
# `c.this` should return `[1,2,3,4,5,6]`
# `c.that`  should return `['here', 'there', 'everywhere']`
# `c.other` should return `’here’`

class Sample
  def initialize(my_hash) 
  	@my_hash = my_hash   
    my_hash.each do |k,v|
    	define_singleton_method(k) { return v }    
    end	
  end
end`
