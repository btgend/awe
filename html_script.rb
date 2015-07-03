
@content = ['<html>', '<head>', '</head>', '<body>', '<header>', '</header>',
  '<main>', '</main>', '<footer>', '</footer>', '</body>', '</html>']

class Area_start
  def initialize(start_tag)
    @a_start_tag=start_tag
  end
  
  def to_s
    @a_start_tag.to_s
  end
end

class Area_end
  def initialize(end_tag)
    @a_end_tag=end_tag  
  end
  def to_s
    @a_end_tag.to_s
  end
end

def create_area (start_tag=" ", end_tag=" ", place=" ")
  tag_area_start = Area_start.new(start_tag)
  tag_area_end = Area_end.new(end_tag)
  
  if (place == "header")
      @content.each do |index|
        if (index.include?("<header>"))
          pos = @content.index("</header>")
          @content.insert(pos, tag_area_start.to_s)
          @content.insert(pos+1, tag_area_end.to_s)  
          break      
        end 
      end
    end
  
  
  if (place == "main")
    @content.each do |index|
       if (index.include?("<main>"))
         pos = @content.index("</main>")
         @content.insert(pos, tag_area_start.to_s)
         @content.insert(pos+1, tag_area_end.to_s)
         break        
       end 
     end
   end
   
  if (place == "footer")
    @content.each do |index|
      if (index.include?("<footer>"))
        pos = @content.index("</footer>")
        @content.insert(pos, tag_area_start.to_s)
        @content.insert(pos+1, tag_area_end.to_s)        
        break
      end 
    end
  end
  
  if(place == " ")
    @content
  end
  
  File.open("layout.html", "w+") do |f|     
    @content.each do |element|
      f.puts(element)
    end
  end  
end

create_area("<div>", "</div>", "header")
create_area("<p>", "</p>" ,"header")
create_area("<div>","</div>","main")
create_area("<section>","</section>","main")
create_area("<div>","</div>","footer")
create_area("<section>","</section>","footer")