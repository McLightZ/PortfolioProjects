-- A quick look at the data
SELECT *
FROM portfolio.deathsbyrf_fixed;

select COUNT(*) from population;

-- The total deaths with nutrition as a risk factor

select SUM(diet_high_in_sodium) high_sodium, SUM(Diet_low_in_whole_grains) Low_Whole_grains, SUM(Diet_low_in_fruits) Low_Fruits,SUM(Diet_low_in_nuts_and_seeds) Low_Nuts_Seeds, 
SUM(Diet_low_in_vegetables) Low_Vegetables, SUM(High_fasting_plasma_glucose) High_Fasting_Plasma_Glucose, SUM("High_body-mass_index") High_BMI,SUM(Low_bone_mineral_density) Low_Bone_Mineral, 
SUM(Vitamin_A_deficiency) Vit_A_Deficiency, SUM(Iron_deficiency) Iron_def
from portfolio.deathsbyrf_fixed
where entity_type = 'Country';

-- The total deaths with nutrition as a risk factor per year
select yr, SUM(Diet_high_in_sodium) high_sodium, SUM(Diet_low_in_whole_grains) Low_Whole_grains, SUM(Diet_low_in_fruits) Low_Fruits,SUM(Diet_low_in_nuts_and_seeds) Low_Nuts_Seeds, 
SUM(Diet_low_in_vegetables) Low_Vegetables, SUM(High_fasting_plasma_glucose) High_Fasting_Plasma_Glucose, SUM("High_body-mass_index") High_BMI,SUM(Low_bone_mineral_density) Low_Bone_Mineral, 
SUM(Vitamin_A_deficiency) Vit_A_Deficiency, SUM(Iron_deficiency) Iron_def
from portfolio.deathsbyrf_fixed
where entity_type = 'Country'
group by yr
order by yr;

-- The total deaths of countries with nutrition as a risk factor per year
select entity, yr, SUM(Diet_high_in_sodium) high_sodium, SUM(Diet_low_in_whole_grains) Low_Whole_grains, SUM(Diet_low_in_fruits) Low_Fruits,SUM(Diet_low_in_nuts_and_seeds) Low_Nuts_Seeds, 
SUM(Diet_low_in_vegetables) Low_Vegetables, SUM(High_fasting_plasma_glucose) High_Fasting_Plasma_Glucose, SUM("High_body-mass_index") High_BMI,SUM(Low_bone_mineral_density) Low_Bone_Mineral, 
SUM(Vitamin_A_deficiency) Vit_A_Deficiency, SUM(Iron_deficiency) Iron_def
from portfolio.deathsbyrf_fixed
where entity_type = 'Country'
group by entity, yr
order by entity, yr;

-- The total deaths with nutrition as a risk factor per continent

select continent, SUM(Diet_high_in_sodium) high_sodium, SUM(Diet_low_in_whole_grains) Low_Whole_grains, SUM(Diet_low_in_fruits) Low_Fruits,SUM(Diet_low_in_nuts_and_seeds) Low_Nuts_Seeds, 
SUM(Diet_low_in_vegetables) Low_Vegetables, SUM(High_fasting_plasma_glucose) High_Fasting_Plasma_Glucose, SUM("High_body-mass_index") High_BMI,SUM(Low_bone_mineral_density) Low_Bone_Mineral, 
SUM(Vitamin_A_deficiency) Vit_A_Deficiency, SUM(Iron_deficiency) Iron_def
from portfolio.deathsbyrf_fixed
where entity_type = 'Country'
group by continent;

-- The total deaths per year with nutrition as a risk factor per continent

select continent, yr, SUM(Diet_high_in_sodium) high_sodium, SUM(Diet_low_in_whole_grains) Low_Whole_grains, SUM(Diet_low_in_fruits) Low_Fruits,SUM(Diet_low_in_nuts_and_seeds) Low_Nuts_Seeds, 
SUM(Diet_low_in_vegetables) Low_Vegetables, SUM(High_fasting_plasma_glucose) High_Fasting_Plasma_Glucose, SUM("High_body-mass_index") High_BMI,SUM(Low_bone_mineral_density) Low_Bone_Mineral, 
SUM(Vitamin_A_deficiency) Vit_A_Deficiency, SUM(Iron_deficiency) Iron_def
from portfolio.deathsbyrf_fixed
where entity_type = 'Country'
group by continent, yr
order by yr;


