IMAGE_NAME="devops-fase1"
CONTAINER_NAME="devops-fase1-container"
PORT="5000"

echo "Iniciando deploy..."

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Parando container anterior..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

if [ "$(docker images -q $IMAGE_NAME)" ]; then
    echo "Removendo imagem anterior..."
    docker rmi $IMAGE_NAME
fi

echo "Baixando nova imagem..."
docker pull $IMAGE_NAME

echo "Subindo novo container..."
docker run -d \
    -p $PORT:$PORT \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    $IMAGE_NAME

sleep 8
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Deploy concluído com sucesso!"
    echo "Aplicação rodando em http://localhost:$PORT"
else
    echo "Falha no deploy. Container não está rodando."
    exit 1
fi
