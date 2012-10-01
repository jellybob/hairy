HairSurvey::Application.routes.draw do
  resource :vote
  root :to => "votes#index"
end
