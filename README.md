# CheckLink
Este script foi criado para executar vários downloads simultâneos e acompanhar o consumo de banda no link.

No arquivo url_download.txt colocamos todos os arquivos que devem ser baixados.
No arquivo link.sh, temos a parte principal com variáveis e execução de funções.

Se faz necessário a modificação de algumas variáveis antes da primeira execução:

# Local da instalação
LocalInstall=/opt/CheckLink
#Velocidade do seu link de internet (Colocar o M de Mega no final)
VelocidadeLink=100M
#Informar a sua interface de WAN
ETH_WAN=enp0s3
