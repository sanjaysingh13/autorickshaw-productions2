class Film < ActiveRecord::Base
	# Film has many stills
has_many    :stills, :inverse_of => :film, :dependent => :destroy
# enable nested attributes for stills through film class
accepts_nested_attributes_for :stills, allow_destroy: true
def stills_for_form
collection = stills.where(film_id: id)
collection.any? ? collection : stills.build
end
# generating Vimeo comments

def vimeocomments
 
 video = Vimeo::Advanced::Video.new("82caad5d814d421a85c2b8844aab8c756348a74a", "6f7c421aa79efc12abc1a459058913f06d001a62", :token => "c60e31a5d5d878e647984175c871994b", :secret => "0eec1145bd44d62d1308ca38945a9b4eb5bc2934")
 comments = video.get_comments_list(self.url.to_i) 
 q = comments["comments"]["comment"] 
 

 b=Array.new
 m=Array.new

      
   q.reverse_each do |c| 

       if c["id"]==c["reply_to_comment_id"] 

       a = Array.new
       a<< c["id"] 
       b<< a
       q.delete(c) 
       end 

   end 
  

  
  
  

   q.each do |c| 

        b.each do |z|
        if z.first == c["reply_to_comment_id"]

       z<< c["id"]  
       end 
       end 
   end 
  
   

     b.each do |y|
         y= y.sort 
         m<< y
         end 

 return m 
 
 
end

def commentlist
 
 video = Vimeo::Advanced::Video.new("82caad5d814d421a85c2b8844aab8c756348a74a", "6f7c421aa79efc12abc1a459058913f06d001a62", :token => "c60e31a5d5d878e647984175c871994b", :secret => "0eec1145bd44d62d1308ca38945a9b4eb5bc2934")
 comments = video.get_comments_list(self.url.to_i) 
 q = comments["comments"]["comment"] 
end
end