-- Total Deaths per population of each countries per year
select deathsbyrf_fixed.entity, continent, population.yr, population.population,(Diet_high_in_sodium:: float/population::float)*100 RF_High_Sodium, 
(Diet_low_in_whole_grains:: float/population::float)*100 RF_Low_Whole_Grain, (Diet_low_in_fruits:: float/population::float)*100 RF_Low_Fruits,
(Diet_low_in_nuts_and_seeds:: float/population::float)*100 RF_Low_Nuts_Seeds, (Diet_low_in_vegetables:: float/population::float)*100 RF_Low_Vegetables,
(High_fasting_plasma_glucose:: float/population::float)*100 RF_High_Fasting_Plasma_Glucose, ("High_body-mass_index":: float/population::float)*100 RF_High_BMI,
(Low_bone_mineral_density:: float/population::float)*100 RF_Low_Bone_Mineral, (Vitamin_A_deficiency:: float/population::float)*100 Vit_A_Deficiency,
(Iron_deficiency:: float/population::float)*100 Iron_def
from population 
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'

-- Most Death per Population Percentage per Countries on High Sodium as Risk Factor
select population.entity, population.yr, Diet_high_in_sodium,population.population,(Diet_high_in_sodium:: float/population::float)*100 RF_High_Sodium
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_High_Sodium DESC;

-- Most Death per Population Percentage per Countries on low in whole grains as Risk Factor
select population.entity, population.yr, Diet_low_in_whole_grains,population.population,(Diet_low_in_whole_grains:: float/population::float)*100 RF_Low_Whole_Grain
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_Low_Whole_Grain DESC;

-- Most Death per Population Percentage per Countries on low in Fruits as Risk Factor
select population.entity, population.yr, Diet_low_in_fruits,population.population,(Diet_low_in_fruits:: float/population::float)*100 RF_Low_Fruits
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_Low_Fruits DESC;

-- Most Death per Population Percentage per Countries on low in nuts and seeds as Risk Factor
select population.entity, population.yr, Diet_low_in_nuts_and_seeds,population.population,(Diet_low_in_nuts_and_seeds:: float/population::float)*100 RF_Low_Nuts_Seeds
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_Low_Nuts_Seeds DESC;

-- Most Death per Population Percentage per Countries on low in vegetables as Risk Factor
select population.entity, population.yr, Diet_low_in_vegetables,population.population,(Diet_low_in_vegetables:: float/population::float)*100 RF_Low_Vegetables
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_Low_Vegetables DESC;

-- Most Death per Population Percentage per Countries on low with High Fasting Plasma Glucose as Risk Factor
select population.entity, population.yr, High_fasting_plasma_glucose,population.population,(High_fasting_plasma_glucose:: float/population::float)*100 RF_High_Fasting_Plasma_Glucose
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_High_Fasting_Plasma_Glucose DESC;

-- Most Death per Population Percentage per Countries on with High Body Mass Index as Risk Factor
select population.entity, population.yr, "High_body-mass_index",population.population,("High_body-mass_index":: float/population::float)*100 RF_High_BMI
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_High_BMI DESC;

-- Most Death per Population Percentage per Countries with low bone mineral as Risk Factor
select population.entity, population.yr, Low_bone_mineral_density,population.population,(Low_bone_mineral_density:: float/population::float)*100 RF_Low_Bone_Mineral
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by RF_Low_Bone_Mineral DESC;

-- Most Death per Population Percentage per Countries with Vitamin A Deficiency as Risk Factor
select population.entity, population.yr, Vitamin_A_deficiency,population.population,(Vitamin_A_deficiency:: float/population::float)*100 Vit_A_Deficiency
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by Vit_A_Deficiency DESC;

-- Most Death per Population Percentage per Countries with Iron Deficiency as Risk Factor
select population.entity, population.yr, Diet_high_in_sodium,population.population,(Iron_deficiency:: float/population::float)*100 Iron_def
from population
join deathsbyrf_fixed on deathsbyrf_fixed.entity = population.entity
where population.yr = deathsbyrf_fixed.yr and entity_type = 'Country'
order by Iron_def DESC;