#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DebugLog(text) {
    LogLocation := A_ScriptDir . "\\Logs"
    OutputDebug, %text%
    date := A_DD "-" A_MM "-" A_YYYY
    time := A_Hour A_Min
    scriptName := A_ScriptName

    ; Create a new directory for the script if it doesn't exist
    scriptDir := LogLocation . "\\" . scriptName
    if (!FileExist(scriptDir))
        FileCreateDir, %scriptDir%

    ; Create a new log file for each run of the script
    Footer := "--------------------------------------------"
    FileAppend, %footer%`n%text% `n, % scriptDir . "\\" . scriptName . "-" . date . "-" . time . ".txt"
}

; DebugLog("Hello World")
