# Variavéis
$resp = "";
$mensagemCommit = $args[0];

if($args.Count -eq 1)
{
    git status;
    git add -A;
    git status;

    $resp = read-host "Deseja efetuar o pullrequest? (S/N)";

    if($resp -eq "s" -or $resp -eq "S")
    {
      $mensagemCommit = $mensagemCommit + " #pullrequest";  
    }

    git commit -m $mensagemCommit;

    $resp = read-host "Deseja efetuar o push? (S/N)";

    if($resp -eq "s" -or $resp -eq "S")
    {
      git push;
    }
}elseif($args.Count -gt 1)
{
    echo "É necessário informar a mensagem entre aspas"
}else
{
    echo "É necessário informar uma mensagem para efetuar o commit";
}
 