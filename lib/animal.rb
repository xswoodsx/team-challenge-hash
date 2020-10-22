class Animal 

 attr_accessor :name, :legs, :likes

def initialize(name, legs, *likes)
 @name = name
 @legs = legs
 @likes = likes
end

def to_hash()
{
:name => @name,
:legs => @legs,
:likes => @likes
}

 end
end