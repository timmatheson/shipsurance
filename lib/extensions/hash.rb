require 'cgi'

class Hash  
  def to_s
    keys.each do |key|
      self[parametize(key.to_s)] = CGI.escape(self[key].to_s)
      delete(key)
    end
    self
  end
  
  def parametize(str)
    if str.to_s == "ext_rs_void_reason_id"
      "extRSVoidReasonId"
    else
      params = str.to_s.split("_")
      params[0] + params[1..-1].map(&:titleize).join
    end
  end
end


