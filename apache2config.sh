cho "######### Nwgat.net Apache2 Configurator #########"
echo ""
echo "please enter your domain"
read domain
echo "please enter your email"
read email
mkdir /var/www/$domain
echo "<VirtualHost *:80>
        ServerAdmin $email
        ServerName $domain
        ServerAlias $domain
        Documentroot /var/www/$domain
</VirtualHost>" > /etc/apache2/sites-available/$domain
echo ""
echo "### $domain is now setup ###"
echo ""
