#!/bin/bash

openssl pkcs12 -nokeys -in /certs/$CACHAINCERTFILE \
	-export -out /certs/$DESTSTOREFILE.p12  -passout pass:$DESTSTOREPASS

keytool -importkeystore -srckeystore /certs/$DESTSTOREFILE.p12 -srcstoretype PKCS12 \
	-destkeystore /certs/$DESTSTOREFILE.bcfks \
	-srcstorepass $DESTSTOREPASS \
	-deststorepass $DESTSTOREPASS -deststoretype BCFKS \
	-providerclass org.bouncycastle.jcajce.provider.BouncyCastleFipsProvider \
	-provider org.bouncycastle.jcajce.provider.BouncyCastleFipsProvider \
	-providerpath /opt/keycloak/providers/bc-fips-1.0.2.3.jar \
	-J-Djava.security.properties=/usr/lib/jvm/jre-17-openjdk/conf/security/java.security \
	-providername BCFIPS