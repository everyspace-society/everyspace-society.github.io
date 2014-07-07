class PmWikiPage
	def initialize(f)
		@filename = f
		@data = {}
		@group, @name = File.basename(f).split(".")
		File.open(f,'r').readlines.each do |entry|
			bits = entry.force_encoding("iso-8859-1").strip.split("=")
			@data[bits.shift] = bits.join("=")
		end
		# ap @data.keys
		@nl = @data['newline'] || "%0a"
		begin
			@lines = @data['text'].split(@nl) unless @data['text'].nil?
		rescue
			ap @data
			@lines = ["",""]
		end
		
		return self
	end
	def newline
		@nl
	end
	def group
		@group
	end
	def revision
		@data['rev']
	end
	def created_on
		times = []
		@data.keys.each do |k|
			next unless k.include?("author:")
			x,t = k.split("author:")
			times << t unless times.include?(t)
		end
		time = times.sort.first || @data['time']
		DateTime.strptime(time,'%s')
	end
	def modified_on
		DateTime.strptime(@data['time'],'%s')
	end
	def url
		@data['name'].urlize
	end
	def author
		authors = []
		@data.keys.each do |k|
			a = @data[k]
			if (k.match("author") and !authors.include?(a))
				authors << a
			end
		end
		authors
	end
	def text
		begin
			return @lines.join(newline)
		rescue
			ap "Text Join Error: #{@data['name']}"
		end
	end
	def title
		title = 'Untitled'
		if text.include?("(:title")
			text.gsub(/\(:title\s(.*?):\)/) { title = $1; ""}
		else
			title = @data['name'].split('.').last
		end
		return title.decamelize.titleize
	end
end