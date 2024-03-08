#requires -runasadministrator
# Made By freetbash freet-bash@qq.com

$env_dir = (Get-Location).Path;
Write-Output "ENV_DIR: $($env_dir)";

# define the vars
$vars = @{
    "JAVA_HOME" = "jdk\jdk18.0.2.1";
    "test"      = "test";
};
# start set vars for env
Write-Output "Set the Vars";
foreach ($Key in $vars.Keys) {
    $v = [System.Environment]::GetEnvironmentVariable($Key, "MACHINE");
    if ($v.Length -eq 0) {
        $data = (Join-Path $env_dir $vars[$Key]) + ';';
        [System.Environment]::SetEnvironmentVariable($Key, $data, "MACHINE");

        $item = "$($Key): $($data)";
        Write-Output "+ $($item)";
    }
}

#define app bins
$bins = @{
    adb     = "adb";
    busybox = "busybox";
    git     = "git\bin";
    jdk     = "jdk\jdk18.0.2.1\bin";
    conda   = "miniconda3\condabin";
    php     = "php7.1.6";
    gcc     = "tdmgcc\bin";
    vim     = "vim91";
    msys2_i = "msys2\mingw64\include";
    msys2_b = "msys2\mingw64\bin";
    msys2_l = "msys2\mingw64\lib";
};
# start to set path for apps
Write-Output "" "Set the PATH"

$PATH = [System.Environment]::GetEnvironmentVariable("PATH", "MACHINE");
foreach ($Key in $bins.Keys) {
    $data = (Join-Path $env_dir $bins[$Key]) + ';';
    if (!$PATH.Contains($data)) {
        $PATH = $PATH + $data;
        Write-Output "+ $($data)";
    }
}

[System.Environment]::SetEnvironmentVariable("PATH", $PATH, "MACHINE");
