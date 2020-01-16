class SubDomainConstraints
  RESTRICTED_SUBDOMAINS = %[www admin public].freeze
  def self.matches?(request)
    request.subdomain.present? && !RESTRICTED_SUBDOMAINS.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints subdomain: SubDomainConstraints do
    resources :projects
  end

  root 'users#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
