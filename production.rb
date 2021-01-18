require 'amazing_print'
require 'markdown-tables'
MULTIPLIER = 1.5.freeze

rows = []

i = 1
def cost(level)
  [1, 2, 3, 4, 5, 8, 12, 18, 26, 39, 58, 87, 130, 195, 292, 438, 657, 986, 1478, 2217, 3326,4989,7484,11225,16837][level]
end
def price(base, level)
  return 0 if level.zero?

  level -= 1
  multiple = 1
  level.times do |i|
    multiple *= MULTIPLIER
  end
  base * multiple
end
4.times do |i|
  rows << {
      cost: i + 1,
      mr: i + 1,
      rf: 0,
      nf: 0,
      af: 0,
      sy: 0,
      oy: 0,
  }
end
7.times do |i|
  l = rows.last
  rows << {
    mr: l[:mr] + 1,
    rf: l[:rf] + 1,
    nf: 0,
    af: 0,
    sy: l[:sy] + 1,
    oy: 0,
  }
end
6.times do |i|
  l = rows.last
  rows << {
    mr: l[:mr] + 1,
    rf: l[:rf] + 1,
    nf: l[:nf] + 1,
    af: 0,
    sy: l[:sy] + 1,
    oy: 0,
  }
end
6.times do |i|
  l = rows.last
  rows << {
    mr: l[:mr] + 1,
    rf: l[:rf] + 1,
    nf: l[:nf] + 1,
    af: l[:af] + 1,
    sy: l[:sy] + 1,
    oy: 0,
  }
end
2.times do |i|
  l = rows.last
  rows << {
    mr: l[:mr] + 1,
    rf: l[:rf] + 1,
    nf: l[:nf] + 1,
    af: l[:af] + 1,
    sy: l[:sy] + 1,
    oy: l[:oy] + 1,
  }
end

# ap rows
keys = %i[cost mr rf nf af sy oy cv pv]
labels = %w[Cost MR RF NF AF SY OY CV PV]
rows.each_with_index do |row, idx|
  rows[idx].merge!({
    cv: [ row[:mr] * 4, row[:rf] * 2, row[:nf] * 4, row[:af] * 6 ].sum,
    pv: [ row[:mr] * 4, row[:rf] * 2, row[:nf] * 4, row[:af] * 6, row[:sy] * 2, row[:oy] ].sum,
    cost: cost(idx)
  })
  price = %i[mr rf nf af sy oy].map {|s| rows[idx][s].zero? ? 0 : 1}.sum * rows[idx][:cost]
  # puts (price.to_f / rows[idx][:cv]).round(2)
end
data = []
rows.each do |row|
  datum = []
  keys.each do |k|
    v = row[k].zero? ? '-' : row[k]
    datum << v
  end
  data << datum
end

table = MarkdownTables.make_table(labels, data, is_rows: true)
puts MarkdownTables.plain_text(table)
File.open('_includes/astro-empires/production-table.md', 'w').write(table)