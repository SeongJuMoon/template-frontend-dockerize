# 프론트엔드 도커 빌드

# TL;DR
```bash
docker build -t [images-name] .
docker push [images-name]
docker run -d -p 80:80 [name] [image]
```

# 제약사항
본 가이드 작성에 앞서 빌드 시 멀티스테이지 빌드로 컨테이너 이미지를 만들기 때문에 작업 공간에 docker-ce 18.03 버전 이상의 도커가 설치되어 있는지 확인합니다.

# 빌드
빌드는 /frontbuild 디렉토리 아래에 작성된 프론트엔드 소스코드를 빌드합니다. 현재 예제로 작성된 코드는 CRA(create-react-app) 샘플 코드이며 변경이 필요한 경우 적절한 영역을 변경하여 사용하시면 됩니다. 다만 build의 결과 파일이 /frontend/build 아래에 남아있어야 하며 `npm run build` 명령을 사용하여 소스코드의 빌드가 가능하여야 합니다. 빌드 시 도커의 멀티스테이지 빌드(multistage build)로 소스 코드와 컨테이너 이미지를 빌드합니다. `docker build -t [image-name] .` 명령으로 컨테이너 이미지를 빌드하실 수 있습니다.

# 실행
생성된 이미지를 기준으로 `docker run -d -p 80:80 --name [container-name] [image-name]` 명령을 이용하여 결과를 확인할 수 있습니다.

# 컨테이너 저장소로 푸시
`docker push [image-tag]`으로 저장소로 푸시할 수 있습니다 이때 [iamge-tag]의 형식은 repo-url:image-name:version 으로 작성하시면 됩니다.

# Contribute
이 외의 컨트리뷰트는 언제나 환영입니다. :)  
