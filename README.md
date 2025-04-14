# Modelisation BDD

Some exercise about modelisation and work about Database.

## All the entities and attributes :

- Travel Company :
  - company name
  - email
- Clients :
  - id client
  - name
  - first name
  - email
  - phone number
- Reservation :
  - id reservation
  - id client
  - id trip
  - state of reservation
  - date of reservation
- Payment :
  - id payment
  - id reservation
  - method of payment
  - price
- Trip :
  - id trip
  - destination
  - total price
  - max place
  - Company name
- Travel transport :
  - id transport
  - name of company
  - name of transport
  - type
  - number of place
  - id trip
- Host :
  - id host
  - host name
  - category
  - number of place
  - id trip
- Host address :
  - id host
  - country
  - city
  - street
  - street number
- Guides :
  - languages
  - name
  - id host

### Schema 


#### first try : 

![alt text](assets/screen.png)

#### MPD after some change : 

![alt text](assets/schema-mpd.png)
