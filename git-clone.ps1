if($args.Count -eq 2)
{
    $projeto = $args[0];
    $branch = $args[1];
    
    echo "iniciando a clonagem do projeto";

    git clone git@bitbucket.org:transdatasmart/$projeto --recursive -b $branch;

    echo "finalizado processo";
}
elseif($args.Count -eq 1)
{
    $projeto = $args[0];

    echo "iniciando a clonagem do projeto";

    git clone git@bitbucket.org:transdatasmart/$projeto

    echo "finalizado processo";
}


