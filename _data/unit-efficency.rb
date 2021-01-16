require 'yaml'
require 'amazing_print'
require 'markdown-tables'

data = YAML.load(File.read('ae-units.yml'))
@units = {}

ORDER = %w[
  Fighters Bombers HeavyBombers IonBombers Corvette Destroyer Frigate
  IonFrigate Cruiser HeavyCruiser Battleship
  Dreadnought Leviathan Titan DeathStar Carrier FleetCarrier].freeze
  # OutpostShip Recycler ScoutShip].freeze
# ap data
ARMOR_TECH = 22.0
SYMBOLS = {
  yes: '✓',
  no: '·',
  maybe: '?'
}.freeze
TECH_LEVELS = {
  Disruptor: 20,
  Ion: 20,
  Laser: 22,
  Missiles: 20,
  Photon: 12,
  Plasma: 20,
  Armour: 22,
  Shield: 14
}.freeze

# Ratio = (Power'_Attacker_' - Shield'_Defender_') / Armour'_Defender_'
def ratio(unit)
  armour = unit['armour'] * ARMOR_TECH
  (armour / unit['cost']).round(2)
end

def power(attacker)
  tech = TECH_LEVELS[@units[attacker]['weapon'].to_sym] * 0.05
  @units[attacker]['power'].to_f * tech
end

def armour(defender)
  tech = TECH_LEVELS[:Armour] * 0.05
  @units[defender]['armour'].to_f * tech
end

def shield(defender)
  tech = TECH_LEVELS[:Shield] * 0.05
  @units[defender]['shield'].to_f * tech
end

def attack(attacker, defender)
  cost   = @units[attacker]['cost'].to_f
  power  = power(attacker)
  shield = shield(defender)
  (cost / (power - shield)).round(2)
end

def calc_attack(attacker, defender)
  power = power(attacker)
  shield = shield(defender)
  armour = armour(defender)
  if power < shield
    power *= attacker['weapon'] == 'Ion' ? 0.5 : 0.01
  end

  if power < armour
    "#{(armour / power).ceil}<small>:1</small>"
  else
    "<small>1:</small>#{((power - shield) / armour).ceil}"
  end
end

def kills(attacker, defender)
  [calc_attack(attacker, defender), calc_attack(defender, attacker)]
end

def cost(attacker, defender)
  return '-' if attacker == defender

  cost_a = attack(attacker, defender)
  cost_d = attack(defender, attacker)

  case true
  when (cost_a < cost_d) then SYMBOLS[:yes]
  when (cost_a == cost_d) then SYMBOLS[:maybe]
  else SYMBOLS[:no]
  end
end

def abbr(key)
  @units[key]['abbr']
end

ORDER.each do |key|
  @units[key] = data[key]
  @units[key]["ratio"] = ratio(@units[key])
end

## Cacluate Efficency
rows = []
labels = ["", ORDER.map{|k| abbr(k)}].flatten
ORDER.each do |attack_key|
  row = [abbr(attack_key)]
  ORDER.each do |defend_key|
    c = cost(attack_key, defend_key)
    # k = kills(attack_key, defend_key)
    row << c
  end
  rows << row
end

table = MarkdownTables.make_table(labels, rows, is_rows: true)
File.open('../_includes/astro-empires/efficiency.md', 'w').write(table)

## Calculate Kill Ratios
rows = []
labels = ['', ORDER.map{|k| abbr(k)}].flatten
ORDER.each do |attack_key|
  row = [abbr(attack_key)]
  ORDER.each do |defend_key|
    # c = cost(attack_key, defend_key)
    k = kills(attack_key, defend_key).first
    row << k
  end
  rows << row
end
table = MarkdownTables.make_table(labels, rows, is_rows: true)
# puts table
File.open('../_includes/astro-empires/kill-ratios.md', 'w').write(table)