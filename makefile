COLOUR_RED:=$(shell tput -Txterm setaf 1)
COLOUR_GREEN:=$(shell tput -Txterm setaf 2)
COLOUR_YELLOW:=$(shell tput -Txterm setaf 3)
END_COLOUR:=$(shell tput -Txterm sgr0)

XDG_CONFIG_HOME?=${HOME}/.config
USER_BIN?=${HOME}/.local/bin
EMAIL?=$(shell bash -c 'read -p "Email (for git config): " email ; echo $$email')
FIREFOX_DIRECTORY?=$(shell find ${HOME}/.mozilla/firefox/ -maxdepth 1 -name "*.default-release" 2> /dev/null | head -1)

.PHONY: all clean

all: | /etc/profile.d/home-local-bin.sh git/config
	@echo "=> Installing ${COLOUR_YELLOW}bashrc${END_COLOUR} to target dir ${COLOUR_GREEN}${HOME}${END_COLOUR}"
	@[[ ! -f ${HOME}/.bashrc || -L ${HOME}/.bashrc ]] || mv -v ${HOME}/.bashrc ${HOME}/.bashrc.bak
ifeq ($(wildcard ${HOME}/.bashrc),)
	@ln -rsv bash/bashrc ${HOME}/.bashrc
else
	@echo "${COLOUR_YELLOW}WARNING${END_COLOUR}: ${COLOUR_RED}${HOME}/.bashrc${END_COLOUR} already exists as a symlink"
	@echo "Skipping installing ${COLOUR_YELLOW}${HOME}/.bashrc${END_COLOUR}"
endif

	@echo

	@echo "=> Installing ${COLOUR_YELLOW}configs${END_COLOUR} to target dir ${COLOUR_GREEN}${XDG_CONFIG_HOME}${END_COLOUR}"
	@stow -v --target=${XDG_CONFIG_HOME} --restow .

	@echo

	@echo "=> Installing ${COLOUR_YELLOW}firefox user settings${END_COLOUR} to target dir ${COLOUR_GREEN}${FIREFOX_DIRECTORY}${END_COLOUR}"
ifneq ($(wildcard $(FIREFOX_DIRECTORY)),)
	@stow -v --target=${FIREFOX_DIRECTORY} --ignore tridactyl --restow firefox
else
	@echo "${COLOUR_YELLOW}WARNING${END_COLOUR}: Can't find specified Firefox profile directory ${COLOUR_RED}${FIREFOX_DIRECTORY}${END_COLOUR}"
	@echo "Skipping installing ${COLOUR_YELLOW}firefox user settings${END_COLOUR}"
endif

	@echo

	@echo "=> Installing ${COLOUR_YELLOW}user scripts${END_COLOUR} to target dir ${COLOUR_GREEN}${USER_BIN}${END_COLOUR}"
	@mkdir -pv ${USER_BIN}
	@stow -v --target=${USER_BIN} --restow bin

/etc/profile.d/home-local-bin.sh:
	@echo "=> Installing ${COLOUR_GREEN}$@${END_COLOUR}"
	@echo -e 'case ":$${PATH}:" in\n\t*:"$${HOME}/.local/bin":*) ;;\n\t*) export PATH="$${HOME}/.local/bin:$${PATH}" ;;\nesac' | sudo tee $@ > /dev/null
	@echo "CREATE: $@"

	@echo

git/config:
	@echo "=> Generating ${COLOUR_GREEN}$@${END_COLOUR}"
	@echo -e "[user]\n\temail = ${EMAIL}\n\tname = ${USER}" > $@
	@cat git/config.template >> $@ && echo "CREATE: $@"

	@echo

clean:
	@echo "=> Uninstalling ${COLOUR_YELLOW}bashrc${END_COLOUR} to target dir ${COLOUR_GREEN}${HOME}${END_COLOUR}"
	@[[ ! -L ${HOME}/.bashrc ]] || rm -fv ${HOME}/.bashrc

	@echo

	@echo "=> Removing ${COLOUR_GREEN}git/config${END_COLOUR}"
	@rm -fv git/config

	@echo

	@echo "=> Uninstalling ${COLOUR_YELLOW}configs${END_COLOUR} from target dir ${COLOUR_GREEN}${XDG_CONFIG_HOME}${END_COLOUR}"
	@stow -vv --target=${XDG_CONFIG_HOME} --delete .

	@echo

	@echo "=> Uninstalling ${COLOUR_YELLOW}firefox user settings${END_COLOUR} to target dir ${COLOUR_GREEN}${FIREFOX_DIRECTORY}${END_COLOUR}"
ifneq ($(wildcard $(FIREFOX_DIRECTORY)),)
	@stow -v --target=${FIREFOX_DIRECTORY} --delete firefox
else
	@echo "${COLOUR_YELLOW}WARNING${END_COLOUR}: Can't find specified Firefox profile directory ${COLOUR_RED}${FIREFOX_DIRECTORY}${END_COLOUR}"
	@echo "Skipping uninstalling ${COLOUR_YELLOW}firefox user settings${END_COLOUR}"
endif

	@echo

	@echo "=> Uninstalling ${COLOUR_YELLOW}user scripts${END_COLOUR} from target dir ${COLOUR_GREEN}${USER_BIN}${END_COLOUR}"
	@stow -vv --target=${USER_BIN} --delete bin
