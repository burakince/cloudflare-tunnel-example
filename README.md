# Cloudflare Tunnel Example

[Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/) example for home [Raspberry PI](https://www.raspberrypi.org/) cluster. Please use K3s Ansible script and install your home raspberry Pi cluster. This installation is not part of this example. Also, [Nima Mahmoudi's blog post](https://itnext.io/using-cloudflare-tunnels-to-securely-expose-kubernetes-services-26713fb5da0a), and [Cloudflare's offical K8s example](https://github.com/cloudflare/argo-tunnel-examples/tree/master/named-tunnel-k8s) could be helpful to develop your own solution. Unfortunatly, cloudflare currently doesn't support arm64 and arm architectures in theres [offical docker hub repository](https://hub.docker.com/r/cloudflare/cloudflared). I cross compiled [offical source code](https://github.com/cloudflare/cloudflared) and deployed them to my own [docker hub puclic repository](https://hub.docker.com/r/burakince/cloudflared/tags). Feel free to use them. Cheers.

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

```
helm upgrade --install \
  --namespace cloudflare \
  --create-namespace \
  cloudflare \
  ./charts/cloudflared
```
