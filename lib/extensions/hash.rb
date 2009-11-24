class Hash
  def to_s
    collect { |key, value| 
      key = parametize(key)
      "#{key}=#{CGI.escape(value.to_s)}" 
    }.join("&")  
  end
  
  def parametize(str)
    params = str.to_s.split("_")
    params[0] + params[1..-1].map(&:titleize).join
  end
end