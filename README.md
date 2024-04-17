# script_backup_MySQL 

Preencher o user, senha e banco que deseja realizar o backup.

# Dar as permissoes para o script ser executado. 
chmod +x bkp_diario.sh

# Programar no cron do servidor.
crontab -e
# Realizar backup bando de dados diariamente 2:00
0 2 * * * /caminho/ate/script/bkp_diario.sh

- Cria backup
- Registra log
- Exclui backups antigos