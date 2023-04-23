# refunc-openvscode-server

```
docker run --rm -ti --name vscode -p 3000:3000 \
-e AWS_DEFAULT_ENDPOINT=<refunc-aws-api-gw-address> \
-e AWS_ACCESS_KEY_ID=<namespace> \
-e AWS_SECRET_ACCESS_KEY=<secret> \
arvintian/refunc-openvscode-server
```