IMGDIR := img

IMGS := $(addprefix $(IMGDIR)/,assoq_qualif.pdf interface_1.pdf interface_2.pdf bicyclette.png bicyclette_schema_cyn_deux_ponct.png bicyclette_schema_cyn.png classasso.png template.png)

DOTS := $(addprefix $(IMGDIR)/,image-10.png\
		image-11.png\
		image-12.png\
		image-13.png\
		image-14.png\
		image-15.png\
		image-16.png\
		image-17.png\
		image-18.png\
		image-19.png\
		image-1.png\
		image-20.png\
		image-21.png\
		image-22.png\
		image-2.png\
		image-3.png\
		image-4.png\
		image-5.png\
		image-6.png\
		image-7.png\
		image-8.png\
		image-9.png)

MDS := 000_pre.md \
	   010_objectifs.md \
	   020_modele.md \
	   030_classdiagrams.md \
	   040_types_numeriques.md \
	   050_iterables.md \
	   060_progfonc.md \
	   065_flow_control_py.md \
	   070_activity_diags.md \
	   080_classes_py.md \
	   090_conseils.md \
	   999_post.md

# main target
cours_info.pdf : $(IMGS) $(DOTS) $(MDS)
	pandoc --smart --filter pandoc-citeproc -No $@ $(MDS)

# Pattern rules
%.pdf : %.md
	pandoc --smart --filter pandoc-citeproc -No $@ $<
	$(MAKE) clean

%.png : %.dot
	dot -Tpng $< > $@

$(IMGS): | $(IMGDIR)

$(IMGDIR):
	mkdir $(IMGDIR)

%:
	touch %@

.PHONY : clean
clean:
	rm -f image-[0-9]*.pdf
	rm -f image-[0-9]*.dot
	rm -f image-[0-9]*.png
	rm -f image-[0-9]*.eps
	rm -f image-[0-9]*.ditaa


