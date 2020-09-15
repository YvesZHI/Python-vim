#!/bin/bash


set -e

./check.sh
res=$?
if [[ ${res} != 0 ]]; then
    exit ${res}
fi

echo "Your ~/.vim and ~/.vimrc will be completely deleted to generate the new ones."
while true; do
    read -r -p "Continue? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            break
            ;;
        [nN][oO]|[nN])
            echo 'Abort.'
            exit 1
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done


rm -rf ~/.vim ~/.vimrc
mkdir ~/.vim 2>/dev/null

cp ./banner.txt ~/.vim/
cp ./type ~/.vim/.type
cp ./*.vim ~/.vim/
cp ./vimrc ~/.vim/vimrc
echo 'source ~/.vim/vimrc' > ~/.vimrc

grep -q vimp ~/.bashrc || cat vimp >> ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim --cmd 'let Python=1' --cmd 'let install=1' -E -c PluginInstall -c q -c q

git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
./install_YCM.sh

echo "Done."
