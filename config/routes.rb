Rails.application.routes.draw do
  
  scope '/v1' do
    scope '/states' do
      scope '/:state' do 
        get '/cities' => 'cities#show'
      end
    end
  end 
end
