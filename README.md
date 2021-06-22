# 仮想マシンの作成

以下の仮想マシンを展開

- SQL Server（SQL-SVR: SQL Server 2012 SP4 on Windows Server 2012 R2）
    - SQL Server 認証を有効化（Username: SqlUser / Password: Password.1!!）、通信は仮想ネットワーク内で有効
    -  `_setup` フォルダ配下の set-database.ps1 を実行（ContosoInsurance データベースをアタッチ）
    - Internet Explorer セキュリティ強化の構成（IE ESC）の無効化
    - C ドライブ直下に `_setup` フォルダを作成
    - タイムゾーンを Tokyo Standard Time に設定

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/kohei3110/Database-Migration-Hands-on-Lab/master/templates/vm-deploy.json)