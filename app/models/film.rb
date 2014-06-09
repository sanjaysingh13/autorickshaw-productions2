class Film < ActiveRecord::Base
	# Film has many stills
has_many    :stills, :inverse_of => :film, :dependent => :destroy
# enable nested attributes for stills through film class
accepts_nested_attributes_for :stills, allow_destroy: true
def stills_for_form
collection = stills.where(film_id: id)
collection.any? ? collection : stills.build
end
end
