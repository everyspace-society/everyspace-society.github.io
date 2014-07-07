#!/Users/bwilson/.rvm/rubies/ruby-2.0.0-p481/bin/ruby


files = Dir['source/events/**/*.*']

files.each do |file|
	
	name = file.gsub("source/events/", '').gsub("/index",'').prepend("source/_posts/")
	src = File.open(file,'r').read.gsub('layout: page','layout: post')
	# raise src.inspect
	puts "got #{file} -> #{name}"
	File.open(name,'w').write(src)
end