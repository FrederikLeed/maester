# Import Active Directory Module (Ensure RSAT tools are installed)
#Import-Module ActiveDirectory

# Run pre-checks
BeforeDiscovery {
    $ForestFeatures = Get-WinADForestOptionalFeatures
}

# Check if AD Recycle Bin is enabled
Describe "Active Directory Security Features" -Tag "AD", "Security" {

    It "AD01: Recycle Bin should be enabled" {
        # Get Recycle Bin status
        $RecycleBinStatus = $ForestFeatures.'Recycle Bin Enabled'
        $RecycleBinStatus | Should -Be $true
    }

    It "AD02: LAPS should be enabled" {
        # Check if LAPS is enabled
        $LapsStatus = $ForestFeatures.'LAPS Enabled'
        $LapsStatus | Should -Be $true
    }

    It "AD03: Windows LAPS should be enabled" {
        # Verify Windows LAPS feature
        $WindowsLapsStatus = $ForestFeatures.'Windows LAPS Enabled'
        $WindowsLapsStatus | Should -Be $true
    }

    It "AD04: Privileged Access Management (PAM) should be enabled" {
        # Check if PAM is enabled
        $PamStatus = $ForestFeatures.'Privileged Access Management Feature Enabled'
        $PamStatus | Should -Be $true
    }
}