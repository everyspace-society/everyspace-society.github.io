class OctopressPage
	def initialize(pm)
		@filename = "source/#{pm.url}/index.markdown"
		@pm = pm
		@footnotes = []
		return self
	end
	def filename
		return @filename
	end
	def text
		t = @pm.text
		t = _span(t)
		t = _links(t)
		t = _info(t)
		t = _table(t)
		t = t.split(nl).map{|l| 
			l = _header(l)
			l = _links(l)
		}.join(nl)
		t = _strip(t)

		return t
	end
	def write
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
	      page.puts "---"
	      page.puts "\n#{text.gsub(@pm.newline,"\n").encode("UTF-8")}"
	    end
	end
	def np
		return @pm.newline * 2
	end
	def nl
		return @pm.newline
	end
	def _strip(t)
		t.gsub(/\(\:.*?\:\)/,'')
	end
	def _ib(t)
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
			'primary' => 'bg-primary',
			'success' => 'bg-success',
			'note' => 'bg-info',
			'warn' => 'bg-warning',
			'danger' => 'bg-danger',
			'red' => 'text-danger'
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
	def _table(t)
		# "Advanced" Tables
		t = t.gsub(/\(\:table[^:]*?\:\)/,"<table class='table'>")
			.gsub("(:tableend:)","</table>")
			.gsub(/\(\:cellnr class=heading(.*?)\:\)(.*?)#{@pm.newline}/) { "</tr>\n<tr>\n  <th #{$1.strip}>#{_ib($2.strip)}</th>"}
			.gsub(/\(\:cellnr(.*?)\:\)(.*?)#{@pm.newline}/) { "\n</tr>\n<tr>\n  <td #{$1.strip}>#{_ib($2.strip)}</td>"}
			.gsub(/\(\:cell class=heading(.*?)\:\)(.*?)#{@pm.newline}/) { "\n  <th #{$1.strip}>#{_ib($2.strip)}</th>"}
			.gsub(/\(\:cell(.*?)\:\)(.*?)#{@pm.newline}/) { "\n  <td #{$1.strip}>#{_ib($2.strip)}</td>"}
			.gsub(/'table'>\s+<\/tr>/m,"'table'>")

		t = t.gsub(/#{np}\|\|(.*?)#{np}/) {_basic_table($1)}
		return t
	end
	def _header(l)
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
		begin
			return "" if (t.empty? & l.empty?)
			return "[#{t}](#{l})"
		rescue
			ap i
		end
	end
	def _links(t)
		# [[Chronology/HyperspaceVortices|Hyperspace Vortice]]
		t.gsub!(/\[\[([^\]]*?)\]\]/) { _link($1) }
		t.gsub!(/\]\((TheTenSevenGuide)\)/) { "](#{$1.urlize})" }
		return t
	end
end