#!/bash
sudo apt update -y
sudo apt install zsh curl wget git build-essential ca-certificates git lsd fzf tmux libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev golang-go default-jdk fd-find locate nmap neovim gpg apt-transport-https gnupg lsb-release -y

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo usermod -aG docker dv4d3r

sudo chsh -s /bin/zsh dv4d3r

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

git clone https://github.com/erikw/tmux-powerline ~/.tmux-powerline

git clone https://github.com/pyenv/pyenv ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv

curl -so- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

mkdir -p ~/.ssh

git clone https://github.com/dV4d3R/dotfiles ~/dotfiles

mkdir -p ~/{Applications,tools,.config}
mkdir -p ~/.config/{fontconfig,kitty,lsd,nvim}
mkdir -p ~/Pictures/Wallpapers

cp ~/dotfiles/wallpaper.jpg ~/Pictures/Wallpapers/wallpaper.jpg

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.tmux-powerline/themes/default.sh ~/.tmux-powerline/themes/default.sh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.config/lsd/config.yaml ~/.config/lsd/config.yaml
ln -sf ~/dotfiles/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
ln -sf ~/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

cd ~/dotfiles && git remote set-url origin git@github.com:dV4d3R/dotfiles.git

rm -f ~/.bash_logout ~/.bashrc ~/.bash_profile ~/.profile ~/.zlogin ~/.mkshrc

sudo mkdir -p /usr/share/wordlists

sudo git clone https://github.com/danielmiessler/SecLists /usr/share/wordlists/SecLists

sudo tar -C /usr/share/wordlists -xzf /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt.tar.gz

sudo rm /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt.tar.gz

mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git