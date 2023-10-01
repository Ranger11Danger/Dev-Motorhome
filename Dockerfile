FROM ubuntu

RUN apt update
ENV XDG_CONFIG_DIR=/root/.config
RUN apt install curl libxcursor-dev xterm cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 fd-find fzf zsh git fontconfig libfuse-dev ripgrep npm -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN /root/.cargo/bin/cargo install alacritty
RUN mkdir -p /root/.config/alacritty
RUN mkdir /root/.fonts
RUN mkdir /root/.config/nvim/
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY zshrc /root/.zshrc
COPY ./fonts/* /root/.fonts/
COPY alacritty.yml /root/.config/alacritty/
COPY nvim.appimage /usr/bin/vim
RUN git clone https://github.com/Ranger11Danger/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
RUN apt install unzip tmux -y
COPY install_lazygit.sh /root/install_lazygit.sh
RUN /root/install_lazygit.sh
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git config --global --add safe.directory /root/work
COPY tmux.conf /root/.tmux.conf
RUN fc-cache -fv
CMD /root/.cargo/bin/alacritty
