FROM ubuntu

RUN apt update
ENV XDG_CONFIG_DIR=/root/.config
RUN apt install curl libxcursor-dev xterm cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN /root/.cargo/bin/cargo install alacritty
RUN mkdir -p /root/.config/alacritty
RUN mkdir /root/.fonts
RUN mkdir /root/.config/nvim/
RUN apt install zsh git -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN apt install fontconfig libfuse-dev ripgrep -y
COPY zshrc /root/.zshrc
COPY ./fonts/* /root/.fonts/
COPY alacritty.yml /root/.config/alacritty/
COPY nvim /root/.config/nvim/
COPY nvim.appimage /usr/bin/vim
COPY share /root/.local/share
RUN fc-cache -fv
CMD /root/.cargo/bin/alacritty
