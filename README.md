# Core Setup
## Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Install PowerLevel
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
## Fonts
```bash
sudo apt-get install fonts-powerline
```
## Install Plugins
### syntax highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
### autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
### fzf
```bash
sudo apt install fzf
```
### Neovim
```bash
sudo apt install neovim
```
## Clone dotfiles:
```bash
git clone --bare https://github.com/TheMrClaus/dotfiles.git $HOME/.dot
```
## Set temporary git alias:
```bash
alias dot='git --git-dir=$HOME/.dot --work-tree=$HOME'
```
## Configure gitignore to prevet accidental commits:
```bash
echo "*" > ~/.gitignore
```
What the above command will do is add * to your gitignore, essentially making it ignore every file. So you need to use -f to add a file, making it more difficult to push sensitive info by mistake.
##Checkout dotfiles
```bash
dot checkout
```
