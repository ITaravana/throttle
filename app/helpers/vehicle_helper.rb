module VehicleHelper
	def tag_links(tags)
	  tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
	end
	def tag_links_button(tags)
	  tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip), {class: 'button special small'} }.join(", ") 
	end
end
