
PLUGIN_NAME=redmine_release_notes
PLUGIN_DIR=$(DESTDIR)/usr/share/redmine/vendor/plugins/$(PLUGIN_NAME)

CONF1=$(PLUGIN_DIR)/config/config.yml
CONF2=$(PLUGIN_DIR)/config/formats.yml

INSTALL_FILES=\
	app		\
	config		\
	COPYING		\
	db		\
	init.rb		\
	lib		\
	README.md

all:

install:
	@rm -Rf $(PLUGIN_DIR)
	@mkdir -p $(PLUGIN_DIR)
	@for i in $(INSTALL_FILES) ; do cp -R --preserve $$i $(PLUGIN_DIR) ; done
	@[ -f $(CONF1) ] || cp $(CONF1).example $(CONF1)
	@[ -f $(CONF2) ] || cp $(CONF2).example $(CONF2)
