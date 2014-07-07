class OctopressPage
	def initialize(pm)
		@filename = "source/#{pm.url}/index.markdown"
		@pm = pm
		@footnotes = []
		@categories = []
		@GroupPattern = '[[:upper:]][\\w]*(?:-\\w+)*';
		@wikiword = "[[:upper:]][[:alnum:]]*(?:[[:upper:]][[:lower:]0-9]|[[:lower:]0-9][[:upper:]])[[:alnum:]]*"
		# @related_articles = []
		@other_pages = []
		return self
	end
	def title
		@pm.title
	end
	def filename
		return @filename
	end
	def text
		t = @pm.text
		t = _categories(t)

		t = _ol(t)
		t = _span(t)
		t = _links(t)
		t = _mediatable(t)
		t = _info(t)
		t = _table(t)
		t = _complex_header(t)
		t = _dl(t)
		t = t.split(nl).map{|l| 
			l = _header(l)
			l = _links(l)
		}.join(nl)
		t = _strip(t)

		return t
	end
	def write
		# puts "Wont' Write: #{filename} exists." if File.exists?(filename)
		content = text.gsub(@pm.newline,"\n").encode("UTF-8")
		FileUtils.mkdir_p(File.dirname(filename))
		open(filename, 'w') do |page|
	      page.puts "---"
	      page.puts "layout: page"
	      page.puts "title: \"#{@pm.title}\""
	      page.puts "date: #{@pm.created_on}"
	      page.puts "comments: true"
	      page.puts "sharing: true"
	      page.puts "footer: true"
	      page.puts "group: #{@pm.group}"
	      page.puts "categories: #{@categories}"
	      page.puts "---"
	      page.puts "\n#{content}"
	    end

	    # puts {filename => @other_pages}.inspect
	    # puts filename.inspect
	    # exit
	end
	def other_pages
		@other_pages
	end
	def np
		return @pm.newline * 2
	end
	def nl
		return @pm.newline
	end
	def _ol(t)
		# return t if t.nil?
		i = 0
		t.gsub(/#{nl}#.*?#{np}/) do |list|
			list.gsub("#{nl}#", "#{nl}#{i += 1}.")
		end
	end
	def _dl(t)
		t.gsub(/#{nl}:.*?#{np}/) do |list|
			items = list.split(nl).map do |item|
				next if item.nil? or item.empty?
				bits = item.split(':')
				"<dt>#{_ib(bits[1])}</dt><dd>#{_ib(bits[2])}</dd>#{nl}"
			end.compact
			"#{np}<dl>#{items.join()}</dl>#{np}"
		end
	end
	def _strip(t)
		t.gsub(/\(\:.*?\:\)/,'')
	end
	def _ib(t)
		return "" if t.nil?
		t.gsub(/\*\*(.*?)\*\*/) {"<strong>#{$1}</strong>"}
		 .gsub(/\*(.*?)\*/) {"<em>#{$1}</em>"}
	end
	def _span(t)
		t.gsub("'''","**")
			.gsub("''","*")
			.gsub(/``(.*?)"/) { "\"#{$1.strip}\""}
	end
	def _info(t)
		c = {
			'primary' => 'bs-callout bs-callout-primary',
			'success' => 'bs-callout bs-callout-success',
			'note' => 'bs-callout bs-callout-info',
			'warn' => 'bs-callout bs-callout-warning',
			'danger' => 'bs-callout bs-callout-danger',
			'red' => 'text-danger',
			'green' => 'text-success',
			'color=#CC6600' => 'text-warning'
		}

		t.gsub(/\>\>(.*?)%3c%3c(.*?)%3c%3c/) { "<div class='#{c[$1]}'>#{$2}</div>"}
			.gsub(">></div>", "</div>")
			.gsub(/%25(.*?)%25(.*?)%25%25/) { "<span class='#{c[$1]}'>#{$2}</span>"}
			.gsub(/(\w)---(\w)/) { "#{$1}&mdash;#{$2}"}
			.gsub(/(\w)--(\w)/) { "#{$1}&ndash;#{$2}"}
	end
	def _basic_table(t)
		table = []
		t.split(nl).each do |line|
			row = []
			next if line.match("cellspacing")
			row << "<tr>\n"
			cells = line.split("\|\|")
			cells.shift
			row << cells.map do |c|
				if (!c.match(/^!/))
					"  <td>#{_ib(c.strip)}</td>\n"
				else
					"  <th>#{_ib(c.sub(/^!/,'').strip)}</th>\n"
				end
			end
			row << "</tr>\n"
			table << row
		end
		return "#{np}<table class='table'>#{table.flatten.join("")}</table>#{np}"
	end
	def _mediatable(t)
		t.gsub(/\{\|(.*?)\|\}/m) do |contents|
			contents = _links(contents)
			output = contents.gsub("{|","").gsub("|}","").split('|-').map do |row|
				# next if row == "{|" or row == "|}" or row == "}"
				# puts row.inspect
				next if row == nl
				cells = row.split(nl).map do |c|
					next if c.empty?
					type = {
						'|' => "td",
						'!' => "th",
						}[c.slice(0)]
					c = c.slice(1..c.length-1).split("|")
					# raise c.inspect
					# d = ""
					next if c.length == 0
					y = if c.length == 1
						"<#{type}>#{_ib(_es(c[0]))}</#{type}>"
					else
						# raise c.inspect
						"<#{type}#{c[0].gsub("%25","%")}>#{_ib(_es(c[1]))}</#{type}>"
					end
				end
				"<tr>#{cells.join("\n")}</tr>"
			end.compact
			output = "<table class='table'>#{output.flatten.join("\n")}</table>"
		end
	end
	def _es(t)
		return t unless t.match('eveskill')
		t.gsub(/\(\:eveskill type=(\S+?) v=(\S+?)\:\)/) { 
				"<input type='text' name='#{$1}' value='#{$2}' id='#{$1}' class='col-md-2' size='3' />"		
		}
	end
	def _table(t)
		# "Advanced" Tables
		t = t.gsub(/\(\:table[^:]*?\:\)/,"<table class='table'>")
			.gsub("(:tableend:)","</table>")
			.gsub(/\(\:cellnr class=heading(.*?)\:\)(.*?)#{@pm.newline}/) { "</tr>\n<tr>\n  <th #{$1.strip}>#{_ib($2.strip)}</th>"}
			.gsub(/\(\:cellnr(.*?)\:\)(.*?)#{@pm.newline}/) { "\n</tr>\n<tr>\n  <td #{$1.strip}>#{_ib($2.strip)}</td>"}
			.gsub(/\(\:cell class=heading(.*?)\:\)(.*?)#{@pm.newline}/) { "\n  <th #{$1.strip}>#{_ib($2.strip)}</th>"}
			.gsub(/\(\:cell(.*?)\:\)(.*?)#{@pm.newline}/) { "\n  <td #{$1.strip}>#{_ib($2.strip)}</td>"}
			.gsub(/'table'>\s+<\/tr>/m,"'table'>")

		t = t.gsub(/#{nl}\|\|(.*?)#{np}/) {_basic_table($1)}
		return t
	end
	def _categories(t)
		r = t.gsub(/\[\[!([^\]]*?)\]\]/) { @categories << $1.decamelize; ""  }
			.gsub(/\[\[#([^\]]*?)\]\]/) {
				a,b = $1.split("|")
				b ||= ""
				s = "<a name='#{a.strip}'>#{b.strip}</a>"  
			}
		
		# return 
	end
	def _complex_header(t)
		# %0aFighters (FT)%0a~~~~~
		t = t.gsub(/#{nl}([^#{nl}]+?)#{nl}~~~+#{nl}/) { "#{nl}### #{$1.strip}#{nl}"}
	end
	def _header(l)
		if false
		end
		return l unless l[0] == '!'
		bits = l.split(" ")
		bits[0] = bits.first.gsub("!","#")
		return bits.join(" ")
	end
	def _link(i)
		if i.include?('|')
			l,t = i.split('|')
		else
			t = i
			# l = "#{@pm.group}/#{i.decamelize}"
			l = i
		end
		l = "#{@pm.group}/#{l}" unless l.include?('.') or l.include?('/')
		l = "/#{l.urlize}" unless l.include?("http")
		@other_pages << [t, l.urlize] unless l.include?("http")
		begin
			return "" if (t.empty? & l.empty?)
			return "[#{t}](#{l})"
		rescue
			ap i
		end
	end
	def _wikilink(t,g=@pm.group)
		return t if t == 'PhDs'
		n = t.decamelize.titleize
		l = if t.match('/')
			t.urlize
		else
			t.prepend('/').prepend(g).urlize
		end
		@other_pages << [n, l.urlize] unless l.include?("http")
		link = "[#{n}](/#{l})"
		# puts [n, l, link].inspect
		return link
	end
	def _links(t)
		# [[Chronology/HyperspaceVortices|Hyperspace Vortice]]
		t.gsub!(/\[\[([^\]]*?)\]\]/) { _link($1) }
		t.gsub!(/(#{@GroupPattern})[\.\/](#{@wikiword})/) { _wikilink($2, $1)}
		t.gsub!(/(#{@wikiword})/) { _wikilink($1, @pm.group) }
		# t.gsub!(/([[:upper:]][[:alnum:]]*(?:[[:upper:]][[:lower:]0-9]|[[:lower:]0-9][[:upper:]])[[:alnum:]]*)/) { _wikilink($1,$2) }
		# t.gsub!(/([A-Z]+[a-z\/]+[A-Z][a-z\/]\w+)/) { _wikilink($1) }
		# t.gsub!(/\]\((TheTenSevenGuide)\)/) { "](#{$1.urlize})" }
		return t
	end
	def self.related_articles(files)
		i = 0
		files.map do |a|
			a[0] = a[0].downcase.titleize
			a
		end.uniq.sort{|a,b| a[0] <=> a[1]}.map do |f|
			"#{i += 1}. [#{f[0]}](/#{f[1].gsub(/^\//,"")})"
		end.join("\n")
	rescue
		ap files
		exit
	end
end