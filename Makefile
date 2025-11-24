rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

BUILD_DIR = Build
MD_SOURCE = $(call rwildcard,Source,*.md)
TEX_FILE = $(BUILD_DIR)/bisc-manual.tex

$(TEX_FILE): $(MD_SOURCE)
	mkdir -p $(BUILD_DIR)
	pandoc $(MD_SOURCE) --from markdown --to latex --standalone --output $(TEX_FILE) --template Format/template-bisc-manual.tex

.PHONY: tex
tex: $(TEX_FILE)

.PHONY: pdf
pdf: $(TEX_FILE)
	export TEXINPUTS+=Format//: && pdflatex -output-directory $(BUILD_DIR) $(BUILD_DIR)/bisc-manual.tex

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)