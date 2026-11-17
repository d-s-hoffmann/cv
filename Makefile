# Build the CV with a pinned Typst version and pinned fonts.
#
#   make setup   download Typst and the fonts into .tools/ (needs curl, tar, sha256sum/shasum)
#   make build   (re)generate cv.pdf, always overwriting it; runs setup first if needed
#   make clean   remove the downloaded tools and fonts

TYPST_VERSION := 0.15.1
TYPST         := .tools/typst-$(TYPST_VERSION)/typst
FONT_DIR      := .tools/fonts
TYPST_FLAGS   := --font-path $(FONT_DIR) --ignore-system-fonts

PLATFORM := $(shell uname -s)-$(shell uname -m)
ifeq ($(PLATFORM),Linux-x86_64)
  TARGET := x86_64-unknown-linux-musl
  SHA256 := a6d077d0a95eed5a2eba715b2dae06be954f624ccbf85758a03f389ded33118c
else ifneq (,$(filter $(PLATFORM),Linux-aarch64 Linux-arm64))
  TARGET := aarch64-unknown-linux-musl
  SHA256 := 5aa8d74a3d906e60ea12a66ac2f37f8eef1b14cbad7182a745e393a10c23dcee
else ifeq ($(PLATFORM),Darwin-x86_64)
  TARGET := x86_64-apple-darwin
  SHA256 := 7f9fdd9584866245de9a79e0add8f9236fae6f40a8a45e2c4771ccc14db4e0fa
else ifeq ($(PLATFORM),Darwin-arm64)
  TARGET := aarch64-apple-darwin
  SHA256 := 48f62ed034aa3a7978309579ac6ca00045e2ef0da73114e8af27cfd8e74dc05a
endif

# Fonts: CMU Bright (OTF version of CM Bright, used by the LaTeX original) and
# Font Awesome 5 Free (header icons). Both SIL OFL. Each has a URL and SHA-256.
CMU := https://mirrors.ctan.org/fonts/cm-unicode/fonts/otf
FA5 := https://raw.githubusercontent.com/FortAwesome/Font-Awesome/5.15.4/otfs

URL_cmunbmr.otf := $(CMU)/cmunbmr.otf
SHA_cmunbmr.otf := 923dba8ac37ef2216735a7cb2cd4d191cb6d52d60723ffb86ccf011c769d20d4
URL_cmunbmo.otf := $(CMU)/cmunbmo.otf
SHA_cmunbmo.otf := 0bf5b10613096a07236dfc6fd4fae2932e138c1f740f3de006c2a079af285bfa
URL_cmunbsr.otf := $(CMU)/cmunbsr.otf
SHA_cmunbsr.otf := 14a5a0f2ae9dae931f52e49ea113c80c5312e304dcf7dce47ba589958eb02962
URL_cmunbtl.otf := $(CMU)/cmunbtl.otf
SHA_cmunbtl.otf := 7f3f8705440ccea2a598ac7a405746e6b3f6b0776bf31d1221f4dfd729b2320a
URL_fa5-solid.otf  := $(FA5)/Font%20Awesome%205%20Free-Solid-900.otf
SHA_fa5-solid.otf  := 3fd1f8e855a002e563bff4a88e7be224da1a3543648e742543dcb7c3c94aa8e2
URL_fa5-brands.otf := $(FA5)/Font%20Awesome%205%20Brands-Regular-400.otf
SHA_fa5-brands.otf := f0bb5e75cb2681d91b33efa24ee594df9829089830ca07b6ce8f90246af9d36e

FONTS := $(addprefix $(FONT_DIR)/,cmunbmr.otf cmunbmo.otf cmunbsr.otf cmunbtl.otf fa5-solid.otf fa5-brands.otf)

SHASUM := $(shell command -v sha256sum 2>/dev/null || echo shasum -a 256)

.PHONY: build setup clean

build: setup
	$(TYPST) compile $(TYPST_FLAGS) cv.typ cv.pdf

setup: $(TYPST) $(FONTS)
	@echo "Setup complete: typst $(TYPST_VERSION) and fonts in .tools/"

$(TYPST):
	@test -n "$(TARGET)" || { echo "Unsupported platform: $(PLATFORM)" >&2; exit 1; }
	mkdir -p $(@D)
	curl -fsSL -o $(@D)/typst.tar.xz \
	  https://github.com/typst/typst/releases/download/v$(TYPST_VERSION)/typst-$(TARGET).tar.xz
	echo "$(SHA256)  $(@D)/typst.tar.xz" | $(SHASUM) -c -
	tar -xJf $(@D)/typst.tar.xz -C $(@D) --strip-components=1 typst-$(TARGET)/typst
	rm $(@D)/typst.tar.xz
	$@ --version

$(FONT_DIR)/%:
	mkdir -p $(@D)
	curl -fsSL -o $@.tmp '$(URL_$*)'
	echo "$(SHA_$*)  $@.tmp" | $(SHASUM) -c -
	mv $@.tmp $@

clean:
	rm -rf .tools
