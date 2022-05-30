Region.create(name: 'Greater Accra', description: 'This is the first region I created', active_status: true,
              del_status: false)

CityTown.create(name: 'Accra', description: 'This is the first city I created', active_status: true,
                del_status: false, region_code: Region.first.assigned_code)

Suburb.create(name: 'Legon', description: 'This is the first suburb I created', active_status: true,
              del_status: false, city_town_code: CityTown.first.assigned_code)

Locality.create(name: 'Opkonglo', description: 'This is the first locality I created', active_status: true,
                del_status: false, suburb_code: Suburb.first.assigned_code)

Contact.create(first_name: 'John', last_name: 'Doe', description: 'This is my new friend', phone: '233204567890')
