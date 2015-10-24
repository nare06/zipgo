class Upload < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file, content_type:"text/csv"
  
  def process
		begin
	  	file = File.new(self.file.path, "r")
	  	while (line = file.gets)
	  		line.strip!
	  		next if line.empty?
	  		array = line.split(",")  	
		    if array.count == 3
		    	a = Product.find_by(name: array[0].squish)
		    	if a.nil?
			    	a= Product.new
			    	a.name = array[0].squish
			    	a.description = array[1].squish
			    	a.mfg_date = array[2].squish.to_datetime
			    	a.save!
		    	else
		    		next   #Skip products already in database
		    	end
		    else
		    	next     #Skip lines with useless data
		    end
			end
	    	file.close
	    	return true
		rescue => err
	    puts "Exception: #{err}"
	   	return false
		end  	    
  end
end
