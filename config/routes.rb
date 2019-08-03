# frozen_string_literal: true

Rails.application.routes.draw do
  mount SwaggerUiEngine::Engine, at: '/'
end
