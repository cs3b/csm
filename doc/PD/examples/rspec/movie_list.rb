 class MovieList
   def initialize
     @list = []
   end
   def size
     @list.size
   end
   def include?(title)
     @list.detect {|m| m.name == title}
   end
   def add(movie)
     @list.push movie
   end
 end