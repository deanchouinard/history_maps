# Local History Maps
Local history maps and descriptons.

## Data
* maps - defines a map
  * user_id
  * title
  * description

* locations - locations of interest
  * user_id
  * x, y coordinates
  * title
  * description

* map location relationship - locations to include in a map
* marker - combination of map and location; can use title and description
from the location, or customize it for a particular map
  * user_id
  * map_id
  * location_id
  * title
  * description

