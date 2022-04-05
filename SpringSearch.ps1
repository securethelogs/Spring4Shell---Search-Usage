
   <# 
   Wrote to detect SpringFramework Usage: (Work in progress)
   @XStag0
   
   #>

   $loc = (Get-PSDrive -PSProvider FileSystem).Root

   Write-Host "[*] Checking For JAVA: "
   try { java.exe -version } catch { Write-Host "Java may not be installed" }
   Write-Output ""

   $j = (Get-ChildItem "C:\Program Files\Java\" -Include "*jdk*" -ErrorAction SilentlyContinue).Name

   if ($j){ Write-Host "[*]JDK Found: $j"} else { Write-Host "[*] JDK not found in default path"}

    Write-Output ""

    Write-Host "[*] Searching Files For .JAR and Mention of SpringFramework"
    Write-Output ""

   foreach ($x in (Get-ChildItem $loc -Include "*.xml", "*.js", "*.jsp", "*.jar", "*.class"  -Recurse -ErrorAction SilentlyContinue).FullName){

    if ($x.EndsWith(".jar")){ 
        
        Write-Host "[*] Jar File Found: $x"
    
    } else {

    if (Select-String -Path $x -Pattern "springframework"){

        Write-Host "[!] SpringFramework Mentioned Here: $x"
        
    }

    }

   }

   Write-Output ""

