## The purpose of this script is to simplify creating directories when inputting logs in the Tech Support Teams Drive Folder
## and to access other workflow products, such as FileZilla and File Explorer.

# loop to check for invalid input in the initial screen
$menu = 1

cls

do
{
    Write-Host
    Write-Host "Questions/Comments/Improvements? E-mail justin.maatubang@hologic.com"
    Write-Host	
    Write-Host "This script was last updated on 5/17/2016."
    Write-Host
    Write-Host "1) Create an Instrument Log Directory (requires FileZilla)"
	Write-Host "2) Create/Open a Log Directory on the Teams Drive"
	Write-Host "3) Open FileZilla for a Specific Instrument"
	Write-Host "4) Exit Script"
    Write-Host 
	$usersel = Read-Host "Which script would you like to run (1-4)?"

	###Script Number 1, combination of all
	if ($usersel -eq 1)
	{
        Write-Host
        do
        {
            Write-Host "What instrument? (Pa)nther, (Ti)gris, or (T)om(c)at?"
            $usersel = Read-Host

            #if a Panther Instrument
            if ($usersel -eq "Pa")
            {
            
                #set base path
                $basepath = "T:\Technical Service\Panther.LK\Panther Logs"
             
                #serial number input with error checker
                
                do
                {
                    $ser_num_chk = 1
                    Write-Host "What is the instrument Serial Number (5 digits)?"
                    $ser_num = Read-Host
                    if ($ser_num.length -ne 5)
                    {
                        cls
                        Write-Host "Incorrect Serial Number."
                        Write-Host
                
                    }
                    elseif ($ser_num.length -eq 5)
                    {
                        $ser_num_chk = 0
                    }
                } while ($ser_num_chk -eq 1)

                #sr number input with error checker
                do
                {
                    $sr_num_chk = 1
                    Write-Host "What is the Service Request number (7 digits)?"
                    $sr_num = Read-Host
                    if ($sr_num.length -ne 7)
                    {
                        Write-Host "Incorrect SR Number."
                        Write-Host 
                    }
                    elseif ($sr_num.length -eq 7)
                    {
                        $sr_num_chk = 0
                    }
        } while ($sr_num_chk -eq 1)

                #change base path to include serial and SR numbers
                $basepath = ($basepath + "\" + $ser_num + "\" + $sr_num)

                #create directory
                New-item -path $basepath -type "Directory"

                #open in Windows Explorer
                Invoke-Item $basepath

                #copy path to clipboard
                $basepath | clip.exe
		
		        #assign arguments for calling FileZilla and the proper user/password
		        $arg0 = 'C:\Program Files (x86)\FileZilla FTP Client\filezilla.exe'
		        $arg1 = 'ftps://user' + $ser_num + ':pw' + $ser_num + '@eft.gen-probe.com'
				
		        #open FileZilla with the proper FTP
		        & $arg0 $arg1

                #set menu checker to 0 to exit script
                $main_menu_chk = 0

                cls

                Write-Host "This action has been completed."
            }

            #if a Tigris instrument
            elseif ($usersel -eq "Ti")
            {
                #set base path
                $basepath = "T:\Technical Service\Tigris Logs"
             
                #serial number input with error checker
                do
                {
                    $ser_num_chk = 1
                    Write-Host "What is the instrument Serial Number (4 digits)?"
                    $ser_num = Read-Host
                    if ($ser_num.length -ne 4)
                    {
                        cls
                        Write-Host "Incorrect Serial Number."
                        Write-Host
                
                    }
                    elseif ($ser_num.length -eq 4)
                    {
                        $ser_num_chk = 0
                    }
                } while ($ser_num_chk -eq 1)

                #sr number input with error checker
                do
                {
                    $sr_num_chk = 1
                    Write-Host "What is the Service Request number (7 digits)?"
                    $sr_num = Read-Host
                    if ($sr_num.length -ne 7)
                    {
                        Write-Host "Incorrect SR Number."
                        Write-Host 

                    }
                    elseif ($sr_num.length -eq 7)
                    {
                        $sr_num_chk = 0
                    }
                } while ($sr_num_chk -eq 1)

                #change base path to include serial and SR numbers
                $basepath = ($basepath + "\" + $ser_num + "\" + $sr_num)

                #create directory
                New-item -path $basepath -type "Directory"

                #open in Windows Explorer
                Invoke-Item $basepath

                #copy path to clipboard
                $basepath | clip.exe
		
		        #assign arguments for calling FileZilla and the proper user/password
		        $arg0 = 'C:\Program Files (x86)\FileZilla FTP Client\filezilla.exe'
		        $arg1 = 'ftps://user' + $ser_num + ':pw' + $ser_num + '@eft.gen-probe.com'
				
		        #open FileZilla with the proper FTP
		        & $arg0 $arg1

                #set menu checker to 0 to exit script
                $main_menu_chk = 0

                cls

                Write-Host "This action has been completed."
            }

            #if a Tomcat instrument
            elseif ($usersel -eq "Tc")
            {
                #set base path
                $basepath = "T:\Technical Service\Tomcat Logs"
             
                #serial number input with error checker
                do
                {
                    $ser_num_chk = 1
                    Write-Host "What is the instrument Serial Number (6 digits)?"
                    $ser_num = Read-Host
                    if ($ser_num.length -ne 6)
                    {
                        cls
                        Write-Host "Incorrect Serial Number."
                        Write-Host
                
                    }
                    elseif ($ser_num.length -eq 6)
                    {
                        $ser_num_chk = 0
                    }
                } while ($ser_num_chk -eq 1)

                #sr number input with error checker
                do
                {
                    $sr_num_chk = 1
                    Write-Host "What is the Service Request number (7 digits)?"
                    $sr_num = Read-Host
                    if ($sr_num.length -ne 7)
                    {
                        Write-Host "Incorrect SR Number."
                    }
                    elseif ($sr_num.length -eq 7)
                    {
                        $sr_num_chk = 0
                    }
                } while ($sr_num_chk -eq 1)

                #change base path to include serial and SR numbers
                $basepath = ($basepath + "\" + "TC" + $ser_num + "\" + $sr_num)

                #create directory
                New-item -path $basepath -type "Directory"

                #open in Windows Explorer
                Invoke-Item $basepath

                #copy path to clipboard
                $basepath | clip.exe
		
		        #assign arguments for calling FileZilla and the proper user/password
		        $arg0 = 'C:\Program Files (x86)\FileZilla FTP Client\filezilla.exe'
		        $arg1 = 'ftps://user' + $ser_num + ':pw' + $ser_num + '@eft.gen-probe.com'
				
		        #open FileZilla with the proper FTP
		        & $arg0 $arg1

                #set menu checker to 0 to exit script
                $main_menu_chk = 0

                cls
                
                Write-Host "This action has been completed."
            }


            #if invalid input
            else
            {
                cls
                Write-Host "Invalid input!"
                Write-Host
                $main_menu_chk = 1
            }

        } while ($main_menu_chk -eq 1)

        cls
        Write-Host
        Write-Host "This action has been completed."
    }

	###Script Number 2, open directory in teams drive
	elseif ($usersel -eq 2)
	{
        Write-Host
        
        #"subroutine" for getting and checking serial number ($ser_num)
        do
        {
            #ask for serial number
            Write-Host "What is the instrument Serial Number?"
            Write-Host "(5 Digits for Panther, 4 Digits for Tigris, 6 Digits for Tomcat)"
            $ser_num = Read-Host

            #if serial number is panther and proper length
            if ($ser_num.length -eq 5)
            {
                $ser_num_chk = 0
            }
            
            #if serial number is tigris and proper length
            elseif ($ser_num.length -eq 4)
            {
                $ser_num_chk = 0
            }

            #if serial number is tomcat and proper length
            elseif ($ser_num.length -eq 6)
            {
                $ser_num_chk = 0
            }

            #if serial number is incorrect
            else
            {
                $ser_num_chk = 1
                cls
                clear
                Write-Host "Invalid input!"
            }	

        } while ($ser_num_chk -eq 1)

        #"subroutine" for getting and checking SR num ($sr_num)
        do
        {
            #ask for SR number
            Write-Host "What is the SR Number? (7 Digits)"
            $sr_num = Read-Host
               
            #if sr number is proper length
            if ($sr_num.length -eq 7)
            {
                $sr_num_chk = 0
            }
            
            #if sr number is not proper length
            else
            {
                $sr_num_chk = 1
                Write-Host "Invalid input!"
                Write-Host
            }

        } while ($sr_num_chk -eq 1)

        #if serial number is tigris
        if ($ser_num.length -eq 4)
        {
	        #establish basepath for tigris
            $basepath = "T:\Technical Service\Tigris Logs"
	
            #add tigris serial number input
	        $basepath = ($basepath + "\" + $ser_num + "\" + $sr_num)
	
            #create directory and open in windows explorer
	        New-item -path $basepath -type "Directory"
	        Invoke-Item $basepath

            #copy path to clipboard
            $basepath | clip.exe
        }

        #if serial number is panther
        elseif ($ser_num.length -eq 5)
        {
            #establish basepath for panther	        
            $basepath = "T:\Technical Service\Panther.LK\Panther Logs"
	
            #add panther serial number input
	        $basepath = ($basepath + "\" + $ser_num + "\" + $sr_num)
	
            #create directory and open in windows explorer
	        New-item -path $basepath -type "Directory"
	        Invoke-Item $basepath

            #copy path to clipboard
            $basepath | clip.exe
        }

        #if serial number is tomcat
        elseif ($ser_num.length -eq 6)
        {
	        #establish basepath for tomcat
            $basepath = "T:\Technical Service\Tomcat Logs"
	
            #add tomcat serial number input
	        $basepath = ($basepath + "\" + "TC" + $ser_num + "\" + $sr_num)
	
            #create directory and open in windows explorer
	        New-item -path $basepath -type "Directory"
	        Invoke-Item $basepath
            
            #copy path to clipboard
            $basepath | clip.exe
        }

        cls
        Write-Host 
        Write-Host "This action has been completed."
	}
	
	###Script Number 3, open filezilla with specified parameters
	elseif ($usersel -eq 3)
	{
        Write-Host
        
        #check input
        do
	    {
	        Write-Host "What is the instrument Serial Number?"
		    Write-Host "(5 Digits for Panther, 4 Digits for Tigris, 6 Digits for Tomcat)"
		    $ser_num = Read-Host

            #if serial number is proper length for panther
            if ($ser_num.length -eq 5)
            {
                $ser_num_chk = 0
            }
            #if serial number is proper length for tigris
            elseif ($ser_num.length -eq 4)
            {
                $ser_num_chk = 0
            }

            #if serial number is proper length for tomcat
            elseif ($ser_num.length -eq 6)
            {
                $ser_num_chk = 0
            }

            #if serial number is not proper length
            else
            {
                $ser_num_chk = 1
                cls
                clear
                Write-Host "Invalid input!"
            }		

        } while ($ser_num_chk -eq 1)

		#specify directory
		$arg0 = 'C:\Program Files (x86)\FileZilla FTP Client\filezilla.exe'
		
		#specify the filezilla software parameters
		$arg1 = 'ftps://user' + $ser_num + ':pw' + $ser_num + '@eft.gen-probe.com'
		
		#open FileZilla with the proper site and credentials
		& $arg0 $arg1
		
		clear
		Write-Host
		Write-Host "This action has been completed."
	}

	###Script Number 4, exit script
	elseif ($usersel -eq 4)
	{
        Write-Host		
        Read-Host "Press ENTER to exit."
		$menu = 0
	}

    ###Invalid Input
	else
	{
		clear
		cls
		Write-Host "Invalid input."
	}
	
} while ($menu -eq 1)

# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU978kNAVpOk8R/U+aopzrvv8m
# Ph2gggNCMIIDPjCCAiqgAwIBAgIQLqSMbiYHXqpC3jWgYXwsfDAJBgUrDgMCHQUA
# MCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdDAe
# Fw0xNjA0MDUxODQzNDlaFw0zOTEyMzEyMzU5NTlaMBoxGDAWBgNVBAMTD1Bvd2Vy
# U2hlbGwgVXNlcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALFjDq+U
# C7i00CZt8fOAR5RqBhz7pvlxPfA2lh64+SM3JIKtBn9F9Dc542CzU/DTG4bnO65c
# zuRbpZtDSq/v4QI364NlYkqwzQWOlp7XRtF77EJrkId7YBVNFOiTb9CfyVPfLsXw
# 3giGJXJGpUGu8InOoreRBUCdUDX1qcbZFr+J9+VSg8oxey8NkdJiXmHN5PvLPH+m
# yqooZBw8LhwZafNiTb+3s1H1ouqChQrcr0eFFKYrF3R60NUYHVwRQ+WPFJE75LMe
# 95fiifxVM75HaeLIJ5f+7eESPkwZcHIafSqZePdAOpDWH0l1gDY/HMcdmM2mBWYF
# EUmmuVROjk3zoAsCAwEAAaN2MHQwEwYDVR0lBAwwCgYIKwYBBQUHAwMwXQYDVR0B
# BFYwVIAQChSVNQr4QYpjUaWrnFN5DaEuMCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwg
# TG9jYWwgQ2VydGlmaWNhdGUgUm9vdIIQTQPKEFPjaaBFrFOY2ScyTzAJBgUrDgMC
# HQUAA4IBAQAAAkozlk05uGK3SKgVwfsKsfxgqcEnvIKhkgFRKst0FZYhadbKew7e
# MO1ZKN2FhJ1GDPoJeWp3wHV0zMm73vGTfrcY3Ye0Hf5J4w1mkhRe60Qh3cVXdAK9
# I/HiGuJ5poFQH1R4rL8CvmRBQojrwTTGOf+1KtcOa2H6LahMSquwBI7dyq69s4T6
# sZnGqSy+6h986NyYOwUBsflXGhczadrt95+ze2Yj5Aeo7hmFUOKJXEDagP+cTij/
# 3Vg7yunCqWvfaCyIhSrB/OI2WAPcqnR3G/n0mDPQGank5jCaMC4AEFI4yk13hmXM
# AwrchkqsD0SFuTHvZJgP/+MpmPGUfY0rMYIB4TCCAd0CAQEwQDAsMSowKAYDVQQD
# EyFQb3dlclNoZWxsIExvY2FsIENlcnRpZmljYXRlIFJvb3QCEC6kjG4mB16qQt41
# oGF8LHwwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJ
# KoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQB
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFMs7FmMwxMvKzKLPAhx40TIueh7fMA0GCSqG
# SIb3DQEBAQUABIIBAAsgcEvQ0o0okn8yQsVzfjp507q+0JAJwt1qdTUDjL87EkOq
# 1RVTUXokTkHG5+6PWQLt+GIEDGcnaCE+aDlx5mJZL7S/K281zUpLLejuANTVH5TI
# xphZj6wmDalrzLd+lYHjOsJlEbdesEiyPOU+ciqcT+bREXqSNo+QqYbzRab5pEwG
# gxjR0ZztkX+ic7m489hN1XiQ4YKa2XuVpsuSgDLcaAo0uef5+aqOLYwlVa1/o7xI
# zBIr/EosMa/uVEi9egbUoEnP0JIdiipX3laD9rVwMh1oe5DfEJOLwxPPhyqBuffV
# +HBQqQo1Ieyyf/tAfN2ArpTG6PHPI4snUuXrsxI=
# SIG # End signature block
