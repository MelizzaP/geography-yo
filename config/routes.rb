Rails.application.routes.draw do
  
  scope '/v1' do
    scope '/states' do
      scope '/:state' do
        scope '/cities' do 
          get '/' => 'cities#show'
          get '/:city' => 'cities#index'
        end      
      end
    end
    scope '/users' do
      scope '/:user' do
        get '/visits' => 'city_users#index'
        post '/visits' => 'city_users#new'
      end
    end
  end
end
