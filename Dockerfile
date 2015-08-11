FROM fedora

RUN dnf -y install git make rpm-build python-setuptools

RUN git clone https://github.com/redhat-imaging/imagefactory

WORKDIR imagefactory

RUN make rpm && cd imagefactory_plugins/ && make rpm

RUN dnf -y install /root/rpmbuild/RPMS/noarch/imagefactory*.rpm


LABLE RUN "docker run --name imagefactory -it --rm --privileged -v /var/lib/imagefactory:/var/lib/imagefactory -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock if bash"
