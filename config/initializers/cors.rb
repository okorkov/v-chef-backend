# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://v-chef.web.app/', 'http://localhost:3001'
        resource '*',
        headers: :any,
        methods: [:get]
      end
    end

