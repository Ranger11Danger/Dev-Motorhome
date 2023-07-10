# Dev-Motorhome

## What is this?

after spending some time in software development and IT in general I would often find myself in an environment where I had to work without normal internet access or I was behind a strict proxy. This makes setting up a dev environment difficult if not impossible, while this isnt the case for a lot of people it is for me and many others. For most it would make the most sense to just have an ansible playbook that you can run to setup your environment where ever you are but this obviously doesnt work without internet, how would you download dependencies or plugins. So my solution to this problem is Dev-Motorhome, This is an every changing docker image that can be taken any where and ran to provide my all in one dev environment.

## How does it work?

This docker image works by mounting the necessary X11 folders to give access to the desktop env and then launches and alacritty terminal thats actually inside the image, pretty cool. 

## What features does it have?

currently this is the first implementation so it doesnt have much but it has the following

- neovim
- lazy.nvim standard template with all plugins already loaded
- python3
- rust
- oh-my-zsh
- FiraCode NerdFont
- Alacritty

## How do I use it?
make sure you run 
`xhost +`
to allow the docker container to connect to x11

either pull the docker image or build from this repo

and then run

`docker run -d -t --rm -e DISPLAY=$DISPLAY --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/josh/ -v $(pwd):/root/work --net=host dev-motorhome >/dev/null`

I personally have this as an alias in zsh to spin up a dev environment quickly

`alias dev='docker run -d -t --rm -e DISPLAY=$DISPLAY --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/josh/ -v $(pwd):/root/work --net=host dev-motorhome >/dev/null'`
