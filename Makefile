BACKEND_AGE := 3
BACKEND_VERSION := 1.2.0
FRONTEND_AGE := 2
FRONTEND_VERSION := 1.1.0
GLOBUS_GRIDFTP_AGE := 2
GLOBUS_GRIDFTP_VERSION := 1.1.0
GRIDHTTPS_AGE := 3
GRIDHTTPS_VERSION := 1.0.0
CLIENT_AGE := 5
CLIENT_VERSION := 1.0.0

SPEC_BACKEND_FILE := storm-backend-mp.spec
SPEC_FRONTEND_FILE := storm-frontend-mp.spec
SPEC_GLOBUS_GRIDFTP_FILE := storm-globus-griftp-mp.spec
SPEC_GRIDHTTPS_FILE := storm-gridhttps-mp.spec
SPEC_CLIENT_FILE := storm-srm-client-mp.spec

RPM_MAIN_DIR := $(PWD)/rpm-build-test
RPM_TMP_DIR := $(RPM_MAIN_DIR)/tmp
RPM_SOURCE := $(RPM_MAIN_DIR)/SOURCES
RPM_SPEC := $(RPM_MAIN_DIR)/SPECS
RPM_BUILD := $(RPM_MAIN_DIR)/BUILD
RPM_RPM := $(RPM_MAIN_DIR)/RPMS
RPM_SRPM := $(RPM_MAIN_DIR)/SRPMS
RPM_DIRS := $(RPM_MAIN_DIR) $(RPM_SOURCE) $(RPM_SPEC) $(RPM_BUILD) $(RPM_RPM) $(RPM_SRPM)

osdist=`cat /etc/redhat-release | awk -F "release " '{ print $$2 }' | awk -F "." '{ print $$1 }'`

all: be-rpm fe-rpm gftp-rpm ghttp-rpm client-rpm

be-rpm: be-srpm
	@rpmbuild  --rebuild --define "_topdir $(RPM_MAIN_DIR)" --define "dist .el$(osdist)"  $(RPM_SRPM)/emi-storm-backend-mp-$(BACKEND_VERSION)-$(BACKEND_AGE).src.rpm

be-srpm: rpm-path be-tar
	@cp -u emi-storm-backend-mp-$(BACKEND_VERSION).tar.gz $(RPM_SOURCE)
	@cp $(SPEC_BACKEND_FILE) $(RPM_SPEC)
	@rpmbuild  --define "_topdir $(RPM_MAIN_DIR)" --nodeps -bs $(RPM_SPEC)/$(SPEC_BACKEND_FILE)

be-tar:
	@mkdir -p emi-storm-backend-mp-$(BACKEND_VERSION)
	@tar -zcf emi-storm-backend-mp-$(BACKEND_VERSION).tar.gz emi-storm-backend-mp-$(BACKEND_VERSION)
	@rm -rf emi-storm-backend-mp-$(BACKEND_VERSION)

fe-rpm: fe-srpm
	@rpmbuild  --rebuild --define "_topdir $(RPM_MAIN_DIR)" --define "dist $(osdist)"  $(RPM_SRPM)/emi-storm-frontend-mp-$(FRONTEND_VERSION)-$(FRONTEND_AGE).src.rpm

fe-srpm: rpm-path fe-tar
	@cp -u emi-storm-frontend-mp-$(FRONTEND_VERSION).tar.gz $(RPM_SOURCE)
	@cp $(SPEC_FRONTEND_FILE) $(RPM_SPEC)
	@rpmbuild  --define "_topdir $(RPM_MAIN_DIR)" --nodeps -bs $(RPM_SPEC)/$(SPEC_FRONTEND_FILE)

fe-tar:
	@mkdir -p emi-storm-frontend-mp-$(FRONTEND_VERSION)
	@tar -zcf emi-storm-frontend-mp-$(FRONTEND_VERSION).tar.gz emi-storm-frontend-mp-$(FRONTEND_VERSION)
	@rm -rf emi-storm-frontend-mp-$(FRONTEND_VERSION)

gftp-rpm: gftp-srpm
	@rpmbuild  --rebuild --define "_topdir $(RPM_MAIN_DIR)" --define "dist $(osdist)"  $(RPM_SRPM)/emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION)-$(GLOBUS_GRIDFTP_AGE).src.rpm

gftp-srpm: rpm-path gftp-tar
	@cp -u emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION).tar.gz $(RPM_SOURCE)
	@cp $(SPEC_GLOBUS_GRIDFTP_FILE) $(RPM_SPEC)
	@rpmbuild  --define "_topdir $(RPM_MAIN_DIR)" --nodeps -bs $(RPM_SPEC)/$(SPEC_GLOBUS_GRIDFTP_FILE)

gftp-tar:
	@mkdir -p emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION)
	@tar -zcf emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION).tar.gz emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION)
	@rm -rf emi-storm-globus-gridftp-mp-$(GLOBUS_GRIDFTP_VERSION)

ghttp-rpm: ghttp-srpm
	@rpmbuild  --rebuild --define "_topdir $(RPM_MAIN_DIR)" --define "dist $(osdist)"  $(RPM_SRPM)/emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION)-$(GRIDHTTPS_AGE).src.rpm

ghttp-srpm: rpm-path ghttp-tar
	@cp -u emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION).tar.gz $(RPM_SOURCE)
	@cp $(SPEC_GRIDHTTPS_FILE) $(RPM_SPEC)
	@rpmbuild  --define "_topdir $(RPM_MAIN_DIR)" --nodeps -bs $(RPM_SPEC)/$(SPEC_GRIDHTTPS_FILE)

ghttp-tar:
	@mkdir -p emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION)
	@tar -zcf emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION).tar.gz emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION)
	@rm -rf emi-storm-gridhttps-mp-$(GRIDHTTPS_VERSION)

client-rpm: client-srpm
	@rpmbuild  --rebuild --define "_topdir $(RPM_MAIN_DIR)" --define "dist $(osdist)"  $(RPM_SRPM)/emi-storm-srm-client-mp-$(CLIENT_VERSION)-$(CLIENT_AGE).src.rpm

client-srpm: rpm-path client-tar
	@cp -u emi-storm-srm-client-mp-$(CLIENT_VERSION).tar.gz $(RPM_SOURCE)
	@cp $(SPEC_CLIENT_FILE) $(RPM_SPEC)
	@rpmbuild  --define "_topdir $(RPM_MAIN_DIR)" --nodeps -bs $(RPM_SPEC)/$(SPEC_CLIENT_FILE)

client-tar:
	@mkdir -p emi-storm-srm-client-mp-$(CLIENT_VERSION)
	@tar -zcf emi-storm-srm-client-mp-$(CLIENT_VERSION).tar.gz emi-storm-srm-client-mp-$(CLIENT_VERSION)
	@rm -rf emi-storm-srm-client-mp-$(CLIENT_VERSION)

rpm-path:
	@mkdir -p $(RPM_DIRS)
