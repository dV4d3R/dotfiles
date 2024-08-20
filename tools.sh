go install -v github.com/ffuf/ffuf@latest
go install -v github.com/OJ/gobuster/v3@latest
go install -v github.com/lc/gau@latest
go install -v github.com/jpillora/chisel@latest
go install -v github.com/ropnop/kerbrute@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/projectdiscovery/katana/cmd/katana@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

sudo apt install apktool -y

wget https://github.com/yeswehack/PwnFox/releases/download/v1.0.3/PwnFox.jar && sudo mv PwnFox.jar /opt

wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.3/jython-standalone-2.7.3.jar && sudo mv jython-standalone-2.7.3.jar /opt

wget https://github.com/xnl-h4ck3r/GAP-Burp-Extension/releases/download/v5.4/GAP.py && sudo mv GAP.py /opt

pip install beautifulsoup4 html5lib urllib3

curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s $HOME/.local/bin

wget https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.deb && sudo dpkg -i jd-gui-1.6.6.deb && rm jd-gui-1.6.6.deb

sudo install -d -m 0755 /etc/apt/keyrings

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

sudo snap remove firefox

gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

sudo apt update -y && sudo apt install firefox-esr -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

mkdir ~/tools/bchecks

git clone https://github.com/yeswehack/BCheck-Burp-scripts ~/tools/bchecks/yeswehackBechecks
git clone https://github.com/NetSPIWillD/BChecks ~/tools/bchecks/netspiBechecks
git clone https://github.com/PortSwigger/BChecks ~/tools/bchecks/portswiggerBchecks

sudo apt update -y

sudo apt install code -y

nvm install --lts

pyenv install 3.12.5 2.7.18

pyenv global 3.12.5 2.7.18

pip install -U pip
pip install objection impacket hashid