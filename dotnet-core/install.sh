wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo apt install ./packages-microsoft-prod.deb

rm packages-microsoft-prod.deb

sudo apt update
sudo apt install apt-transport-https \
    dotnet-sdk-3.1
