# Springboot-k8s
Springboot-k8s
* Install helm : `https://helm.sh/docs/intro/install/`
* Install prometheus and grafana: `https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/prometheus-exporter/install-prometheus-commands.md`
* Port Forwarding on Grafana : `kubectl port-forward deployment/prometheus-grafana 3000`
* Login & password Grafana : _admin prom-operator_
* Port Forwarding on Prometheus : `kubectl port-forward prometheus-prometheus-kube-prometheus-prometheus-0 9090`
