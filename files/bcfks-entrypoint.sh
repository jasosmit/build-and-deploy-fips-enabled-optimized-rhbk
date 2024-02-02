#!/bin/bash

keytool -importkeystore -srckeystore /certs/$SRCSTOREFILE.jks -srcstoretype JKS \
	-srcstorepass $SRCSTOREPASS -destkeystore /certs/$SRCSTOREFILE.bcfks \
	-deststorepass $DESTSTOREPASS -deststoretype BCFKS \
	-providerclass org.bouncycastle.jcajce.provider.BouncyCastleFipsProvider \
	-provider org.bouncycastle.jcajce.provider.BouncyCastleFipsProvider \
	-providerpath /opt/keycloak/providers/bc-fips-1.0.2.3.jar \
	-J-Djava.security.properties=/usr/lib/jvm/jre-17-openjdk/conf/security/java.security \
	-providername BCFIPS
