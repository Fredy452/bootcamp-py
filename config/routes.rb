Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount Decidim::Core::Engine => '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# Agreagamos las rutas de nav a las rutas de decidim Admin
Decidim::Admin::Engine.routes.draw do
  constraints(->(request) { Decidim::Admin::OrganizationDashboardConstraint.new(request).matches? }) do
    resources :navs
  end
end
