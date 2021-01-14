require 'yaml'

yaml = YAML.load(File.read('terrains.yml'))
# raise yaml.inspect
slots = [
  {fertility: -1, solar: 5, gas: 0 },
  {fertility: -1, solar: 4, gas: 0 },
  {fertility: -1, solar: 3, gas: 0 },
  {fertility: -1, solar: 2, gas: 1 },
  {fertility: -1, solar: 2, gas: 2 },
]
structures = {
  'basic': {
    'econ':   {space: -1, berth: -1, energy: -2, con: 0, prod: 0, econ: 4},
    'nanite': {space: -1, berth: -1, energy: -2, con: 4, prod: 4, econ: 1},
    'terraform': {space: 5, berth: 0, energy: 0, con: 0, prod: 0, econ: 0},
  },
  'mid-level': {
    'android':   {space: -1, berth: -1, energy: -4, con: 6, prod: 6, econ: 2},
    'antimatter':   {space: -1, berth: -1, energy: 10, con: 0, prod: 0, econ: 0},
  }
}
