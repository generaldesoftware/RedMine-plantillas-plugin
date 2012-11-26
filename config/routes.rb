# Default routes are no longer supported by Redmine
# Added default routel
get 'templatesg', :to => 'templatesg#index'
get 'templatesg/new', :to => 'templatesg#new'
get 'templates/new', :to => 'templates#new'
get 'templatesg/:id/edit', :to => 'templatesg#edit'
get 'templates/:id/edit', :to => 'templates#edit'
post 'templatesg/:id/:action', :to => 'templatesg'
post 'templatesg/new', :to => 'templatesg#new'
post 'templates/:id/:action', :to => 'templates'
post 'templates/new', :to => 'templates#new'



