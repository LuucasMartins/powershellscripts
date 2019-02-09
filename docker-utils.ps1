
$containersStop = $false;
$containersDelete = $false;
$imagesDelete = $false;
$containersRestart = $false

echo 'iniciando';

foreach($arg in $args)
{

    if($arg -eq "-cs")
    {
        $containerStop = $true;
    }

    if($arg -eq "-crm")
    {
        $containerDelete = $true;
    }

    if($arg -eq "-irm")
    {
        $imagesDelete = $true;
    }

    if($arg -eq "rst")
    {
        $containersRestart = $true;
    }
}

if($containerStop -eq $true)
{
    echo 'Parando todos os containers';

    $list = @(docker container ls -a --format "{{.ID}}");

    foreach($item in $list){
        echo $item;
        docker container stop $item;
    }
}

if($containerDelete)
{
    echo 'Deletando todos os containers';
    $list = @(docker container ls -a --format "{{.ID}}");
    foreach($item in $list){ 
        docker container rm $item
    }
}

if($imagesDelete)
{
    echo 'Deletando todas as imagens';
    $list = @(docker images -a --format "{{.ID}}");
    foreach($item in $list){ 
        echo $item;
        docker rmi -f $item;
    }
}

if($containersRestart)
{
    echo 'Reiniciando todos os containers'
    $list = @(docker ps -a --format "{{.ID}}");
        foreach($item in $list){ 
        docker restart $item;
    }
}

echo 'processo finalizado'