# Install vundle before loading new vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mv .vimrc ~/
mv .bashrc ~/
mv .tmux.conf ~/
source ~/.bashrc
vim +PluginInstall +qall
sudo apt update
sudo apt install build-essential cmake3 cmake python3-dev pip3 shellcheck
sudo -H pip3 install pylint pylint-django django=1.11

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer

cd ..
rm -rf setup
