BLENDER_PATH?=~/Downloads/blender/blender

MODNAME=BasicSeaBlock
MODVERS=0.1.1

OUTPATH=./$(MODNAME)_$(MODVERS)
ZIPPATH=$(OUTPATH).zip

$(OUTPATH):
	mkdir -p $(OUTPATH)
	rsync -av ./src/static/* $(OUTPATH)/

.PHONY: clean $(OUTPATH) blender
.SECONDARY:

test:
	echo foo

clean:
	rm -rf $(OUTPATH)
	rm -rf ./sheets/
	rm -rf ./icons/
	rm -f .templated .install-graphics-icons .install-graphics-entity
	rm -f $(ZIPPATH)

deep-clean: clean
	rm -rf ./render/

$(OUTPATH)/%: ./src/template/% $(OUTPATH)
	sed -e s/MODNAME/$(MODNAME)/g -e  s/MODVERS/$(MODVERS)/g $< > $@

.templated: $(OUTPATH)/info.json
	touch .templated

./render/:
	mkdir -p render


# un-comment to speed up render for testing
# DEVSAMPLES=--samples 16

fm-anim-frames= -s 1 -e 32
fm-anim-options= -x 128 -y 128 --samples 128 $(DEVSAMPLES)

fm-direction-frames= -s 33 -e 36
fm-direction-options= -x 256 -y 256 --samples 256 $(DEVSAMPLES)

fm-shadow-frames= -s 37 -e 40
fm-shadow-options= -x 256 -y 256 --samples 16 $(DEVSAMPLES)

af-anim-frames= -s 1 -e 32
af-anim-options= -x 256 -y 256 --samples 128 $(DEVSAMPLES)

af-shadow-frames= -s 33 -e 36
af-shadow-options= -x 256 -y 256 --samples 16 $(DEVSAMPLES)

af-direction-frames= -s 37 -e 40
af-direction-options= -x 256 -y 256 --samples 128 $(DEVSAMPLES)

pf-anim-frames= -s 1 -e 20
pf-anim-options= -x 384 -y 384 --samples 512 $(DEVSAMPLES)

pf-direction-frames= -s 21 -e 24
pf-direction-options= -x 384 -y 384 --samples 512 $(DEVSAMPLES)

./render/%-shadow/.content ./render/%-anim/.content ./render/%-direction/.content: ./src/assets/models/%.blend
	mkdir -p $(dir $@)
	$(BLENDER_PATH) -b $< -o "$(dir $@)/##.png" $($(notdir $(abspath $@/..))-frames) -P 'src/build_scripts/size.py' -- $($(notdir $(abspath $@/..))-options)
	touch $@

fm-anim-sheet-width=8
fm-direction-sheet-width=4
fm-shadow-sheet-width=4

af-anim-sheet-width=8
af-direction-sheet-width=4
af-shadow-sheet-width=4

pf-anim-sheet-width=5
pf-direction-sheet-width=4

./sheets/%.png: ./render/%/.content
	mkdir -p ./sheets/
	./src/build_scripts/sheetify.py $($(basename $(notdir $@))-sheet-width) $@  $(dir $<)/*.png

pin-fm-direction='{"x":1.5, "y":3, "dx":8, "cx":2}'
pin-af-direction='{"x":1.5, "y":3, "dx":4, "cx":1}' '{"x":9.5, "y":3, "dx":4, "cx":2}'
pin-pf-direction='{"x":0.5, "y":5, "dx":16, "cx":2}'

./sheets/pin-%.png: ./sheets/%.png
	./src/build_scripts/pin.py $< ./src/assets/images/pipe_end.png $@ $($(basename $(notdir $@)))

./sheets/fm.png: sheets/fm-anim.png sheets/pin-fm-direction.png sheets/fm-shadow.png
	./src/build_scripts/compose.py ./sheets/fm.png 1024x1024 0x0:sheets/fm-anim.png 0x512:sheets/pin-fm-direction.png 0x768:sheets/fm-shadow.png

./sheets/af.png: sheets/pin-af-anim.png sheets/pin-af-direction.png sheets/af-shadow.png
	./src/build_scripts/compose.py ./sheets/af.png 2048x1280 0x0:sheets/pin-af-anim.png 0x1024:sheets/af-shadow.png 1024x1024:sheets/pin-af-direction.png

./sheets/pf.png: sheets/pf-anim.png sheets/pin-pf-direction.png
	./src/build_scripts/compose.py ./sheets/pf.png 1920x1920 0x0:sheets/pf-anim.png 0x1536:sheets/pin-pf-direction.png

./icons/pf.png: ./src/assets/models/pf.blend
	rm -f ./icons/pf.png
	mkdir -p ./icons/
	$(BLENDER_PATH) -b './src/assets/models/pf.blend' -o './icons/pf.png' -P './src/build_scripts/size.py' -f 24 -- -x 32 -y 32 --samples 32 --obj-prop Camera.data.ortho_scale=1.1 --no-anim
	mv ./icons/pf.png* ./icons/pf.png

./icons/af.png: ./src/assets/models/pf.blend
	rm -f ./icons/af.png
	mkdir -p ./icons/
	$(BLENDER_PATH) -b './src/assets/models/af.blend' -o './icons/af.png' -P './src/build_scripts/size.py' -f 1 -- \
		-x 32 -y 32 --samples 256 \
		--obj-prop Camera.data.ortho_scale=1.2 \
		--obj-prop Lamp.data.cycles.cast_shadow=False \
		--scene-prop 'world.horizon_color=(0.5,0.5,0.5)' \
		--no-anim
	mv ./icons/af.png* ./icons/af.png

./icons/fm.png: ./src/assets/models/fm.blend
	rm -f ./icons/fm.png
	mkdir -p ./icons/
	$(BLENDER_PATH) -b './src/assets/models/fm.blend' -o './icons/fm.png' -P './src/build_scripts/size.py' -f 34 -- \
		-x 32 -y 32 --samples 256 --obj-prop Camera.data.ortho_scale=1.0 --no-anim
	mv ./icons/fm.png* ./icons/fm.png

./icons/filter.png: ./src/assets/models/filter-icon.blend
	rm -f ./icons/filter.png
	mkdir -p icons
	$(BLENDER_PATH) -b './src/assets/models/filter-icon.blend' -o './icons/filter.png' -P './src/build_scripts/size.py' -f 1 -- \
		-x 32 -y 32 --samples 128 --no-anim
	mv ./icons/filter.png* ./icons/filter.png

./icons/filter-empty.png: ./src/assets/models/filter-icon.blend
	rm -f ./icons/filter-empty.png
	mkdir -p icons
	$(BLENDER_PATH) -b './src/assets/models/filter-icon.blend' -o './icons/filter-empty.png' -P './src/build_scripts/size.py' -f 2 -- \
		-x 32 -y 32 --samples 128 --no-anim
	mv ./icons/filter-empty.png* ./icons/filter-empty.png

./icons/%-border.png: ./icons/%.png
	./src/build_scripts/dark_border.py $< $@

render_list=fm-anim fm-direction fm-shadow af-anim af-shadow af-direction pf-anim pf-direction
render_files=$(addsuffix /.content,$(addprefix ./render/,$(render_list)))
sheet_list=fm af pf
sheet_files=$(addsuffix .png,$(addprefix ./sheets/,$(sheet_list)))
icon_list=af-border fm-border pf-border filter filter-empty
icon_files=$(addsuffix .png,$(addprefix ./icons/,$(icon_list)))

ICONPATH=$(OUTPATH)/graphics/icons/
.install-graphics-icons: $(OUTPATH) $(icon_files)
	mkdir -p $(ICONPATH)
	cp -t $(ICONPATH) $(icon_files)
	touch .install-graphics-icons

ENTITYPATH=$(OUTPATH)/graphics/entity/
.install-graphics-entity: $(OUTPATH) $(sheet_files)
	mkdir -p $(ENTITYPATH)
	cp -t $(ENTITYPATH) $(sheet_files)
	touch .install-graphics-entity
	rm -f $(ENTITYPATH)/sr-*
	./src/build_scripts/shrink.py sr- 2 $(ENTITYPATH)/*

$(ZIPPATH): $(OUTPATH) .templated .install-graphics-icons .install-graphics-entity
	zip -r $(ZIPPATH) $(OUTPATH)

mod: $(ZIPPATH)

blender:
	$(BLENDER_PATH)
