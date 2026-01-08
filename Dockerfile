FROM nginx:alpine

LABEL maintainer="BJ Adeyemo"
LABEL project="docker-image-cicd"

COPY app/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

