HairSurvey::Application.routes.draw do
  resource :vote
  match "/update_total" => "votes#update_total"
  root :to => "votes#index"
end
