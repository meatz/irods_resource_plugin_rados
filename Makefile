SUBS = irados	

######################################################################
# Configuration should occur above this line

GCC = g++ -DRODS_SERVER -DZIP_EXEC_PATH=\"$(ZIP_EXEC_PATH)\" -DUNZIP_EXEC_PATH=\"$(UNZIP_EXEC_PATH)\"

.PHONY: ${SUBS} clean

default: ${SUBS}

${SUBS}:
	${MAKE} -C $@

clean:
	@-for dir in ${SUBS}; do \
	${MAKE} -C $$dir clean; \
	done

install:
	cp libirados.so /var/lib/irods/plugins/resources/libirados.so 
	chown irods: /var/lib/irods/plugins/resources/libirados.so
