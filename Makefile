push:
	echo $$GITHUB_PAT | docker login ghcr.io -u $$GITHUB_USERNAME --password-stdin
	docker build -t blog .
	docker tag blog ghcr.io/$$GITHUB_USERNAME/blog:latest
	docker push ghcr.io/$$GITHUB_USERNAME/blog:latest