#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# Generated On: 2014-11-26 1:42 PM
# Generated By: fxl028
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$form1 = New-Object System.Windows.Forms.Form
$checkBox1 = New-Object System.Windows.Forms.CheckBox
$button2 = New-Object System.Windows.Forms.Button
$button1 = New-Object System.Windows.Forms.Button
$label5 = New-Object System.Windows.Forms.Label
$label4 = New-Object System.Windows.Forms.Label
$label3 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$label1 = New-Object System.Windows.Forms.Label
$textBox5 = New-Object System.Windows.Forms.TextBox
$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox1 = New-Object System.Windows.Forms.TextBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$textBox5_KeyPress= 
{
#TODO: Place custom script here
    [System.Windows.Forms.KeyPressEventHandler]
    #Event Argument: $_ = [System.Windows.Forms.KeyPressEventArgs]
       If ($_.KeyChar -eq 13) {
          
          #Convert CoinDeskCADValue, CryptobecQBCValue & QBC input text to variables
          [decimal]$CoinDeskCADValue = $textBox1.Text
          [decimal]$CryptobecQBCValue = $textBox2.Text
          [decimal]$QBCCADValue = ($CoinDeskCADValue * $CryptobecQBCValue)
          [decimal]$QBCAmount = $textBox5.Text

          #calculates CAD$ and BTC value based on QBC input
          $textBox3.text = ($CryptobecQBCValue * $QBCAmount)
          $textBox4.text = ($QBCAmount * $QBCCADValue)
          $textbox5.Focus()

      }
}
$textBox4_KeyPress= 
{
#TODO: Place custom script here
    [System.Windows.Forms.KeyPressEventHandler]
    #Event Argument: $_ = [System.Windows.Forms.KeyPressEventArgs]
       If ($_.KeyChar -eq 13) {
          
          #Convert CoinDeskCADValue, CryptobecQBCValue & CAD input text to variables. Also calculate QBC value in $ based on BTC|QBC.
          [decimal]$CoinDeskCADValue = $textBox1.Text
          [decimal]$CryptobecQBCValue = $textBox2.Text
          [decimal]$QBCCADValue = ($CoinDeskCADValue * $CryptobecQBCValue)
          [decimal]$CADAmount = $textBox4.Text

          #calculates BTC and QBC value based on CAD$ input
          $textBox3.text = ($CADAmount / $CoinDeskCADValue)
          $textBox5.text = ($CADAmount / $QBCCADValue)
          $textbox4.Focus()

      }
}
$textBox3_KeyPress= 
{
#TODO: Place custom script here
    [System.Windows.Forms.KeyPressEventHandler]
    #Event Argument: $_ = [System.Windows.Forms.KeyPressEventArgs]
       If ($_.KeyChar -eq 13) {
          
          #Convert CoinDeskCADValue, CryptobecQBCValue & BTC input text to variables
          [decimal]$CoinDeskCADValue = $textBox1.Text
          [decimal]$CryptobecQBCValue = $textBox2.Text
          [decimal]$BTCAmount = $textBox3.Text

          #calculates CAD$ and QBC value based on BTC input
          $textBox4.text = ($BTCAmount * $CoinDeskCADValue)
          $textBox5.text = ($BTCAmount / $CryptobecQBCValue)
          $textbox3.Focus()

      }
}
$handler_checkBox1_CheckedChanged= 
{
#TODO: Place custom script here

#Check checkbox state
    
    ###old method. It works but lots of cutting and string formating necessary
    ##Submit Coindesk API request for CAD value and select the 'content' propety from the powershell object 
    #$CoinDeskCADWebRequest = (Invoke-WebRequest -Uri 'http://api.coindesk.com/v1/bpi/currentprice/CAD.json' | Select -ExpandProperty 'Content')
    ##Reemoving every "{" "}" and "," from the content and splitting everything in bettween (each "splits" goes into a new array)
    #$CoinDeskCADWebRequest = $CoinDeskCADWebRequest.split("{},");
    ##Get the value of the variable in the 4th before last array, and remove the 13 first string to clean it all up and end only with the CAD value in decimal.
    #$CoinDeskCADValue = $CoinDeskCADWebRequest[-4].Substring(13)
    #$textBox1.text = ($CoinDeskCADValue)
    
    if ($checkBox1.Checked -eq $true){
    
    [decimal]$CoinMarketCapCADBTCWebRequest = ((Invoke-WebRequest -Uri 'http://coinmarketcap-nexuist.rhcloud.com/api/btc' | ConvertFrom-Json | select -ExpandProperty Price | Select -Property cad).cad)
    $textBox1.text =($CoinMarketCapCADBTCWebRequest)
    $textBox1.enabled = ($False)

    [decimal]$CryptoBecQBCAskValue = ((Invoke-WebRequest -Uri 'http://exchange.cryptobec.com/api/v2/order_book.json?market=qbcbtc' | ConvertFrom-Json | select -ExpandProperty asks | Select -Property price)[0].price)
    $textBox2.text =($CryptoBecQBCAskValue)
    $textBox2.enabled = ($False)


    }
    Elseif ($checkBox1.Checked -eq $False){
    $textBox1.text =("425")
    $textBox1.enabled = ($True)

    $textBox2.text =("0.00000100")
    $textBox2.enabled = ($True)

    }
}
$handler_form1_Load= 
{
#TODO: Place custom script here
}
$button1_OnClick= 
{
#TODO: Place custom script here
}
$button2_OnClick= 
{
#TODO: Place custom script here
}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form1.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 575
$System_Drawing_Size.Width = 769
$form1.ClientSize = $System_Drawing_Size
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$form1.Name = "form1"
$form1.Text = "Calculatrice BTC | CAD$ | QBC"
$form1.add_Load($handler_form1_Load)


$checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 493
$System_Drawing_Point.Y = 227
$checkBox1.Location = $System_Drawing_Point
$checkBox1.Name = "checkBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$checkBox1.Size = $System_Drawing_Size
$checkBox1.TabIndex = 12
$checkBox1.Text = "Auto"
$checkBox1.UseVisualStyleBackColor = $True
$checkBox1.add_CheckedChanged($handler_checkBox1_CheckedChanged) 

$form1.Controls.Add($checkBox1)


$button2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 441
$System_Drawing_Point.Y = 347
$button2.Location = $System_Drawing_Point
$button2.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$button2.Size = $System_Drawing_Size
$button2.TabIndex = 11
$button2.Text = "Fermer"
$button2.UseVisualStyleBackColor = $True
$button2.Enabled = $false
$button2.add_Click($button2_OnClick)

$form1.Controls.Add($button2)


$button1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 334
$System_Drawing_Point.Y = 347
$button1.Location = $System_Drawing_Point
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$button1.Size = $System_Drawing_Size
$button1.TabIndex = 10
$button1.Text = "Calculer"
$button1.UseVisualStyleBackColor = $True
$button1.Enabled = $false
$button1.add_Click($button1_OnClick)

$form1.Controls.Add($button1)

$label5.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 441
$System_Drawing_Point.Y = 259
$label5.Location = $System_Drawing_Point
$label5.Name = "label5"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label5.Size = $System_Drawing_Size
$label5.TabIndex = 9
$label5.Text = "QBC"

$form1.Controls.Add($label5)

$label4.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 335
$System_Drawing_Point.Y = 259
$label4.Location = $System_Drawing_Point
$label4.Name = "label4"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label4.Size = $System_Drawing_Size
$label4.TabIndex = 8
$label4.Text = "$ CAD"
$label4.add_Click($handler_label4_Click)

$form1.Controls.Add($label4)

$label3.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 228
$System_Drawing_Point.Y = 259
$label3.Location = $System_Drawing_Point
$label3.Name = "label3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label3.Size = $System_Drawing_Size
$label3.TabIndex = 7
$label3.Text = "BTC"

$form1.Controls.Add($label3)

$label2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 386
$System_Drawing_Point.Y = 203
$label2.Location = $System_Drawing_Point
$label2.Name = "label2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 113
$label2.Size = $System_Drawing_Size
$label2.TabIndex = 6
$label2.Text = "Cryptobec`nValeur QBC | BTC"

$form1.Controls.Add($label2)

$label1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 280
$System_Drawing_Point.Y = 203
$label1.Location = $System_Drawing_Point
$label1.Name = "label1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 111
$label1.Size = $System_Drawing_Size
$label1.TabIndex = 5
$label1.Text = "CoinMarketCap`nValeur CAD$ | BTC"
$label1.add_Click($handler_label1_Click)

$form1.Controls.Add($label1)

$textBox5.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 441
$System_Drawing_Point.Y = 285
$textBox5.Location = $System_Drawing_Point
$textBox5.Name = "textBox5"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 100
$textBox5.Size = $System_Drawing_Size
$textBox5.TabIndex = 4
$textBox5.add_KeyPress($textBox5_KeyPress)

$form1.Controls.Add($textBox5)

$textBox4.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 334
$System_Drawing_Point.Y = 286
$textBox4.Location = $System_Drawing_Point
$textBox4.Name = "textBox4"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 100
$textBox4.Size = $System_Drawing_Size
$textBox4.TabIndex = 3
$textBox4.add_KeyPress($textBox4_KeyPress)

$form1.Controls.Add($textBox4)

$textBox3.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 228
$System_Drawing_Point.Y = 286
$textBox3.Location = $System_Drawing_Point
$textBox3.Name = "textBox3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 100
$textBox3.Size = $System_Drawing_Size
$textBox3.TabIndex = 2
$textBox3.add_KeyPress($textBox3_KeyPress)

$form1.Controls.Add($textBox3)

$textBox2.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 386
$System_Drawing_Point.Y = 229
$textBox2.Location = $System_Drawing_Point
$textBox2.Name = "textBox2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 100
$textBox2.Size = $System_Drawing_Size
$textBox2.TabIndex = 1
$textBox2.Text = "0.00000100"

$form1.Controls.Add($textBox2)

$textBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 280
$System_Drawing_Point.Y = 229
$textBox1.Location = $System_Drawing_Point
$textBox1.Name = "textBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 100
$textBox1.Size = $System_Drawing_Size
$textBox1.TabIndex = 0
$textBox1.Text = "425"

$form1.Controls.Add($textBox1)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null

} #End Function

#Call the Function
Clear-Host
GenerateForm