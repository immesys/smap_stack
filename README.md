smap_stack
==========

### A set of scripts for deploying sMAP on Docker
## What is sMap?
An orbiting observatory that measures the amount of water in the top 5 cm (2 inches) of soil everywhere on Earth’s surface will soon be placed in a polar orbit around Earth. It is called SMAP. This is an acronym made from the name of the satellite. SMAP stands for Soil Moisture Active Passive. A detailed description can be found in the SMAP Handbook (PDF, 4.09 MB).

The topsoil layer is the one in which the food we eat grows and where other vegetation lives. Moisture in the soil indirectly affects us in a variety of ways. In the course of its observations, SMAP will also determine if the ground is frozen or thawed in colder areas of the world.

SMAP is designed to measure soil moisture over a three-year period, every 2-3 days. This permits changes, around the world, to be observed over time scales ranging from major storms to repeated measurements of changes over the seasons.

Everywhere on Earth not covered with water or not frozen, SMAP measures how much water is in the top layer of soil. It also distinguishes between ground that is frozen or thawed. Where the ground is not frozen, SMAP measures the amount of water found between the minerals, rocky material, and organic particles found in soil everywhere in the world (SMAP measures liquid water in the top layer of ground but is not able to measure the ice.)  

SMAP will produce global maps of soil moisture. Scientists will use these to help improve our understanding of how water and carbon (in its various forms) circulate. The water cycle involves more than the obvious processes cycling through the steps of evaporation from the oceans and land to condensation forming clouds that then drop rain or snow on the ground (precipitation), followed by the water flowing across the land before returning to the sea. For example, plants absorb water from the soil to grow, but they also “transpire” some of it straight back into the air. 

The carbon cycle has more branches than the water cycle. It refers to the transfer of carbon between and among Earth’s atmosphere (air), pedosphere (soil), lithosphere (rock), hydrosphere (surface water: ocean, lakes, and rivers), and the cryosphere (all forms and places where ice is found on Earth including sea ice, snow, glaciers, and permafrost). For example, carbon (in the form carbon dioxide) is found in the air, dissolved in water, and emitted from underground sources as well everything that breathes. Carbonate minerals are found on the sea floor and in mountains, as well as the famous White Cliffs of Dover. Petroleum and coal are carbon that is trapped underground until it is pumped up or mined. All of these forms of carbon can cycle in various ways among the ‘spheres.

Weather and climate studies will use SMAP data as well. The amount of water that evaporates from the land surface into the atmosphere depends on the soil moisture. Soil moisture information is key to understanding the flows of water and heat energy between the surface and atmosphere that impact weather and climate. Currently, we know little about soil moisture variability at either regional or global scales. Frequent and reliable soil moisture measurements from SMAP will help improve the predictive capability of weather and climate models.

## Why It Matters
There are several disciplines that will benefit from SMAP’s measurements. SMAP will help:
## Monitor Drought
Because SMAP monitors soil moisture and provides critical information for drought early warning. In fact, a deficit in the amount of moisture in the soil defines agricultural drought. SMAP's measurements will come into play because researchers forecast a threefold increase in drought frequency in many regions of the world by the end of the 21st Century. History shows that a sustained drought can result in crop failure, deaths of livestock, and ultimately deaths of people. There is an economic impact as well. It is estimated that the 2012 drought in the Midwest led to harvest failures costing an estimated $30 billion.

The National Drought Mitigation Center serves the U.S. by helping "people and institutions develop and implement measures to reduce societal vulnerability to drought, stressing preparedness and risk management rather than crisis management. 

## Predict Floods

SMAP’s high fidelity measurements of soil moisture will improve flood warnings by assessing how wet the soil is before a rainstorm. Floods are the #1 natural disaster in the United States and they account for 40% of all natural disasters worldwide. Flooding is the leading cause of weather-related deaths in the United States. The National Weather Service produces a variety of resources related to floods. Flash flood guidance is updated at least every 24 hours based on surface soil moisture. SMAP's direct measurements of soil moisture will be at higher resolution than the information presently used. Losses due to floods here average billions of dollars per year.

## Assist Crop Productivity

SMAP will provide information on soil moisture, which is critical for healthy plant growth, and will help improve crop yield forecasts and irrigation planning around the world. By indirectly monitoring global food production, SMAP will improve targeting of humanitarian food assistance. Studies estimate that climate change will increase the number of undernourished people worldwide in 2080 by 5-26%.

## Weather Forecasting

The amount of water available to evaporate from the land surfaces can be used by meteorologists to improve their forecasts of local and regional weather over spans of days to weeks. Forecasting the weather requires continuously observing the state of the atmosphere and including the level of moisture of the soil and water sources on the ground. Nearly 90% of the emergencies declared by the Federal Emergency Management Agency and approximately 70% of air traffic delays are caused by weather, at a cost of many billion per year. 

## Linking Water, Energy and Carbon Cycles

The water, energy and carbon exchanges between the land and the air are linked together through soil moisture. 
# Detailed monitoring of soil moisture provides a view of how our whole Earth system works. The health of Earth’s biosphere is dependent on the flow and storage of water, energy, and carbon. Our global climate and its future changes are dependent on how these major Earth cycles link and vary together. Global change is the major environmental challenge of our century, and its impacts can cause major shifts in how our societies will function in the future.

To build: 

    host$ git clone https://github.com/immesys/smap_stack.git smap_stack && cd smap_stack
    host$ docker build -t smap .

To deploy:

    host$ docker run -t -i smap /bin/bash
    container$ /srv/repo/config.sh
    <enter desired django root password>
    <type ctrl-p ctrl-q to disconnect from container>

