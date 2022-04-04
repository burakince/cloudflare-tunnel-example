# Cloudflare Tunnel Example

[Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/) example for home [Raspberry PI](https://www.raspberrypi.org/) cluster. Please use the K3s Ansible script and install your home [Raspberry Pi](https://www.raspberrypi.org/) cluster. This installation is not part of this example. Also, [Nima Mahmoudi's blog post](https://itnext.io/using-cloudflare-tunnels-to-securely-expose-kubernetes-services-26713fb5da0a) and [Cloudflare's official K8s example](https://github.com/cloudflare/argo-tunnel-examples/tree/master/named-tunnel-k8s) could be helpful to develop your solution. Unfortunately, Cloudflare currently doesn't support arm64 and arm architectures in their [official docker hub repository](https://hub.docker.com/r/cloudflare/cloudflared). I cross-compiled the [official source code](https://github.com/cloudflare/cloudflared) and deployed them to [my docker hub public repository](https://hub.docker.com/r/burakince/cloudflared/tags). Feel free to use them. Cheers.

## Install Cloudflare CLI

```
brew update && brew install cloudflared
```

## Login to CLoudflare and Create a Tunnel

```
cloudflared tunnel login
```

```
cloudflared tunnel create pi-cluster
```

## Install cloudflare tunnel to your raspberry pi cluster by helm chart

Please run `./run.sh` command and it will deploy the solution to your target Kubernetes cluster.

or

Pelase copy your tunnel credential to files folder and run following command.

```
helm upgrade --install \
  --namespace cloudflare \
  --create-namespace \
  cloudflare \
  ./charts/cloudflared
```
