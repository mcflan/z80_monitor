
TARGETS=gerbers.zip
GERBDIR=gerbers
PROJECT=z80_monitor

FILES=B_Cu.gbl B_Mask.gbs B_SilkS.gbo Edge_Cuts.gm1 F_Cu.gtl \
		F_Mask.gts F_Paste.gtp F_SilkS.gto job.gbrjob NPTH.drl \
		NPTH-drl_map.ps PTH.drl PTH-drl_map.ps

GERBERS=$(patsubst %, $(GERBDIR)/$(PROJECT)-%, $(FILES))

all: $(TARGETS)

gerbers.zip: $(GERBERS)
	zip -r $@ $(GERBDIR)/


clean:
	rm $(TARGETS)
