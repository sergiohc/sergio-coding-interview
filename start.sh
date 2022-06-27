# Instala as Gems
bundle check || bundle install
# Verify database
bundle exec rails db:create db:migrate
# Roda nosso servidor
bundle exec puma -C config/puma.rb