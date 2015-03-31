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
  end 
end
