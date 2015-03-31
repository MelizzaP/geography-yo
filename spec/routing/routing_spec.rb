require 'rails_helper'

RSpec.describe 'Routes' do
  it 'routes /v1/states/{state}/cities to cities#show' do
    expect(get: '/v1/states/AL/cities').to route_to(
      controller: 'cities',
      action: 'show',
      state: 'AL'
    )
  end
end