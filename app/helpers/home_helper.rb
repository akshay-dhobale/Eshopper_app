module HomeHelper
  def session_count
    b =  session.keys 
    @p = b.map(&:to_i)
    @count = 0
    
    @p.each do |i|
      if i != 0 
        @count += 1
      end
    end
    @count
  end

end
