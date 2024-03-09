provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my-kubernetes-dashboard" {

  name = "my-kubernetes-dashboard"

#  repository = "https://kubernetes.github.io/dashboard/"
   repository = "docker.io/shellz1010/myrepotest:spring-boot-app"
  chart      = "kubernetes-dashboard"
   namespace  = "default"

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "protocolHttp"
    value = "true"
  }

  set {
    name  = "service.externalPort"
    value = 80
  }

  set {
    name  = "replicaCount"
    value = 2
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = "true"
  }
}
