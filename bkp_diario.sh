#!/bin/bash

# Configurações do MySQL
DB_USER="User"
DB_PASS="Senha"
DB_NAME="Data Base"

# Data
DATE=$(date +%Y-%m-%d)

# Registrar log
log_message() {
    local log_message=$1
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $log_message" >> "backup.log"
}

# Excluir backups com mais de 3 dias
find -name "backup-*" -type f -mtime +3 -exec rm {} \;

# Fazer o backup do banco de dados
mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > backup-$DATE.sql

if [ $? -eq 0 ]; then
    log_message "Backup do banco de dados $DB_NAME realizado com sucesso em $DATE"
else
    log_message "Erro ao fazer backup do banco de dados $DB_NAME em $DATE"
fi
