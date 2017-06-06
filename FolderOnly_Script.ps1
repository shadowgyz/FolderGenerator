## The purpose of this script is to simplify creating directories when inputting logs in the Tech Support Teams Drive Folder

Set-ExecutionPolicy -ExecutionPolicy AllSigned

cls

    Write-Host "Last Update: 8/11/2016"
    Write-Host "Questions/Comments/Improvements? E-mail justin.maatubang@hologic.com"
    Write-Host	
	Write-Host "This script will either create or open a log directory on the Teams Drive."
    Write-Host "Press CTRL+C to exit the script at anytime."
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
        
        Write-Host

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
            $basepath = "T:\Technical Service\Tomcat.IH\Tomcat Logs"
	
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
        Write-Host "The directory has been copied into your clipboard -- press CTRL+V to paste."
        Write-Host
        Write-Host "Press the ENTER key to exit the script!"
        Read-Host
# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUsqmndklC948nz3LVsLX4bh7U
# prygggNCMIIDPjCCAiqgAwIBAgIQLqSMbiYHXqpC3jWgYXwsfDAJBgUrDgMCHQUA
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
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFFyDzBT/WHaOucwyK7B4yQNYp5YOMA0GCSqG
# SIb3DQEBAQUABIIBAB4kbOvklkCyk10lmfcDlQ5keAA9HY5CY2oHb5X082dOSWiF
# LLIAcnn2aXtU0+L/ltM1mgYQOMbNAPc14RfXgxRsOFcvfHdUQj330mj5CnJGvM7B
# HRvVo6KCK7kCU1IgXOFLoZqN4dnsuhYsYyKCxZZrL+wyGegjKPoQxy3oqCzpRKue
# cVMmunoUBlP4sq2YtUl9lcYY/4T770bhHbQ7z8+tLDwxhoaT0irgYAA3v1va3Ckj
# L9gtj9deUVqJgE32CjRUkOF/88TP4Qc5H6g3OSNDVH+PUe9h4XUIwKEesF65y4zH
# ch8JrqUfwdS7bpQjDatgcrYgwD5tdK+lUxxY+Ls=
# SIG # End signature block
