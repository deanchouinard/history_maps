# Local History Maps
Local history maps and descriptons.

## Data
* maps - defines a map
  * user_id
  * title
  * description

* markers - points of interest on the map
  * user_id
  * map_id
  * title
  * description
  * latitude
  * longitude

## API

## Hosting
For people to really use, this needs to have integrated hosting. User hits
the Publish button and it creates a static page that is then sent to a hosting
server.

Hosting server; per user; list of users maps. Can either look at list or go
directly to a map url.

User has a username that will be part of the path on hosting.

## Old

* locations - locations of interest
  * user_id
  * x, y coordinates
  * title
  * description

* map location relationship - locations to include in a map
* marker - combination of map and location; can use title and description
from the location, or customize it for a particular map
