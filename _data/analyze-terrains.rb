require 'yaml'
require 'amazing_print'
require 'markdown-tables'

terrains = YAML.load(File.read('terrains.yml'))
structures = YAML.load(File.read('structures.yml'))
# defenses = YAML.load(File.read('defenses.yml'))
# raise yaml.inspect
slots = [
  { fertility: -1, solar: 5, gas: 0 },
  { fertility: 0,  solar: 4, gas: 0 },
  { fertility: 1,  solar: 3, gas: 0 },
  { fertility: 1,  solar: 2, gas: 1 },
  { fertility: 0,  solar: 2, gas: 2 },
]
# Calculate max population
ENERGY_MULTIPLIER = 2.0
max_advanced = 5
max_CC = 5

area_increase = 25 # Terraform * 5

test = {'moon': {},'planet': {}}

def energy(slot, terrain, area, fert=0)
  energy = [slot[:solar], (slot[:gas] + terrain['gas'])].max * ENERGY_MULTIPLIER
  structures = (area.to_f / (energy - 1)).ceil
  [energy, structures]
end

def iterate_astros(data, category, metals=0 )
  data[category].each_key do |terrain|

    next if metals != data[category][terrain].first[:metal]

    5.times.each do |slot|
      yield [slot + 1, data[category][terrain][slot]]
    end
  end
end

def berths(area, fertility)
  (area.to_f / (fertility - 1)).ceil
end

def available_space(area, structures)
  area -= structures.each_value.map do |v|
    v
  end.inject(0, :+)
  area
end

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def report(test, category, title, metals=0)
  # ap test[category].key
  omitted = []

  response = "\n\n### #{title}\n\n"
  labels = %w[Type Ideal Slot-1 Slot-2 Slot-3 Slot-4 Slot-5 ]
  data = []
  summary = []
  iterate_astros(test,category,metals) do |astro|
    summary << astro.last[:remaining]
  end
  worst = summary.min
  better = summary.max
  puts "#{category}: #{worst}"
  test[category].keys.each do |type|
    values = []
    metal = test[category][type].first[:metal]

    if metal != metals
      omitted << type
      next
    end
    5.times.each do |slot|
      astro = test[category][type][slot]

      values << astro[:remaining].to_i
      # ap test[category][type][slot][:structures]
    end
    max = values.max
    
    best = values.each_with_index.map { |v,i| i + 1 if v == max }.compact.join(", ")

    values = values.map{ |v| (v - worst).to_i }
    values = values.map do |v|
      #  v == (better - worst) ? "_#{v}_" : v}
      case 
      when v == (better - worst)
        "**#{v}**"
      when v == (max - worst)
        "_#{v}_"
      else
        v
      end
    end
    data << [type, best, values].flatten
    # break
  end
  # ap data
  response << MarkdownTables.make_table(labels, data, is_rows: true)
  response << "\n\nOmitted: #{omitted.join(", ")}\n\n"
  end
  
# Berts = space / (fertility - 1)
base_structures = {
  # 'shipyards': 12,
  # 'spaceports': 10,
  # 'command-centers': 5,
  # 'planet-shield': 2
}
# Natural Energy Only
test.each_key do |type|
  terrains.each_key do |t| # T = Terrain Type
    # puts "### #{type}"
    test[type][t] = []
    # puts "--- #{t}"
    5.times do |s| # S = Slot
      test[type][t][s] = {structures: base_structures}

      # Add Terraforms for maximum space
      test[type][t][s][:area] = terrains[t][type.to_s] + max_advanced
      test[type][t][s][:metal] = terrains[t]['metal']

      # Calculate Housing
      test[type][t][s][:fertility] = terrains[t]['fertility'] + slots[s][:fertility]
      berths, structures = berths(test[type][t][s][:area],test[type][t][s][:fertility])
      test[type][t][s][:berths] = berths
      test[type][t][s][:structures]['urban'] = berths
      remaining = available_space(test[type][t][s][:area], test[type][t][s][:structures])
      test[type][t][s][:remaining] = remaining

      # Calculate Natural Energy
      energy, structures = energy(slots[s], terrains[t], test[type][t][s][:area], test[type][t][s][:remaining])
      test[type][t][s][:energy] = energy
      test[type][t][s][:remaining] = structures
      test[type][t][s][:structures]['natural-energy'] = energy
      test[type][t][s][:remaining] = available_space(test[type][t][s][:area], test[type][t][s][:structures])
      
    end
    
  end
end

# ap test[:moon]['Arid']
final = "\n\n## Metal-4\n\n"
final << report(test, :moon, "Moon, Metal-4", 4)
final << report(test, :planet, "Planet, Metal-4", 4)

final << "\n\n## Metal-3\n\n"

final << report(test, :moon, "Moon, Metal-3", 3)
final << report(test, :planet, "Planet, Metal-3", 3)
final << "\n\n"

# puts final
# pbcopy(final)
File.open("analysis.yml", "w") { |file| file.write(test.to_yaml) }

markdown_page = '../_astro-empires/analysis-v3.md'
contents = File.read(markdown_page)
contents.gsub!(/(?<=<!--DATA-->).*?(?=<!--\/DATA-->)/m, final)
File.open(markdown_page, "w") { |file| file.write(contents) }
# puts contents

