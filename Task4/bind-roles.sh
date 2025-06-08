#!/bin/bash

TEMP_ROLES_BINDIND_CONFIG=role-binding.yaml

cat <<EOF > $TEMP_ROLES_BINDIND_CONFIG
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: devops-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: devops
subjects:
- kind: User
  name: devops-misha
  apiGroup: rbac.authorization.k8s.io

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: operations-engineer-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: operations-engineer
subjects:
- kind: User
  name: operations-engineer-slava
  apiGroup: rbac.authorization.k8s.io

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: developer-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: developer
subjects:
- kind: User
  name: developer-petr
  apiGroup: rbac.authorization.k8s.io

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: security-auditor-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: security-auditor
subjects:
- kind: User
  name: security-auditor-sergei
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f TEMP_ROLES_BINDIND_CONFIG

rm TEMP_ROLES_BINDIND_CONFIG