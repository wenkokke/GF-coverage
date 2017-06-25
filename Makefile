DATA_DIR            = data/
EUROPARL_URL				= http://www.statmt.org/europarl/v7/
EUROPARL_DIR        = $(join $(DATA_DIR), europarl/)
EUROPARL_LANGUAGES  = bg de es et fi fr it nl sv
EUROPARL_FILENAMES  = $(addsuffix -en.tgz, $(EUROPARL_LANGUAGES))
EUROPARL_FILES_TGZ  = $(addprefix $(EUROPARL_DIR), $(EUROPARL_FILENAMES))
EUROPARL_FILES_EN   = $(addprefix europarl-v7., $(addsuffix -en.en, $(EUROPARL_LANGUAGES)))
EUROPARL_FILES_FR   = $(addprefix europarl-v7., $(join $(addsuffix -en., $(EUROPARL_LANGUAGES)), $(EUROPARL_LANGUAGES)))
EUROPARL_FILES      = $(addprefix $(EUROPARL_DIR), $(EUROPARL_FILES_EN) $(EUROPARL_FILES_FR))
EUROPARL_URLS				= $(addprefix $(EUROPARL_URL), $(EUROPARL_FILENAMES))

default: $(EUROPARL_FILES)

.phony: europarl

europarl: $(EUROPARL_FILES)

$(EUROPARL_FILES_TGZ):
	wget -O $(addprefix $(EUROPARL_DIR), $(notdir $@)) \
	        $(addprefix $(EUROPARL_URL), $(notdir $@))

$(EUROPARL_FILES): $(EUROPARL_FILES_TGZ)
