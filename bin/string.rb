class String
	def decamelize!
		self.gsub!(/([a-z])([A-Z])/, '\1 \2')
		self.downcase!
	end
  def decamelize
    self.gsub(/([a-z])([A-Z])/, '\1 \2').gsub(/([A-Z])([A-Z])/, '\1 \2').downcase
  end
  def titleize
    self.split(/(\W)/).map(&:capitalize).join
  end
  def urlize
  	l = self.decamelize
  	l.strip.gsub(/[^a-z0-9\.\/]/,'-').gsub(".",'/').gsub(/[\(\)~]/,"").gsub(/^-/,'').gsub(/\/-/,'')
  end
end