require 'rails_helper'

RSpec.describe 'Routes' do
  it 'routes /v1/states/{state}/cities to cities#show' do
    expect(get: '/v1/states/AL/cities').to route_to(
      controller: 'cities',
      action: 'show',
      state: 'AL'
    )
  end
  
  it 'routes /v1/states/{state}/cities/{city}?radius=100' do
    expect(get: '/v1/states/VA/cities/Yorktown?radius=100').to route_to(
      controller: 'cities',
      action: 'index',
      state: 'VA',
      city: 'Yorktown',
      radius: '100'
    )
  end
  
  it 'routes /v1/users/{user}/visits' do
    expect(post: '/v1/users/1/visits').to route_to(
      controller: 'city_users',
      action: 'new',
      user: '1'
    )
    
    expect(get: '/v1/users/1/visits').to route_to(
      controller: 'city_users',
      action: 'index',
      user: '1'
    ) 
  end
  
end