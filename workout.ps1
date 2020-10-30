$randomNumber = Get-Random -Maximum 12

$workout = switch ($randomNumber) {
    0 {
        '25 pushups!'
    }
    1 {
        '25 crunches or situps!'
    }
    2 {
        'Plank for 1 minute!'
    }
    3 {
        '25 bicep curls!'
    }
    4 {
        '50 jumping jacks!'
    }
    5 {
        'Alternate between cat and cow poses for 1 minute!'
    }
    6 {
        '30 dumb bell rows!'
    }
    7 {
        '30 lunges!'
    }
    8 {
        'Forward fold and sway like a ragdoll to loosen that back!'
    }
    9 {
        '50 flutter kicks!'
    }
    10 {
        'Mountain climbers for 1 minute!'
    }
    11 {
        '25 reverse crunches!'
    }
    12 {
        'Squat and punch for 1 minute!'
    }
    default {
        '25 squats or wall sit for 1 minute!'
    }
}

$payload = @{
  "channel" = 'vu-fit'
  "text" = $workout
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$WebRequestParameters = @{
    'Uri'             = 'https://hooks.slack.com/services/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'
    'Method'          = 'Post'
    'UseBasicParsing' = $true
    'Body'            = (ConvertTo-Json -Compress -InputObject $payload)
}

Invoke-WebRequest @WebRequestParameters
