#!/bin/bash
set -e

# Remover PID antigo do servidor
rm -f tmp/pids/server.pid

# Esperar o banco de dados estar pronto
until nc -z -v -w30 db 5432
do
  echo "Aguardando o banco de dados..."
  sleep 1
done

# Rodar as migrations e os seeds
bundle exec rails db:create db:migrate db:seed

# Iniciar o servidor
exec "$@"
