##########################################
#############  REGIONS ###################
##########################################

greater_accra_region = Region.create(name: 'Greater Accra', description: 'This is the first region I created', active_status: true,
                                     del_status: false)

upper_west_region = Region.create(name: 'Upper West', description: 'This is the second region created', active_status: true,
                                  del_status: false)

eastern_region = Region.create(name: 'Eastern', description: 'This is my second favorite', active_status: true,
                               del_status: false)

central_region = Region.create(name: 'Central', description: 'This is the where the fish is :0', active_status: true,
                               del_status: false)

########################################
############  CITIES ###################
########################################

accra_city = CityTown.create(name: 'Accra', description: 'This is the first city in greater accra', active_status: true,
                             del_status: false, region_code: greater_accra_region.assigned_code)

CityTown.create(name: 'Cape Cost', description: 'This is the first city central region', active_status: true,
                del_status: false, region_code: central_region.assigned_code)

CityTown.create(name: 'Koforidiua', description: 'This is the first city in eastern region', active_status: true,
                del_status: false, region_code: eastern_region.assigned_code)

CityTown.create(name: 'Sowutuom', description: 'This is the first city in eastern region', active_status: true,
                del_status: false, region_code: greater_accra_region.assigned_code)

##########################################
#############  SUBURBS ###################
##########################################

east_legon_suburb = Suburb.create(name: 'East Legon', description: 'This is the first suburb I created', active_status: true,
              del_status: false, city_town_code: accra_city.assigned_code)

north_legon_suburb = Suburb.create(name: 'North Legon', description: 'This is the first suburb I created', active_status: true,
              del_status: false, city_town_code: accra_city.assigned_code)

###############################################
###############  LOCALITIES ###################
###############################################

Locality.create(name: 'Opkonglo', description: 'This is the first locality I created', active_status: true,
                del_status: false, suburb_code: east_legon_suburb.assigned_code)

                
Locality.create(name: 'Shiashi', description: 'This is the second locality I created', active_status: true,
  del_status: false, suburb_code: east_legon_suburb.assigned_code)


Locality.create(name: 'Gated Estates', description: 'This is the third locality I created', active_status: true,
  del_status: false, suburb_code: north_legon_suburb.assigned_code)

###############################################
#################  CONTACTS ###################
###############################################

Contact.create(first_name: 'John', last_name: 'Doe', description: 'This is my new friend', phone: '1234567890',
               locality_code: Locality.first.assigned_code)

###############################################
####################  USERS ###################
###############################################

User.create(
  email: 'mail@mail.com',
  first_name: 'Luke',
  last_name: 'Graham',
  phone: '233123456789',
  password: 'test1234',
  active_status: true,
  del_status: false
)
