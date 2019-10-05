apiVersion: build.openshift.io/v1
kind: BuildConfig
metadata:
  name: springboot-app
spec:
  output:
    to:
      kind: ImageStreamTag
      name: 'springboot-app:latest'
  runPolicy: Serial
  source:
    git:
      ref: master
      uri: 'https://github.com/aredd23/SpringBoot-Demo.git'
    type: Docker
  strategy:
    dockerStrategy:
    type: Source
  triggers:
    - imageChange:
        lastTriggeredImageID: >-
          172.30.1.1:5000/openshift/wildfly@sha256:73b9d5578eac447606e708a635bc0661755866162673a4c6e6d1119248d3c2c8
      type: ImageChange
    - type: ConfigChange
    - generic:
        secret: a3bfa4a321ff17b9
      type: Generic
    - github:
        secret: 4ef027711e1c97fd
      type: GitHub
