require 'awesome_print'
require 'date'
require 'FileUtils'
require './string.rb'
require './pmwiki.rb'
require './octopress.rb'
require 'json'

files = Dir["wiki.d/**/*.*"] 
# files = Dir["wiki.d/**/Eve*.*"] 
# files = Dir["wiki.d/**/Macro*"]

j = 0

linked_pages = {}


titles = {}
redirects = {}
# _redirects.json
files.each do |orig|
	next if orig.nil? || orig.match('RecentChanges') || orig.match('Template') || orig.match('Category')
	p = PmWikiPage.new(orig)
	o = OctopressPage.new(p)
	redirects[orig.gsub('wiki.d','')] = o.filename.gsub('source','').gsub('index.markdown','')
	redirects[orig.gsub('wiki.d','').gsub('.','/')] = o.filename.gsub('source','').gsub('index.markdown','')
	next
	# raise redirects.inspect
	# o.write
	titles[o.filename] = o.title
	linked_pages[o.filename] = o.other_pages
end

File.open("source/_redirects.json",'w').write(redirects.to_json)
exit

related = Hash.new()
linked_pages.keys.each do |k|
	pages = linked_pages[k]
	next if pages.empty?
	related[k] = pages
end

# raise related.keys.inspect

related.keys.each do |k|
	pages = related[k]
	raw = File.open(k,'r').read()
	
	next unless raw.match("Related Articles")
	raw.gsub!("Related Articles", "Related Articles\n\n#{OctopressPage.related_articles(pages)}")
	
	File.open(k,'w').write(raw)
end
files = Dir['source/macropedia/**/*.*']

# raise files.length.inspect

i = 0

fff = "%3c%3c|[Imperium Equipment Index](/macropedia/imperium-equipment-index)|>>"
rgx = "%3c%3c|[Imperium Edition Index](/macropedia/imperium-edition-index)|>>"

m = files.length
def cln(l)
	l.gsub('/index.markdown','').gsub('source/','').prepend('/').gsub(/^\/\//,'/')
end
m.times do 
	h = i - 1
	j = i + 1
	file = files[i]
	pfile = (i > 0) ? files[h] : ""
	nfile = (i < (m-1)) ? files[j] : ""
	i += 1

	contents = File.open(file,'r').read

	# puts "Changing: #{titles[file]}"
	
	index = <<-HERE
<div class='row'>
	<div class='col-md-4'><a href='#{cln(pfile)}'>#{titles[pfile]}</a></div>
	<div class='col-md-4'><a href='#{cln(file)}'>#{titles[file]}</a></div>
	<div class='col-md-4'><a href='#{cln(nfile)}'>#{titles[nfile]}</a></div>
</div>
	HERE

	new_contents = contents.gsub("#{rgx}", index).gsub("#{fff}", index)
	if (new_contents == contents)
		new_contents =  contents.split("\n").insert(10,index).join("\n")
	end
	
	File.open(file,'w').write(new_contents)
	
end