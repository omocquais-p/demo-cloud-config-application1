start-application:
	./mvnw spring-boot:run

start-application-int:
	 SPRING_PROFILES_ACTIVE=int  ./mvnw spring-boot:run

start-application-prod:
	 SPRING_PROFILES_ACTIVE=prod ./mvnw spring-boot:run

start-application-prod-alternative:
	 ./mvnw spring-boot:run -Dspring-boot.run.arguments="--spring.profiles.active=prod"

build-image:
	./mvnw spring-boot:build-image

generate-deployment:
	kubectl create deployment demo-config-client --image=demo-cloud-config-application1:0.0.1-SNAPSHOT --dry-run=client -o yaml > k8s/deploy.yaml

deploy-deployment:
	kubectl apply -n demo-config-ns -f k8s/deploy.yaml

check-deployment:
	kubectl get deployments -n demo-config-ns

delete-deployment:
	kubectl delete -n demo-config-ns -f k8s/deploy.yaml

generate-service:
	kubectl expose deployment demo-config-client -n demo-config-ns --port=8080 --target-port=8080 --dry-run=client -o yaml > k8s/service.yaml

deploy-service:
	kubectl apply -n demo-config-ns -f k8s/service.yaml

port-forward-service:
	kubectl -n demo-config-ns port-forward service/demo-config-client 8080:8080