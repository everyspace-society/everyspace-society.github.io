require 'awesome_print'
require 'date'
require 'FileUtils'
require './string.rb'
require './pmwiki.rb'
require './octopress.rb'

files = Dir["wiki.d/**/AstroEmpires.*"] 
# files = ["wiki.d/AstroEmpires.AdvancedBaseGuide"]

j = 0
files.each do |orig|
	next if orig.nil? || orig.match('RecentChanges') || orig.match('Template') || orig.match('Category')
	j += 1
	# exit if j > 10
	p = PmWikiPage.new(orig)
	o = OctopressPage.new(p)

	ap p.title
	ap o.filename
	o.write
end