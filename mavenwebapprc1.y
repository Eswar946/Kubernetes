apiVersion: v1
kind: ReplicationController
metadata: 
    name: mavenwebapp
    namespace: eswar-ns
spec:
    replicas: 1
    selector:
        app: mavenwebapp
    template:
      metadata:
         name: mavenwebapppod
         labels:
            app: mavenwebapp
      spec:
         containers:
         - name: mavenwebapp
           image: entertainmentt/maven-web-application:1
           ports:
           - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata: 
    name: mavenwebappsvc
    namespace: eswar-ns
spec:
    type: NodePort
    selector:
        app: mavenwebapp
    ports:
    - port: 8080
      targetPort: 8080
