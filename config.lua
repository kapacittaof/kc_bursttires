Config = {}

-- Na jak dlouho budou vypnut� ��zen� p�i n�razu
Config.DisableControlsTimer = 2000

-- Povolte prasknut� pneumatik kv�li po�kozen� vozidla
-- Pokud vozidlo utrp� n�raz v�t�� ne� zadan� hodnota, hr��ovi prasknou pneumatiky
Config.TiresBurstFromDamage = true
Config.TiresBurstDamageRequired = 25

-- Povolte tuhle mo�nost, aby v�m prasknuli pneumatiky p�i n�r�zu v ur�en� rychlosti
Config.TiresBurstFromSpeed = true
Config.TiresBurstSpeedRequired = 100 -- Speed in MPH

-- Zapnut�m t�hle mo�nosti, vypnete hr��i ��zen�
Config.DisableControlsOnTiresBurst = true
