# ============================================
#   Have-A-Nice-Day.ps1   (just for fun!)
# ============================================

# Grab the PC name and the current user
$pcName   = $env:COMPUTERNAME
$userName = $env:USERNAME

Clear-Host

# --- The greeting ---
Write-Host ""
Write-Host "  Hi there, dear human of '$pcName'!" -ForegroundColor Cyan
Write-Host "  Welcome back, $userName " -ForegroundColor Yellow -NoNewline
Write-Host "(yes, YOU, the legend)" -ForegroundColor DarkGray
Write-Host ""

# --- The cat & dog 'clipart' (ASCII style) ---
$art = @"
        /\_/\           __      
       ( o.o )         /  \__   
        > ^ <         (  @ \_\  
       /     \         \  --  ) 
      (  cat  )         \    /  
       \_____/          (  dog ) 
                         \____/  
"@

Write-Host $art -ForegroundColor Magenta

# --- A little random pep talk ---
$jokes = @(
    "Remember: the 'S' in IT stands for Simple. ...wait.",
    "Your code compiled on the first try? Better check it twice.",
    "Coffee status: dangerously low. Please refill the human.",
    "The cat approves of your work. The dog is just happy you're here.",
    "404: Bad mood not found. Have a great one!"
)
$random = $jokes | Get-Random
Write-Host "  Tip of the day: $random" -ForegroundColor Green
Write-Host ""

# --- The sign-off ---
Write-Host "  *** HAVE A NICE DAY, $userName! ***" -ForegroundColor White -BackgroundColor DarkBlue
Write-Host ""
