Config = {}

-- Na jak dlouho budou vypnuté øízení pøi nárazu
Config.DisableControlsTimer = 2000

-- Povolte prasknutí pneumatik kvùli poškození vozidla
-- Pokud vozidlo utrpí náraz vìtší než zadaná hodnota, hráèovi prasknou pneumatiky
Config.TiresBurstFromDamage = true
Config.TiresBurstDamageRequired = 25

-- Povolte tuhle možnost, aby vám prasknuli pneumatiky pøi nárázu v urèené rychlosti
Config.TiresBurstFromSpeed = true
Config.TiresBurstSpeedRequired = 100 -- Speed in MPH

-- Zapnutím téhle možnosti, vypnete hráèi øízení
Config.DisableControlsOnTiresBurst = true
