apiVersion: apps/v1
kind: Deployment
metadata:
  name: minecraft
  namespace: minecraft
  labels:
    app: minecraft
spec:
  replicas: 1
  revisionHistoryLimit: 5
  selector:
    matchLabels:
      app: minecraft
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: minecraft
    spec:
      imagePullSecrets:
        - name: ecr-pull-secret
      containers:
        - name: minecraft
          image: "__IMAGE__"
          imagePullPolicy: Always
          ports:
            - name: minecraft
              containerPort: 25565
              protocol: TCP
          envFrom:
            - configMapRef:
                name: minecraft-config
          volumeMounts:
            - name: world-data
              mountPath: /data
          startupProbe:
            tcpSocket:
              port: 25565
            periodSeconds: 10
            failureThreshold: 30
          readinessProbe:
            tcpSocket:
              port: 25565
            initialDelaySeconds: 10
            periodSeconds: 10
            failureThreshold: 6
          livenessProbe:
            tcpSocket:
              port: 25565
            periodSeconds: 20
            failureThreshold: 3
          resources:
            requests:
              cpu: "500m"
              memory: "1800Mi"
            limits:
              cpu: "1500m"
              memory: "3Gi"
      volumes:
        - name: world-data
          persistentVolumeClaim:
            claimName: minecraft-pvc
