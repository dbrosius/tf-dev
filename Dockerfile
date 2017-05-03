FROM tensorflow/tensorflow:1.1.0-devel-gpu

# Get vim set up
RUN apt-get update && \
    apt-get -y install vim python-opencv python-pil bear cmake

COPY vim.rc /root/.vimrc

RUN mkdir -p /root/.vim/bundle && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall && \
    cd /root/.vim/bundle/YouCompleteMe && \
    ./install.py --clang-completer

