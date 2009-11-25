class Hash
  #def to_s
  #  collect { |key, value| 
  #    key = parametize(key)
  #    "#{key}=#{CGI.escape(value.to_s)}" 
  #  }.join("&")  
  #end
  
  def to_s
    keys.each do |key|
      self[parametize(key.to_s)] = CGI.escape(self[key].to_s)
      delete(key)
    end
    self
  end
  
  def parametize(str)
    params = str.to_s.split("_")
    params[0] + params[1..-1].map(&:titleize).join
  end
end


