
sh $HOME/dotfiles/source/macos.sh

xcode-select --install

if test ! $(which brew); then
    /bin/bash -c \
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew upgrade

# Install Apps
brew bundle --file $HOME/dotfiles/dpm/Brewfile

# Install other versions of python
if [ -d "{$HOME}/.pyenv/versions/3.10.0" ]
then
    pyenv install 3.10.0
fi

# Set defauly python
pyenv global 3.10.0


# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# download syntax highlighting extension
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi


if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim  https://raw.github.com/junegunn/vim-plug/master/plug.vim

# create jupyter lab config file
jupyter lab --generate-config

# Symlinks
sh $HOME/dotfiles/setup.sh
