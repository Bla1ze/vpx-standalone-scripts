' ****************************************************************
'                       VISUAL PINBALL X
'                		PINBALL_TABLE_NAME
'                       Version 1.0.0
'						started 19-6-2022
' ****************************************************************

'DOF Config by Outhere
'101 Left Flipper
'102 Right Flipper
'103 Left Slingshot
'104 Right Slingshot
'105 
'106 
'107 Bumper Left
'108 
'109 Bumper Right
'110 
'111 
'112 Kicker001
'113 Kicker002
'114 
'115 Kicker004
'116 Bear = Shaker,Beacon,Strobe 
'117 
'118 Kicker007
'119 Drop_reset
'120 
'121 
'122 
'123 Ball Release

Option Explicit
Randomize

Const BallSize = 50    ' 50 is the normal size used in the core.vbs, VP kicker routines uses this value divided by 2
Const BallMass = 1
Const SongVolume = 0.1 ' 1 is full volume. Value is from 0 to 1

' Load the core.vbs for supporting Subs and functions

On Error Resume Next
ExecuteGlobal GetTextFile("core.vbs")
If Err Then MsgBox "Can't open core.vbs"
ExecuteGlobal GetTextFile("controller.vbs")
If Err Then MsgBox "Can't open controller.vbs"
On Error Goto 0

'----- Shadow Options -----
Const DynamicBallShadowsOn = 1		'0 = no dynamic ball shadow, 1 = enable dynamic ball shadow


' Define any Constants
Const cGameName = "PVM"
Const TableName = "PVM"
Const myVersion = "1.0.0"
Const MaxPlayers = 4     ' from 1 to 4
Const BallSaverTime = 20 ' in seconds
Const MaxMultiplier = 3  ' limit to 3x in this game, both bonus multiplier and playfield multiplier
Const BallsPerGame = 5   ' usually 3 or 5
Const MaxMultiballs = 4  ' max number of balls during multiballs

'Const Special1 = 1000000  ' High score to obtain an extra ball/game
'Const Special2 = 3000000
'Const Special3 = 5000000

' Use FlexDMD if in FS mode
'Dim UseFlexDMD
''dim xx 
'If Table1.ShowDT = False then for each xx in aDMD : xx.visible=false : next

' Use FlexDMD if in FS mode
Dim UseFlexDMD
If Table1.ShowDT = True then
'	Tbackground.enabled = 1
    UseFlexDMD = False
Else
    UseFlexDMD = True
'	Tbackground.enabled = 1
End If



' Define Global Variables
Dim PlayersPlayingGame
Dim CurrentPlayer
Dim Credits
Dim BonusPoints(4)
Dim BonusMultiplier(4)
Dim bBonusHeld
Dim BallsRemaining(4)
Dim ExtraBallsAwards(4)
Dim Special1Awarded(4)
Dim Special2Awarded(4)
Dim Special3Awarded(4)
Dim Score(4)
Dim HighScore(4)
Dim HighScoreName(4)
Dim Tilt
Dim TiltSensitivity
Dim Tilted
Dim TotalGamesPlayed
Dim bAttractMode
Dim mBalls2Eject
Dim bAutoPlunger

' Define Game Control Variables
Dim BallsOnPlayfield
Dim BallsInLock
Dim BallsInHole

' Define Game Flags
Dim bFreePlay
Dim bGameInPlay
Dim bOnTheFirstBall
Dim bBallInPlungerLane
Dim bBallSaverActive
Dim bBallSaverReady
Dim bMultiBallMode
'Dim Multiball
Dim bMusicOn
Dim bJustStarted
Dim bJackpot
Dim plungerIM
Dim LastSwitchHit
Dim AKbullits
Dim BearM
Dim countr40
Dim countr41
Dim countr42
Dim countr43
Dim countr44
Dim countr45
Dim countr46
Dim countr47
Dim countr48
Dim countr49
dim matruska
dim tchecky
dim bommer
dim bommermode
dim kgbpoints
dim kgbmode
dim kgblevel
dim nukesleft
dim getnewbullits
dim PFMultiplier
dim rassput
dim bearhits
dim bearcollor
dim matruskamode
Dim Hhit
dim pfmulti
Dim Mhit
dim Shit
dim stalinstart
dim Jhit
dim damode
dim dapoints
dim locky
dim Bbullits
dim BBearfight
dim Bbosses
dim Bnukes
dim Bkgbl
dim rasphit
dim drink
dim jeltsin
dim vodkaL
dim pipelinehit
dim pipehit
dim putinpoints
dim churchpoints
dim modeon
dim spy
dim shootB1
dim kgbmulti
dim putwait


' Spinning Disc
Dim Ldiscspeed: Ldiscspeed=50		'set the disc physical max speed, higher for more ball effect
Dim Ldiscrotspeed: Ldiscrotspeed=75	'set the visual disc rotation speed, units in degrees per timer cycle, higher is faster
Dim LCCdiscspeed: LCCdiscspeed=50		'set the disc physical max speed, higher for more ball effect
Dim LCCdiscrotspeed: LCCdiscrotspeed=25	'set the visual disc rotation speed, units in degrees per timer cycle, higher is faster
Dim discspeed: discspeed=50		'set the disc physical max speed, higher for more ball effect
Dim discrotspeed: discrotspeed=75	'set the visual disc rotation speed, units in degrees per timer cycle, higher is faster


' core.vbs variables
Dim mMagnaSave
' *********************************************************************
'                Visual Pinball Defined Script Events
' *********************************************************************

Sub Table1_Init()
    LoadEM
	Dim i
	'Randomize

'reset HighScore
'Reseths

'Impulse Plunger as autoplunger
    Const IMPowerSetting = 36 ' Plunger Power
    Const IMTime = 1.1        ' Time in seconds for Full Plunge
    Set plungerIM = New cvpmImpulseP
    With plungerIM
        .InitImpulseP swplunger, IMPowerSetting, IMTime
        .Random 1.5
        .InitExitSnd SoundFXDOF("fx_kicker", 141, DOFPulse, DOFContactors), SoundFXDOF("fx_solenoid", 141, DOFPulse, DOFContactors)
        .CreateEvents "plungerIM"
    End With

' Magnet/turntable
Set mMagnaSave = New cvpmTurntable
With mMagnaSave
        .InitTurnTable Magna, 80
        .spinCW = False
        .MotorOn = True
        .CreateEvents "mMagnaSave"
End With

    ' Misc. VP table objects Initialisation, droptargets, animations...
    VPObjects_Init

    ' load saved values, highscore, names, jackpot
    Loadhs

    'Init main variables
    For i = 1 To MaxPlayers
        Score(i) = 0
        BonusPoints(i) = 0
        BonusMultiplier(i) = 1
        BallsRemaining(i) = BallsPerGame
        ExtraBallsAwards(i) = 0
    Next

    ' Initalise the DMD display
    DMD_Init

    ' freeplay or coins
    bFreePlay = False 'we want coins

    'if bFreePlay = false Then DOF 125, DOFOn

    ' Init main variables and any other flags
    bAttractMode = False
    bOnTheFirstBall = False
    bBallInPlungerLane = False
    bBallSaverActive = False
    bBallSaverReady = False
    bGameInPlay = False
    bMusicOn = True
    BallsOnPlayfield = 0
	bMultiBallMode = False
	'Multiball=false
	bAutoPlunger = False
    BallsInLock = 0
    BallsInHole = 0
	LastSwitchHit = ""
    Tilt = 0
    TiltSensitivity = 6
    Tilted = False
    bJustStarted = True
    ' set any lights for the attract mode
    GiOff
    StartAttractMode
	'EndOfGame()
End Sub

'****************************************
' Real Time updatess using the GameTimer
'****************************************
'used for all the real time updates
Dim BalloonFrame, BalloonFrameNext, BalloonFrameRate  
BalloonFrame = 1
BalloonFrameRate = 0.05
BalloonFrameNext = BalloonFrameRate

dim puidleFrame,puidleFrameNext,puidleFrameRate
puidleFrame = 1
puidleFrameRate = 0.08
puidleFrameNext = puidleFrameRate

dim putinyiesFrame,putinyiesFrameNext,putinyiesFrameRate
putinyiesFrame = 1
putinyiesFrameRate = 0.08
putinyiesFrameNext = putinyiesFrameRate


Sub GameTimer_Timer
    RollingUpdate
    ' add any other real time update subs, like gates or diverters
    FlipperLSh.Rotz = LeftFlipper.CurrentAngle
    FlipperRSh.Rotz = RightFlipper.CurrentAngle
	

'AnimateBalloon
	Balloon.ShowFrame(BalloonFrame)
	BalloonFrame = BalloonFrame + BalloonFrameNext
If BalloonFrame > 9 OR BalloonFrame < 1 Then
'BalloonFrame = 1
				'Change the direction of the frame step
				BalloonFrameNext = BalloonFrameNext * -1
			end if


puidle.ShowFrame(puidleFrame)
puidleFrame = puidleFrame + puidleFrameNext
if puidleFrame >9 OR puidleFrame < 1 Then
puidleFrameNext = puidleFrameNext * -1
end if

putinyies.ShowFrame(putinyiesFrame)
putinyiesFrame = putinyiesFrame + putinyiesFrameNext
if putinyiesFrame >3 OR putinyiesFrame < 1 Then
putinyiesFrameNext = putinyiesFrameNext * -1
end if

End Sub

'******
' Keys
'******

Sub Table1_KeyDown(ByVal Keycode)
    If Keycode = AddCreditKey Then
        Credits = Credits + 1
        if bFreePlay = False Then
            DOF 125, DOFOn
            If(Tilted = False) Then
                DMDFlush
                DMD "_", CL(1, "CREDITS: " & Credits), "", eNone, eNone, eNone, 500, True, "fx_coin"
            End If
        End If
    End If

    If keycode = PlungerKey Then
        Plunger.Pullback
        PlaySoundAt "fx_plungerpull", plunger
        PlaySoundAt "fx_reload", plunger
    End If

    If hsbModeActive Then
        EnterHighScoreKey(keycode)
        Exit Sub
    End If

    ' Normal flipper action

    If bGameInPlay AND NOT Tilted Then

        If keycode = LeftTiltKey Then Nudge 90, 8:PlaySound "fx_nudge", 0, 1, -0.1, 0.25:CheckTilt
        If keycode = RightTiltKey Then Nudge 270, 8:PlaySound "fx_nudge", 0, 1, 0.1, 0.25:CheckTilt
        If keycode = CenterTiltKey Then Nudge 0, 9:PlaySound "fx_nudge", 0, 1, 1, 0.25:CheckTilt

        If keycode = LeftFlipperKey Then SolLFlipper 1
        If keycode = RightFlipperKey Then SolRFlipper 1

        If keycode = StartGameKey Then
            If((PlayersPlayingGame <MaxPlayers) AND(bOnTheFirstBall = True) ) Then

                If(bFreePlay = True) Then
                    PlayersPlayingGame = PlayersPlayingGame + 1
                    TotalGamesPlayed = TotalGamesPlayed + 1
                    DMD "_", CL(1, PlayersPlayingGame & " PLAYERS"), "", eNone, eBlink, eNone, 500, True, "so_fanfare1"
                Else
                    If(Credits> 0) then
                        PlayersPlayingGame = PlayersPlayingGame + 1
                        TotalGamesPlayed = TotalGamesPlayed + 1
                        Credits = Credits - 1
                        DMD "_", CL(1, PlayersPlayingGame & " PLAYERS"), "", eNone, eBlink, eNone, 500, True, "so_fanfare1"
                        If Credits <1 And bFreePlay = False Then DOF 125, DOFOff
                        Else
                            ' Not Enough Credits to start a game.
                            DMD CL(0, "CREDITS " & Credits), CL(1, "INSERT COIN"), "", eNone, eBlink, eNone, 500, True, "so_nocredits"
						playsound "vo_putin_ruble"
                    End If
                End If
            End If
        End If
        Else ' If (GameInPlay)

            If keycode = StartGameKey Then
                If(bFreePlay = True) Then
                    If(BallsOnPlayfield = 0) Then
                        ResetForNewGame()
						'UpdateMusicNow
                    End If
                Else
                    If(Credits> 0) Then
                        If(BallsOnPlayfield = 0) Then
                            Credits = Credits - 1
                            If Credits <1 And bFreePlay = False Then DOF 125, DOFOff
                            ResetForNewGame()
							'UpdateMusicNow
                        End If
                    Else
                        ' Not Enough Credits to start a game.
                        DMD CL(0, "CREDITS " & Credits), CL(1, "INSERT COIN"), "", eNone, eBlink, eNone, 500, True, "so_nocredits"
					  playsound "vo_putin_ruble"
                    End If
                End If
            End If
    End If ' If (GameInPlay)

'table keys
'If keycode = RightMagnaSave or keycode = LeftMagnasave Then ShowPost 
End Sub

Sub Table1_KeyUp(ByVal keycode)

    If keycode = PlungerKey Then
        Plunger.Fire
        PlaySoundAt "fx_plunger", plunger
        If bBallInPlungerLane Then PlaySoundAt "fx_fire", plunger
    End If

    If hsbModeActive Then
        Exit Sub
    End If

    ' Table specific

    If bGameInPLay AND NOT Tilted Then
        If keycode = LeftFlipperKey Then
            SolLFlipper 0
        End If
        If keycode = RightFlipperKey Then
            SolRFlipper 0
        End If
    End If
End Sub

'*************
' Pause Table
'*************

Sub table1_Paused
End Sub

Sub table1_unPaused
End Sub

Sub Table1_Exit
    Savehs
    If B2SOn = true Then Controller.Stop
End Sub

'********************
'     Flippers
'********************

Sub SolLFlipper(Enabled)
    If Enabled Then
        PlaySoundAt SoundFXDOF("PNK_MH_Flip_L_up", 101, DOFOn, DOFFlippers), LeftFlipper
        LeftFlipper.RotateToEnd
Flipper005.RotateToEnd 
Flipper002.RotateToEnd
Flipper003.RotateToEnd
    Else
        PlaySoundAt SoundFXDOF("PNK_MH_Flip_L_down", 101, DOFOff, DOFFlippers), LeftFlipper
        LeftFlipper.RotateToStart
Flipper005.RotateToStart
Flipper002.RotateToStart 
Flipper003.RotateToStart
    End If
End Sub

Sub SolRFlipper(Enabled)
    If Enabled Then
        PlaySoundAt SoundFXDOF("PNK_MH_Flip_R_up", 102, DOFOn, DOFFlippers), RightFlipper
        RightFlipper.RotateToEnd
Flipper001.RotateToEnd 
Flipper004.RotateToEnd 
		RotateLaneLightsRight
		RotateLaneLightsRight2
		RotateLaneLightsRight3
		RotateLaneLightsRight4
    Else
        PlaySoundAt SoundFXDOF("PNK_MH_Flip_R_down", 102, DOFOff, DOFFlippers), RightFlipper
Flipper004.RotateToStart
Flipper001.RotateToStart

        RightFlipper.RotateToStart
    End If
End Sub

' flippers hit Sound

Sub LeftFlipper_Collide(parm)
    PlaySound "fx_rubber_flipper", 0, parm / 10, pan(ActiveBall), 0, Pitch(ActiveBall), 0, 0, AudioFade(ActiveBall)
End Sub

Sub RightFlipper_Collide(parm)
    PlaySound "fx_rubber_flipper", 0, parm / 10, pan(ActiveBall), 0, Pitch(ActiveBall), 0, 0, AudioFade(ActiveBall)
End Sub


Sub RotateLaneLightsRight
    Dim TempState
    TempState = RightOutlane.State
    RightOutlane.State = RightInlane.State
    RightInlane.State = LeftInlane.State
    LeftInlane.State = LeftOutlane.State
    LeftOutlane.State = TempState
End Sub

Sub RotateLaneLightsRight2
if damode=1 or damode=2 then exit sub
    Dim TempState2
    TempState2 = li128.State
    li128.State = li129.State
    li129.state = TempState2
End Sub

Sub RotateLaneLightsRight3
if damode=0 or damode=2 then exit sub
    Dim TempState3
    TempState3 = li130.State
    li130.State = li131.State
    li131.state = TempState3
End Sub

Sub RotateLaneLightsRight4
if damode=0 or damode=1 then exit sub
    Dim TempState4
    TempState4 = li132.State
    li132.State = li133.State
    li133.state = TempState4
End Sub



'*********
' TILT
'*********

'NOTE: The TiltDecreaseTimer Subtracts .01 from the "Tilt" variable every round

Sub CheckTilt                                    'Called when table is nudged
    Tilt = Tilt + TiltSensitivity                'Add to tilt count
    TiltDecreaseTimer.Enabled = True
    If(Tilt> TiltSensitivity) AND(Tilt <15) Then 'show a warning
        DMD "_", CL(1, "CAREFUL!"), "", eNone, eBlinkFast, eNone, 500, True, ""
    End if
    If Tilt> 15 Then 'If more that 15 then TILT the table
        Tilted = True
        'display Tilt
        DMDFlush
        DMD "", "", "TILT", eNone, eNone, eBlink, 200, False, ""
        DisableTable True
        TiltRecoveryTimer.Enabled = True 'start the Tilt delay to check for all the balls to be drained
    End If
End Sub

Sub TiltDecreaseTimer_Timer
    ' DecreaseTilt
    If Tilt> 0 Then
        Tilt = Tilt - 0.1
    Else
        TiltDecreaseTimer.Enabled = False
    End If
End Sub

Sub DisableTable(Enabled)
    If Enabled Then
        'turn off GI and turn off all the lights
        GiOff
        LightSeqTilt.Play SeqAllOff
        'Disable slings, bumpers etc
        LeftFlipper.RotateToStart
        RightFlipper.RotateToStart
'       Bumper1.Force = 0
'       Bumper2.Force = 0
'		Bumper3.Force = 0
        LeftSlingshot.Disabled = 1
        RightSlingshot.Disabled = 1
    Else
        'turn back on GI and the lights
        GiOn
'		GiOff
        LightSeqTilt.StopPlay
'        Bumper1.Force = 8
'        Bumper2.Force = 8
'		Bumper3.Force = 8
        LeftSlingshot.Disabled = 0
        RightSlingshot.Disabled = 0
        'clean up the buffer display
        DMDFlush
    End If
End Sub

' GI light sequence effects

'Sub GiEffect(n)
'    Select Case n
'        Case 0 'all blink
'            LightSeqGi.UpdateInterval = 8
'            LightSeqGi.Play SeqBlinking, , 5, 50
'        Case 1 'random
'            LightSeqGi.UpdateInterval = 10
'            LightSeqGi.Play SeqRandom, 5, , 1000
'        Case 2 'upon
'            LightSeqGi.UpdateInterval = 4
'            LightSeqGi.Play SeqUpOn, 5, 1
'    End Select
'End Sub

'Sub LightEffect(n)
'    Select Case n
'        Case 0 'all blink
'            LightSeqInserts.UpdateInterval = 8
'            LightSeqInserts.Play SeqBlinking, , 5, 50
'        Case 1 'random
'            LightSeqInserts.UpdateInterval = 10
'            LightSeqInserts.Play SeqRandom, 5, , 1000
'        Case 2 'upon
'            LightSeqInserts.UpdateInterval = 4
'            LightSeqInserts.Play SeqUpOn, 10, 1
'        Case 3 ' left-right-left
'            LightSeqInserts.UpdateInterval = 5
'            LightSeqInserts.Play SeqLeftOn, 10, 1
'            LightSeqInserts.UpdateInterval = 5
'            LightSeqInserts.Play SeqRightOn, 10, 1
'    End Select
'End Sub

Sub TiltRecoveryTimer_Timer()
    ' if all the balls have been drained then..
    If(BallsOnPlayfield = 0) Then
        ' do the normal end of ball thing (this doesn't give a bonus if the table is tilted)
        EndOfBall()
        TiltRecoveryTimer.Enabled = False
    End If
' else retry (checks again in another second or so)
End Sub

'********************
' Music as wav sounds
'********************

Dim Song, UpdateMusic
Song = ""

Sub PlaySong(name)
    If bMusicOn Then
        If Song <> name Then
            StopSound Song
            Song = name
            PlaySound Song, -1, SongVolume
        End If
    End If
End Sub

Sub StopSong
    If bMusicOn Then
        StopSound Song
        Song = ""
    End If
End Sub

Sub ChangeSong
    If(BallsOnPlayfield = 0)Then
        PlaySong "M_end"
        Exit Sub
    End If

    If bAttractMode Then
        PlaySong "M_end"
        Exit Sub
    End If
    If bMultiBallMode Then
        PlaySong "MULTI"
    Else
        UpdateMusicNow
    end if
End Sub

'if you add more balls to the game use changesong then if bMultiBallMode = true, your multiball song will be played.

Sub UpdateMusicNow
    Select Case UpdateMusic
        Case 0:PlaySong "1"
        Case 1:PlaySong "2"
        Case 2:PlaySong "3"
        Case 3:PlaySong "4"
        Case 4:PlaySong "5"
        Case 5:PlaySong "M_end"
        'Case 6:PlaySong "6"
		'Case 7:PlaySong "7"
		'Case 8:PlaySong "8"
		'Case 9:PlaySong "9"
		'Case 10:PlaySong "10"
		'Case 11:PlaySong "11"
		'Case 12:PlaySong "12"
        'Case 6:PlaySong "chooseplayer2"
    End Select
end sub

Sub Pin001_hit()
Playsound "Rubber_4"
end sub

Sub Pin002_hit()
Playsound "rubber_hit_1"
end sub 

Sub Pin003_hit()
Playsound "Rubber_4"
end sub

Sub Pin3_hit()
Playsound "Rubber_4"
end sub

Sub Pin4_hit()
Playsound "Rubber_4"
end sub

Sub aWoods_Hit(idx):PlaySoundAtBall "fx_Woodhit":End Sub

'********************
' Play random quotes
'********************

Sub PlayQuote
    Dim tmp
    tmp = INT(RND * 123) + 1
    PlaySound "HIT_" &tmp
End Sub

'**********************
'     GI effects
' independent routine
' it turns on the gi
' when there is a ball
' in play
'**********************

Dim OldGiState
OldGiState = -1   'start witht the Gi off

Sub ChangeGi(col) 'changes the gi color
    Dim bulb
    For each bulb in GI
        SetLightColor bulb, col, -1
    Next
End Sub

Sub GIUpdateTimer_Timer
    Dim tmp, obj
    tmp = Getballs
    If UBound(tmp) <> OldGiState Then
        OldGiState = Ubound(tmp)
        If UBound(tmp) = 1 Then 'we have 2 captive balls on the table (-1 means no balls, 0 is the first ball, 1 is the second..)
            GiOff               ' turn off the gi if no active balls on the table, we could also have used the variable ballsonplayfield.
        Else
            Gion
			'GiOff
        End If
    End If
End Sub

Sub GiOn
    DOF 127, DOFOn
    Dim bulb
    For each bulb in GI
        bulb.State = 1
    Next
	Table1.ColorGradeImage = "ColorGradeLUT256x16_1to1"
End Sub

Sub GiOff
    DOF 127, DOFOff
    Dim bulb
    For each bulb in GI
        bulb.State = 0
    Next
	Table1.ColorGradeImage = "-30"
End Sub

Sub GiRightOff
    Dim bulb
    For each bulb in GIright
        bulb.State = 0
    Next
End Sub

Sub GiLeftOff
    Dim bulb
    For each bulb in GIleft
        bulb.State = 0
    Next
End Sub

Sub GiRightOn
    Dim bulb
    For each bulb in GIright
        bulb.State = 1
    Next
End Sub

Sub GiLeftOn
    Dim bulb
    For each bulb in GIleft
        bulb.State = 1
    Next
End Sub
' GI, light & flashers sequence effects

Sub GiEffect(n)
    Dim ii
    Select Case n
        Case 0 'all off
            LightSeqGi.Play SeqAlloff
        Case 1 'all blink
            LightSeqGi.UpdateInterval = 10
            LightSeqGi.Play SeqBlinking, , 15, 10
        Case 2 'random
            LightSeqGi.UpdateInterval = 10
            LightSeqGi.Play SeqRandom, 50, , 1000
        Case 3 'all blink fast
            LightSeqGi.UpdateInterval = 10
            LightSeqGi.Play SeqBlinking, , 10, 10
        Case 4 'all blink once
            LightSeqGi.UpdateInterval = 10
            LightSeqGi.Play SeqBlinking, , 4, 1
    End Select
End Sub

Sub LightEffect(n)
    Select Case n
        Case 0 ' all off
            LightSeqInserts.Play SeqAlloff
        Case 1 'all blink
            LightSeqInserts.UpdateInterval = 10
            LightSeqInserts.Play SeqBlinking, , 15, 10
        Case 2 'random
            LightSeqInserts.UpdateInterval = 10
            LightSeqInserts.Play SeqRandom, 50, , 1000
        Case 3 'all blink fast
            LightSeqInserts.UpdateInterval = 10
            LightSeqInserts.Play SeqBlinking, , 10, 10
        Case 4 'up 1 time
            LightSeqInserts.UpdateInterval = 4
            LightSeqInserts.Play SeqUpOn, 8, 1
        Case 5 'up 2 times
            LightSeqInserts.UpdateInterval = 4
            LightSeqInserts.Play SeqUpOn, 8, 2
        Case 6 'down 1 time
            LightSeqInserts.UpdateInterval = 4
            LightSeqInserts.Play SeqDownOn, 8, 1
        Case 7 'down 2 times
            LightSeqInserts.UpdateInterval = 4
            LightSeqInserts.Play SeqDownOn, 8, 2
    End Select
End Sub

' *********************************************************************
'                      Supporting Ball & Sound Functions
' *********************************************************************

Function Vol(ball) ' Calculates the Volume of the sound based on the ball speed
    Vol = Csng(BallVel(ball) ^2 / 2000)
End Function

Function Pan(ball) ' Calculates the pan for a ball based on the X position on the table. "table1" is the name of the table
    Dim tmp
    tmp = ball.x * 2 / table1.width-1
    If tmp > 0 Then
        Pan = Csng(tmp ^10)
    Else
        Pan = Csng(-((- tmp) ^10))
    End If
End Function

Function Pitch(ball) ' Calculates the pitch of the sound based on the ball speed
    Pitch = BallVel(ball) * 20
End Function

Function BallVel(ball) 'Calculates the ball speed
    BallVel = (SQR((ball.VelX ^2) + (ball.VelY ^2)))
End Function

Function AudioFade(ball) 'only on VPX 10.4 and newer
    Dim tmp
    tmp = ball.y * 2 / Table1.height-1
    If tmp > 0 Then
        AudioFade = Csng(tmp ^10)
    Else
        AudioFade = Csng(-((- tmp) ^10))
    End If
End Function

Sub PlaySoundAt(soundname, tableobj) 'play sound at X and Y position of an object, mostly bumpers, flippers and other fast objects
    PlaySound soundname, 0, 1, Pan(tableobj), 0.06, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtBall(soundname) ' play a sound at the ball position, like rubbers, targets, metals, plastics
    PlaySound soundname, 0, Vol(ActiveBall), pan(ActiveBall), 0.2, 0, 0, 0, AudioFade(ActiveBall)
End Sub

'********************************************
'   JP's VP10 Rolling Sounds
'********************************************

Const tnob = 11 ' total number of balls
Const lob = 0   'number of locked balls
ReDim rolling(tnob)
InitRolling

Sub InitRolling
    Dim i
    For i = 0 to tnob
        rolling(i) = False
    Next
End Sub

Sub RollingUpdate()
    Dim BOT, b, ballpitch, ballvol
    BOT = GetBalls

    ' stop the sound of deleted balls
    For b = UBound(BOT) + 1 to tnob
        rolling(b) = False
        StopSound("fx_ballrolling" & b)
    Next

    ' exit the sub if no balls on the table
    If UBound(BOT) = lob - 1 Then Exit Sub 'there no extra balls on this table

    ' play the rolling sound for each ball
    For b = lob to UBound(BOT)

        If BallVel(BOT(b) )> 1 Then
            If BOT(b).z <30 Then
                ballpitch = Pitch(BOT(b) )
                ballvol = Vol(BOT(b) )
            Else
                ballpitch = Pitch(BOT(b) ) + 25000 'increase the pitch on a ramp
                ballvol = Vol(BOT(b) ) * 10
            End If
            rolling(b) = True
            PlaySound("fx_ballrolling" & b), -1, ballvol, Pan(BOT(b) ), 0, ballpitch, 1, 0, AudioFade(BOT(b) )
        Else
            If rolling(b) = True Then
                StopSound("fx_ballrolling" & b)
                rolling(b) = False
            End If
        End If
        ' rothbauerw's Dropping Sounds
        If BOT(b).VelZ <-1 and BOT(b).z <55 and BOT(b).z> 27 Then 'height adjust for ball drop sounds
            PlaySound "fx_balldrop", 0, ABS(BOT(b).velz) / 17, Pan(BOT(b) ), 0, Pitch(BOT(b) ), 1, 0, AudioFade(BOT(b) )
        End If
    Next
End Sub

'**********************
' Ball Collision Sound
'**********************

Sub OnBallBallCollision(ball1, ball2, velocity)
    PlaySound "fx_collide", 0, Csng(velocity) ^2 / 2000, Pan(ball1), 0, Pitch(ball1), 0, 0, AudioFade(ball1)
End Sub

'******************************
' Diverse Collection Hit Sounds
'******************************

Sub RHelp1_Hit()
    StopSound "fx_metalrolling"
    PlaySoundAtBall "fx_ballrampdrop"
End Sub

Sub RHelp2_Hit()
    StopSound "fx_metalrolling"
    PlaySoundAtBall"fx_ballrampdrop"
End Sub


'***************************************************************
'****  VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'***************************************************************

'****** INSTRUCTIONS please read ******

' The "DynamicBSUpdate" sub should be called with an interval of -1 (framerate)
' Place a toggleable variable (DynamicBallShadowsOn) in user options at the top of the script
' Import the "bsrtx7" and "ballshadow" images
' Import the shadow materials file (3 sets included) (you can also export the 3 sets from this table to create the same file)
' Copy in the sets of primitives named BallShadow#, RtxBallShadow#, and RtxBall2Shadow#, with at least as many objects each as there can be balls
'
' Create a collection called DynamicSources that includes all light sources you want to cast ball shadows
'***These must be organized in order, so that lights that intersect on the table are adjacent in the collection***
' This is because the code will only project two shadows if they are coming from lights that are consecutive in the collection
' The easiest way to keep track of this is to start with the group on the left slingshot and move clockwise around the table
'	For example, if you use 6 lights: A & B on the left slingshot and C & D on the right, with E near A&B and F next to C&D, your collection would look like EBACDF
'
'																E
'	A		 C													B
'	 B		D			your collection should look like		A		because E&B, B&A, etc. intersect; but B&D or E&F do not
'  E		  F													C
'																D
'																F
'
'Update shadow options in the code to fit your table and preference

'****** End Instructions ******

' *** Example timer sub

' The frame timer interval is -1, so executes at the display frame rate
Sub FrameTimer_Timer()
	If DynamicBallShadowsOn=1 Then DynamicBSUpdate 'update ball shadows
End Sub

' *** These are usually defined elsewhere (ballrolling), but activate here if necessary

'Const tnob = 10 ' total number of balls
'Const lob = 0	'locked balls on start; might need some fiddling depending on how your locked balls are done

' *** Example "Top of Script" User Option
'Const DynamicBallShadowsOn = 1		'0 = no dynamic ball shadow, 1 = enable dynamic ball shadow

' *** Shadow Options ***
Const fovY					= -2	'Offset y position under ball to account for layback or inclination (more pronounced need further back, -2 seems best for alignment at slings)
Const DynamicBSFactor 		= 0.99	'0 to 1, higher is darker
Const AmbientBSFactor 		= 0.7	'0 to 1, higher is darker
Const Wideness				= 20	'Sets how wide the shadows can get (20 +5 thinness should be most realistic)
Const Thinness				= 5		'Sets minimum as ball moves away from source
' ***				 ***

Dim sourcenames, currentShadowCount

sourcenames = Array ("","","","","","","","","","","","")
currentShadowCount = Array (0,0,0,0,0,0,0,0,0,0,0,0)


dim objrtx1(20), objrtx2(20)
dim objBallShadow(20)
DynamicBSInit

sub DynamicBSInit()
	Dim iii

	for iii = 0 to tnob									'Prepares the shadow objects before play begins
		Set objrtx1(iii) = Eval("RtxBallShadow" & iii)
		objrtx1(iii).material = "RtxBallShadow" & iii
		objrtx1(iii).z = iii/1000 + 0.01
		objrtx1(iii).visible = 0
		'objrtx1(iii).uservalue=0

		Set objrtx2(iii) = Eval("RtxBall2Shadow" & iii)
		objrtx2(iii).material = "RtxBallShadow2_" & iii
		objrtx2(iii).z = (iii)/1000 + 0.02
		objrtx2(iii).visible = 0
		'objrtx2(iii).uservalue=0
		currentShadowCount(iii) = 0
		Set objBallShadow(iii) = Eval("BallShadow" & iii)
		objBallShadow(iii).material = "BallShadow" & iii
		objBallShadow(iii).Z = iii/1000 + 0.04
	Next
end sub


Sub DynamicBSUpdate
	Dim falloff:	falloff = 150			'Max distance to light sources, can be changed if you have a reason
	Const AmbientShadowOn = 1				'Toggle for just the moving shadow primitive (ninuzzu's)
	Dim ShadowOpacity, ShadowOpacity2 
	Dim s, Source, LSd, b, currentMat, AnotherSource, BOT
	BOT = GetBalls

	'Hide shadow of deleted balls
	For s = UBound(BOT) + 1 to tnob
		objrtx1(s).visible = 0
		objrtx2(s).visible = 0
		objBallShadow(s).visible = 0
	Next

	If UBound(BOT) = lob - 1 Then Exit Sub		'No balls in play, exit

'The Magic happens here
	For s = lob to UBound(BOT)

' *** Normal "ambient light" ball shadow
		If AmbientShadowOn = 1 Then
			If BOT(s).X < tablewidth/2 Then
				objBallShadow(s).X = ((BOT(s).X) - (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/13)) + 5
			Else
				objBallShadow(s).X = ((BOT(s).X) + (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/13)) - 5
			End If
			objBallShadow(s).Y = BOT(s).Y + fovY

			If BOT(s).Z < 30 Then 'or BOT(s).Z > 105 Then		'Defining when (height-wise) you want ambient shadows
				objBallShadow(s).visible = 1
	'			objBallShadow(s).Z = BOT(s).Z - 25 + s/1000 + 0.04		'Uncomment if you want to add shadows to an upper/lower pf
			Else
				objBallShadow(s).visible = 0
			end if
		End If
' *** Dynamic shadows
		For Each Source in DynamicSources
			LSd=DistanceFast((BOT(s).x-Source.x),(BOT(s).y-Source.y))	'Calculating the Linear distance to the Source
			If BOT(s).Z < 30 Then 'Or BOT(s).Z > 105 Then				'Defining when (height-wise) you want dynamic shadows
				If LSd < falloff and Source.state=1 Then	    		'If the ball is within the falloff range of a light and light is on
					currentShadowCount(s) = currentShadowCount(s) + 1	'Within range of 1 or 2
					if currentShadowCount(s) = 1 Then					'1 dynamic shadow source
						sourcenames(s) = source.name
						currentMat = objrtx1(s).material
						objrtx2(s).visible = 0 : objrtx1(s).visible = 1 : objrtx1(s).X = BOT(s).X : objrtx1(s).Y = BOT(s).Y + fovY
'						objrtx1(s).Z = BOT(s).Z - 25 + s/1000 + 0.01							'Uncomment if you want to add shadows to an upper/lower pf
						objrtx1(s).rotz = AnglePP(Source.x, Source.y, BOT(s).X, BOT(s).Y) + 90
						ShadowOpacity = (falloff-LSd)/falloff									'Sets opacity/darkness of shadow by distance to light
						objrtx1(s).size_y = Wideness*ShadowOpacity+Thinness						'Scales shape of shadow with distance/opacity
						UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity*DynamicBSFactor^2,RGB(0,0,0),0,0,False,True,0,0,0,0
						'debug.print "update1" & source.name & " at:" & ShadowOpacity

						currentMat = objBallShadow(s).material
						UpdateMaterial currentMat,1,0,0,0,0,0,AmbientBSFactor*(1-ShadowOpacity),RGB(0,0,0),0,0,False,True,0,0,0,0

					Elseif currentShadowCount(s) = 2 Then
																'Same logic as 1 shadow, but twice
						currentMat = objrtx1(s).material
						set AnotherSource = Eval(sourcenames(s))
						objrtx1(s).visible = 1 : objrtx1(s).X = BOT(s).X : objrtx1(s).Y = BOT(s).Y + fovY
'						objrtx1(s).Z = BOT(s).Z - 25 + s/1000 + 0.01							'Uncomment if you want to add shadows to an upper/lower pf
						objrtx1(s).rotz = AnglePP(AnotherSource.x, AnotherSource.y, BOT(s).X, BOT(s).Y) + 90
						ShadowOpacity = (falloff-(((BOT(s).x-AnotherSource.x)^2+(BOT(s).y-AnotherSource.y)^2)^0.5))/falloff
						objrtx1(s).size_y = Wideness*ShadowOpacity+Thinness
						UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0

						currentMat = objrtx2(s).material
						objrtx2(s).visible = 1 : objrtx2(s).X = BOT(s).X : objrtx2(s).Y = BOT(s).Y + fovY
'						objrtx2(s).Z = BOT(s).Z - 25 + s/1000 + 0.02							'Uncomment if you want to add shadows to an upper/lower pf
						objrtx2(s).rotz = AnglePP(Source.x, Source.y, BOT(s).X, BOT(s).Y) + 90
						ShadowOpacity2 = (falloff-LSd)/falloff
						objrtx2(s).size_y = Wideness*ShadowOpacity2+Thinness
						UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity2*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0
						'debug.print "update2: " & source.name & " at:" & ShadowOpacity & " and "  & Eval(sourcenames(s)).name & " at:" & ShadowOpacity2

						currentMat = objBallShadow(s).material
						UpdateMaterial currentMat,1,0,0,0,0,0,AmbientBSFactor*(1-max(ShadowOpacity,ShadowOpacity2)),RGB(0,0,0),0,0,False,True,0,0,0,0
					end if
				Else
					currentShadowCount(s) = 0
				End If
			Else									'Hide dynamic shadows everywhere else
				objrtx2(s).visible = 0 : objrtx1(s).visible = 0
			End If
		Next
	Next
End Sub


Function DistanceFast(x, y)
	dim ratio, ax, ay
	'Get absolute value of each vector
	ax = abs(x)
	ay = abs(y)
	'Create a ratio
	ratio = 1 / max(ax, ay)
	ratio = ratio * (1.29289 - (ax + ay) * ratio * 0.29289)
	if ratio > 0 then
		DistanceFast = 1/ratio
	Else
		DistanceFast = 0
	End if
end Function

Function max(a,b)
	if a > b then 
		max = a
	Else
		max = b
	end if
end Function
							'Enable these functions if they are not already present elswhere in your table
Dim PI: PI = 4*Atn(1)

Function Atn2(dy, dx)
	If dx > 0 Then
		Atn2 = Atn(dy / dx)
	ElseIf dx < 0 Then
		If dy = 0 Then 
			Atn2 = pi
		Else
			Atn2 = Sgn(dy) * (pi - Atn(Abs(dy / dx)))
		end if
	ElseIf dx = 0 Then
		if dy = 0 Then
			Atn2 = 0
		else
			Atn2 = Sgn(dy) * pi / 2
		end if
	End If
End Function

Function AnglePP(ax,ay,bx,by)
	AnglePP = Atn2((by - ay),(bx - ax))*180/PI
End Function

'****************************************************************
'****  END VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'****************************************************************


' *********************************************************************
'                        User Defined Script Events
' *********************************************************************

' Initialise the Table for a new Game
'
Sub ResetForNewGame()
    Dim i

    bGameInPLay = True

    'resets the score display, and turn off attract mode
    StopAttractMode
'    GiOn
	'GiOff

    TotalGamesPlayed = TotalGamesPlayed + 1
    CurrentPlayer = 1
    PlayersPlayingGame = 1
    bOnTheFirstBall = True
	'Multiball=false	
    For i = 1 To MaxPlayers
        Score(i) = 0
        BonusPoints(i) = 0
		'BonusHeldPoints(i) = 0
        BonusMultiplier(i) = 1
        BallsRemaining(i) = BallsPerGame
        ExtraBallsAwards(i) = 0
        Special1Awarded(i) = False
        Special2Awarded(i) = False
        Special3Awarded(i) = False
    Next

    ' initialise any other flags
    Tilt = 0

	'reset variables
	bumperHits = 100
	AKbullits = 20
	PFMultiplier = 1
	BearM = 0
	countr40 = 0
	countr41 = 0
	countr42 = 0
	countr43 = 0
	countr44 = 0
	countr45 = 0
	countr46 = 0
	countr47 = 0
	countr48 = 0
	countr49 = 0
	matruska = 0
	rassput = 0
	tchecky = 0
	bommer = 0
	bommermode = 0
	kgbpoints = 0
	kgbmode = 0
	kgblevel = 0
	nukesleft = 0
	getnewbullits = 0
	matruskamode = 0
	bearhits = 0
	bearcollor = 0
	pfmulti =0
	Hhit = 0
	Jhit = 0
	Mhit = 0
	Shit = 0
	damode = 0
	dapoints = 0
	stalinstart = 0
	locky = 0
	Bbullits = 0
	BBearfight = 0
	Bbosses = 0
	Bnukes = 0
	Bkgbl = 0
	rasphit = 0
	drink = 0
	jeltsin = 0
    vodkaL = 0
	pipelinehit = 0
	pipehit = 0
	putinpoints = 0
	churchpoints = 0
	modeon = 0
	spy = 0
	shootB1 = 0
	kgbmulti = 1
	putwait = 0
	target001.IsDropped = False
	target002.IsDropped = False
	target003.IsDropped = False
	target004.IsDropped = False
	target005.IsDropped = False
	target006.IsDropped = False
	target007.IsDropped = False
	
    UpdateMusic = 0
    'UpdateMusic = UpdateMusic + 6
    'UpdateMusicNow
	stopsong
    ' initialise Game variables
    Game_Init()
	
    ' you may wish to start some music, play a sound, do whatever at this point
StopSong
PlaySound ""


    vpmtimer.addtimer 100, "FirstBall '"
End Sub

' This is used to delay the start of a game to allow any attract sequence to

' complete.  When it expires it creates a ball for the player to start playing with

Sub FirstBall
PlaySound  "START"
DMD "", "", "akb20", eNone, eNone, eNone, 900, True, ""
DMD "", "", "compleet4", eNone, eNone, eNone, 900, True, ""
DMD "", "", "compleet2", eNone, eNone, eNone, 900, True, ""
DMD "", "", "compleet3", eNone, eNone, eNone, 900, True, ""
DMD "", "", "compleet", eNone, eNone, eNone, 900, True, ""
DMD "", "", "dmdboss1", eNone, eNone, eNone, 750, True, ""
DMD "", "", "dmdboss2", eNone, eNone, eNone, 750, True, ""
DMD "", "", "dmdboss3", eNone, eNone, eNone, 750, True, ""
DMD "", "", "dmdboss4", eNone, eNone, eNone, 750, True, ""
DMD "", "", "dmdboss5", eNone, eNone, eNone, 750, True, ""
DMD "", "", "dmdboss6", eNone, eNone, eNone, 750, True, ""
DMD "", "", "compleet5", eNone, eNone, eNone, 1000, True, ""
    ' reset the table for a new ball
vpmtimer.addtimer 10000, "ResetForNewPlayerBall() '"
    ' create a new ball in the shooters lane
vpmtimer.addtimer 10000, "CreateNewBall() '"
End Sub

' (Re-)Initialise the Table for a new ball (either a new ball after the player has
' lost one or we have moved onto the next player (if multiple are playing))

Sub ResetForNewPlayerBall()
Balloon.Visible = False
puidle.Visible = true
    ' make sure the correct display is upto date
    AddScore 0
'Table1.ColorGradeImage = "ColorGradeLUT256x16_1to1"
GiOn
	playsound "fx_resetdrop"
PBord001.z=-112
PBord002.z=-112
resetdijackpot

if UpdateMusic = 2 Then
tetris.visible = true
TTetris.enabled = True
end if
    ' set the current players bonus multiplier back down to 1X
    BonusMultiplier(CurrentPlayer) = 1
    'UpdateBonusXLights
	
' reset any drop targets, lights, game Mode etc..
    
   'This is a new ball, so activate the ballsaver
    bBallSaverReady = True

    'Reset any table specific
	HoleBonus = 0
	TargetBonus = 0
    ResetNewBallVariables
    ResetNewBallLights()
	'Multiball=false	
	UpdateMusicNow
End Sub

' Create a new ball on the Playfield

Sub CreateNewBall()
    
	LightSeqAttract.StopPlay

	' create a ball in the plunger lane kicker.
    BallRelease.CreateSizedBallWithMass BallSize / 2, BallMass

    ' There is a (or another) ball on the playfield
    BallsOnPlayfield = BallsOnPlayfield + 1

    ' kick it out..
    PlaySoundAt SoundFXDOF("fx_Ballrel", 123, DOFPulse, DOFContactors), BallRelease
    BallRelease.Kick 90, 4

	'only this tableDrain / Plunger Functions
	'ChangeBallImage

    If BallsOnPlayfield> 1 Then
        bMultiBallMode = True
        bAutoPlunger = True
        'ChangeSong
    End If

End Sub


' Add extra balls to the table with autoplunger
' Use it as AddMultiball 4 to add 4 extra balls to the table

Sub AddMultiball(nballs)
    mBalls2Eject = mBalls2Eject + nballs
    CreateMultiballTimer.Enabled = True
    'and eject the first ball
    CreateMultiballTimer_Timer
End Sub

' Eject the ball after the delay, AddMultiballDelay
Sub CreateMultiballTimer_Timer()
    ' wait if there is a ball in the plunger lane
    If bBallInPlungerLane Then
        Exit Sub
    Else
        If BallsOnPlayfield < MaxMultiballs Then
            CreateNewBall()
            mBalls2Eject = mBalls2Eject -1
            If mBalls2Eject = 0 Then 'if there are no more balls to eject then stop the timer
                CreateMultiballTimer.Enabled = False
            End If
        Else 'the max number of multiballs is reached, so stop the timer
            mBalls2Eject = 0
            CreateMultiballTimer.Enabled = False
        End If
    End If
End Sub


' The Player has lost his ball (there are no more balls on the playfield).
' Handle any bonus points awarded

Sub EndOfBall()
puidle.Visible = False
Balloon.Visible = true
tetris.visible = False
TTetris.enabled = false
'Table1.ColorGradeImage = "-30"
GiOff
LightSeq001.Play SeqRightOn, 25, 1
Dim BonusDelayTime
' the first ball has been lost. From this point on no new players can join in
bOnTheFirstBall = False
StopSong
playsound "fx_resetdrop"
PBord001.z=112
PBord002.z=112
if UpdateMusic = 0 Then
playsound "vo_lost1"
DMD "", "", "dmdlost", eNone, eNone, eNone, 500, True, ""
vpmtimer.addtimer 500, "endofballput '"
vpmtimer.addtimer 2600, "EndOfBallcontinue '"
end if
if UpdateMusic = 1 Then
playsound "vo_lost2"
DMD "", "", "dmdlost", eNone, eNone, eNone, 400, True, ""
vpmtimer.addtimer 400, "endofballput '"
vpmtimer.addtimer 2500, "EndOfBallcontinue '"
end if
if UpdateMusic = 2 Then
playsound "vo_lost3"
DMD "", "", "dmdlost", eNone, eNone, eNone, 600, True, ""
vpmtimer.addtimer 600, "endofballput '"
vpmtimer.addtimer 2700, "EndOfBallcontinue '"
end if
if UpdateMusic = 3 Then
playsound "vo_lost4"
DMD "", "", "dmdlost", eNone, eNone, eNone, 400, True, ""
vpmtimer.addtimer 400, "endofballput '"
vpmtimer.addtimer 2500, "EndOfBallcontinue '"
end if
if UpdateMusic = 4 Then
playsound "vo_lost5"
DMD "", "", "dmdlost", eNone, eNone, eNone, 600, True, ""
vpmtimer.addtimer 600, "endofballput '"
vpmtimer.addtimer 2700, "EndOfBallcontinue '"
end if
'endofballput
if matruskamode = 1 Then
Resettargets1
end if
stalinstart = 0

end sub

    ' only process any of this if the table is not tilted.  (the tilt recovery
    ' mechanism will handle any extra balls or end of game)

	'LightSeqAttract.Play SeqBlinking, , 5, 150

Sub EndOfBallcontinue
'bonuscheckie

    Dim AwardPoints, TotalBonus, ii
    AwardPoints = 0
    TotalBonus = 0

    'If NOT Tilted Then
	If(Tilted = False) Then
		
        'Number of Target hits
        AwardPoints = TargetBonus * 20
        TotalBonus = TotalBonus + AwardPoints
        DMD CL(0, FormatScore(AwardPoints)), CL(1, "TARGET BONUS " & TargetBonus), "", eBlink, eNone, eNone, 940, False, "bonus1"

        AwardPoints = HoleBonus * 200
        TotalBonus = TotalBonus + AwardPoints
        DMD CL(0, FormatScore(AwardPoints)), CL(1, "KICKER BONUS " & HoleBonus), "", eBlink, eNone, eNone, 940, False, "bonus2"


		DMD CL(0, FormatScore(TotalBonus) ), CL(1, "TOTAL BONUS" & BonusMultiplier(CurrentPlayer) ), "", eBlinkFast, eNone, eNone, 750, True, "bonus3"
        TotalBonus = TotalBonus * BonusMultiplier(CurrentPlayer)
        
		AddScore TotalBonus

		' add a bit of a delay to allow for the bonus points to be shown & added up
		vpmtimer.addtimer 3000, "EndOfBall2 '"
    Else 'Si hay falta simplemente espera un momento y va directo a la segunta parte después de perder la bola
'		BonusDelayTime = 100
		EndOfBall2
    End If
	'vpmtimer.addtimer BonusDelayTime, "EndOfBall2 '"
End Sub

' The Timer which delays the machine to allow any bonus points to be added up
' has expired.  Check to see if there are any extra balls for this player.
' if not, then check to see if this was the last ball (of the CurrentPlayer)
'
Sub EndOfBall2()
    ' if were tilted, reset the internal tilted flag (this will also
    ' set TiltWarnings back to zero) which is useful if we are changing player LOL
    UpdateMusic = UpdateMusic + 1
	UpdateMusicNow	
    Tilted = False
    Tilt = 0
    DisableTable False 'enable again bumpers and slingshots

    ' has the player won an extra-ball ? (might be multiple outstanding)
    If(ExtraBallsAwards(CurrentPlayer) <> 0) Then
        'debug.print "Extra Ball"

        ' yep got to give it to them
        ExtraBallsAwards(CurrentPlayer) = ExtraBallsAwards(CurrentPlayer) - 1

        ' if no more EB's then turn off any shoot again light
        If(ExtraBallsAwards(CurrentPlayer) = 0) Then
            LightShootAgain.State = 0
        End If

        ' You may wish to do a bit of a song AND dance at this point
        DMD CL(0, "EXTRA BALL"), CL(1, "SHOOT AGAIN"), "", eNone, eNone, eBlink, 1000, True, "vo_extraball"

		UpdateMusic = UpdateMusic - 1
		UpdateMusicNow

        ' reset the playfield for the new ball
        ResetForNewPlayerBall()
		
		' set the dropped wall for bonus

		
        ' Create a new ball in the shooters lane
        CreateNewBall()
    Else ' no extra balls

        BallsRemaining(CurrentPlayer) = BallsRemaining(CurrentPlayer) - 1

        ' was that the last ball ?
        If(BallsRemaining(CurrentPlayer) <= 0) Then
            'debug.print "No More Balls, High Score Entry"

            ' Submit the CurrentPlayers score to the High Score system
            CheckHighScore()
        ' you may wish to play some music at this point

        Else

            ' not the last ball (for that player)
            ' if multiple players are playing then move onto the next one
            EndOfBallComplete()
        End If
    End If
End Sub

' This function is called when the end of bonus display
' (or high score entry finished) AND it either end the game or
' move onto the next player (or the next ball of the same player)
'
Sub EndOfBallComplete()
    Dim NextPlayer

    'debug.print "EndOfBall - Complete"

    ' are there multiple players playing this game ?
    If(PlayersPlayingGame> 1) Then
        ' then move to the next player
        NextPlayer = CurrentPlayer + 1
        ' are we going from the last player back to the first
        ' (ie say from player 4 back to player 1)
        If(NextPlayer> PlayersPlayingGame) Then
            NextPlayer = 1
        End If
    Else
        NextPlayer = CurrentPlayer
    End If

    'debug.print "Next Player = " & NextPlayer

    ' is it the end of the game ? (all balls been lost for all players)
    If((BallsRemaining(CurrentPlayer) <= 0) AND(BallsRemaining(NextPlayer) <= 0) ) Then
        ' you may wish to do some sort of Point Match free game award here
        ' generally only done when not in free play mode
		StopSong
		'DMD CL(0, "GAME OVER") "", eNone, 13000, True, ""
'DMD "", CL(1, "GAME OVER"), "", eNone, eNone, eNone, 11000, False, ""
		PlaySound "gameover"
DMD CL(0, "BULLETS"), CL(1, "FIRED " &Bbullits), "", eNone, eNone, eNone, 1200, True, ""
DMD CL(0, "KGB"), CL(1, "LEVEL " &Bkgbl), "", eNone, eNone, eNone, 1200, True, ""
DMD CL(0, "NUKES"), CL(1, "DESTROYED " &Bnukes), "", eNone, eNone, eNone, 1200, True, ""
DMD CL(0, "BEARS"), CL(1, "FOUGHT " &BBearfight), "", eNone, eNone, eNone, 1200, True, ""
DMD CL(0, "BOSSES"), CL(1, "COMPLETED " &Bbosses), "", eNone, eNone, eNone, 1200, True, ""
DMD "", "", "GOP00", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP01", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP02", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP03", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP04", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP05", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP06", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP07", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP08", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP09", eNone, eNone, eNone, 100, True, ""
DMD "", "", "GOP10", eNone, eNone, eNone, 100, True, ""
DMD "", "", "gameover", eNone, eNone, eNone, 3900, True, "" 
       ' set the machine into game over mode
        vpmtimer.addtimer 11000, "EndOfGame() '"

    ' you may wish to put a Game Over message on the desktop/backglass

    Else
        ' set the next player
        CurrentPlayer = NextPlayer

        ' make sure the correct display is up to date
        DMDScoreNow

        ' reset the playfield for the new player (or new ball)
        ResetForNewPlayerBall()

        ' AND create a new ball
        CreateNewBall()

        ' play a sound if more than 1 player
        If PlayersPlayingGame> 1 Then
            PlaySound "vo_player" &CurrentPlayer
            DMD "_", CL(1, "PLAYER " &CurrentPlayer), "", eNone, eNone, eNone, 800, True, ""
        End If
    End If
End Sub

' This function is called at the End of the Game, it should reset all
' Drop targets, AND eject any 'held' balls, start any attract sequences etc..

Sub EndOfGame()
    LightSeqAttract.StopPlay
	'debug.print "End Of Game"
    bGameInPLay = False
    ' just ended your game then play the end of game tune
    If NOT bJustStarted Then
        ChangeSong
    End If

    bJustStarted = False
    ' ensure that the flippers are down
    SolLFlipper 0
    SolRFlipper 0

    ' terminate all Mode - eject locked balls
    ' most of the Mode/timers terminate at the end of the ball

    ' set any lights for the attract mode
    GiOff
    StartAttractMode
' you may wish to light any Game Over Light you may have
End Sub

Function Balls
    Dim tmp
    tmp = BallsPerGame - BallsRemaining(CurrentPlayer) + 1
    If tmp> BallsPerGame Then
        Balls = BallsPerGame
    Else
        Balls = tmp
    End If
End Function

' *********************************************************************
'                      Drain / Plunger Functions
' *********************************************************************

' lost a ball ;-( check to see how many balls are on the playfield.
' if only one then decrement the remaining count AND test for End of game
' if more than 1 ball (multi-ball) then kill of the ball but don't create
' a new one
'
Sub Drain_Hit()
    ' Destroy the ball
    Drain.DestroyBall
    BallsOnPlayfield = BallsOnPlayfield - 1 
	'If BallsOnPlayfield<2 Then
	'Multiball=false
	'end if
	
    ' pretend to knock the ball into the ball storage mech
    PlaySoundAt "fx_drain", Drain
    'if Tilted then end Ball Mode
    If Tilted Then
        StopEndOfBallMode
    End If

    ' if there is a game in progress AND it is not Tilted
    If(bGameInPLay = True) AND(Tilted = False) Then

        ' is the ball saver active,
        If(bBallSaverActive = True) Then
			AddMultiball 1
			bAutoPlunger = True
            ' yep, create a new ball in the shooters lane
            ' we use the Addmultiball in case the multiballs are being ejected
			DMD CL(0, "BALL SAVED"), CL(1, "SHOOT AGAIN"), "", eBlink, eBlink, eNone, 800, True, ""
			'vpmtimer.addtimer 1250, "CreateNewBall() '"
           ' you may wish to put something on a display or play a sound at this point
        Else
			If(BallsOnPlayfield = 1)Then
                ' AND in a multi-ball??
                If(bMultiBallMode = True)then
                    ' not in multiball mode any more
                    bMultiBallMode = False
                    ' you may wish to change any music over at this point and
                    ' turn off any multiball specific lights
					ChangeSong
                End If
            End If
            ' was that the last ball on the playfield
            If(BallsOnPlayfield = 0) Then
                ' End Mode and timers
				StopSong
				PlaySound ""
                'vpmtimer.addtimer 3000, "ChangeSong '"
                ' Show the end of ball animation
                ' and continue with the end of ball
                ' DMD something?
                StopEndOfBallMode
                vpmtimer.addtimer 200, "EndOfBall '" 'the delay is depending of the animation of the end of ball, since there is no animation then move to the end of ball
            End If
        End If
    End If
End Sub



' The Ball has rolled out of the Plunger Lane and it is pressing down the trigger in the shooters lane
' Check to see if a ball saver mechanism is needed and if so fire it up.

Sub Trigger1_Hit()
If bAutoPlunger Then
        'debug.print "autofire the ball"
        PlungerIM.AutoFire
        DOF 121, DOFPulse
        PlaySoundAt "fx_fire", Trigger1
        bAutoPlunger = False
    End If	
'StopSong
    DMDScoreNow
    bBallInPlungerLane = True
'if shootB1 = 0 then
'playsound "shootyball"
'end if
'shootB1=1
DMD "", "", "dmdshooter", eNone, eNone, eNone, 5000, true, ""
'    DMD "_", CL(1, "SHOOT COMRADE"), "", eNone, eBlink, eNone, 1000, True, ""
    If(bBallSaverReady = True) AND(BallSaverTime <> 0) And(bBallSaverActive = False) Then
        EnableBallSaver BallSaverTime
        Else
        ' show the message to shoot the ball in case the player has fallen sleep
        Trigger1.TimerEnabled = 1
    End If
End Sub

' The ball is released from the plunger

Sub Trigger1_UnHit()
    bBallInPlungerLane = False
	DMDScoreNow
'shootB1=0
    'LightEffect 4
	'ChangeSong
End Sub


Sub Trigger1_Timer
	'DMD "", "", "dmdshooter", eNone, eNone, eNone, 5000, true, ""
    trigger1.TimerEnabled = 0
End Sub

Sub EnableBallSaver(seconds)
    'debug.print "Ballsaver started"
    ' set our game flag
    bBallSaverActive = True
    bBallSaverReady = False
    ' start the timer
    BallSaverTimer.Interval = 1000 * seconds
    BallSaverTimer.Enabled = True
    BallSaverSpeedUpTimer.Interval = 1000 * seconds -(1000 * seconds) / 3
    BallSaverSpeedUpTimer.Enabled = True
    ' if you have a ball saver light you might want to turn it on at this point (or make it flash)
    LightShootAgain.BlinkInterval = 160
    LightShootAgain.State = 2
End Sub

' The ball saver timer has expired.  Turn it off AND reset the game flag
'
Sub BallSaverTimer_Timer()
    'debug.print "Ballsaver ended"
    BallSaverTimer.Enabled = False
    ' clear the flag
    bBallSaverActive = False
    ' if you have a ball saver light then turn it off at this point
   LightShootAgain.State = 0
End Sub

Sub BallSaverSpeedUpTimer_Timer()
    'debug.print "Ballsaver Speed Up Light"
    BallSaverSpeedUpTimer.Enabled = False
    ' Speed up the blinking
    LightShootAgain.BlinkInterval = 80
    LightShootAgain.State = 2
End Sub

' *********************************************************************
'                      Supporting Score Functions
' *********************************************************************

' Add points to the score AND update the score board
Sub AddScore(points)
    If Tilted Then Exit Sub

    ' add the points to the current players score variable
    Score(CurrentPlayer) = Score(CurrentPlayer) + points

    ' play a sound for each score
	PlaySound "tone"&points

    ' you may wish to check to see if the player has gotten an extra ball by a high score
  '  If Score(CurrentPlayer) >= Special1 AND Special1Awarded(CurrentPlayer) = False Then
   '     AwardExtraBall
    '    Special1Awarded(CurrentPlayer) = True
   ' End If
    'If Score(CurrentPlayer) >= Special2 AND Special2Awarded(CurrentPlayer) = False Then
     '   AwardExtraBall
      '  Special2Awarded(CurrentPlayer) = True
    'End If
    'If Score(CurrentPlayer) >= Special3 AND Special3Awarded(CurrentPlayer) = False Then
     '   AwardExtraBall
      '  Special3Awarded(CurrentPlayer) = True
    'End If
End Sub

' Add bonus to the bonuspoints AND update the score board
Sub AddBonus(points) 'not used in this table, since there are many different bonus items.
    If(Tilted = False) Then
        ' add the bonus to the current players bonus variable
        BonusPoints(CurrentPlayer) = BonusPoints(CurrentPlayer) + points
    End if
End Sub

Sub AwardExtraBall()
    DMD "_", CL(1, ("EXTRA BALL WON") ), "", eNone, eBlink, eNone, 1000, True, SoundFXDOF("fx_Knocker", 122, DOFPulse, DOFKnocker)
    DOF 121, DOFPulse
    ExtraBallsAwards(CurrentPlayer) = ExtraBallsAwards(CurrentPlayer) + 1
    LightShootAgain.State = 1
    LightEffect 2
End Sub

'*****************************
'    Load / Save / Highscore
'*****************************

Sub Loadhs
    Dim x
    x = LoadValue(TableName, "HighScore1")
    If(x <> "") Then HighScore(0) = CDbl(x) Else HighScore(0) = 100000 End If
    x = LoadValue(TableName, "HighScore1Name")
    If(x <> "") Then HighScoreName(0) = x Else HighScoreName(0) = "AAA" End If
    x = LoadValue(TableName, "HighScore2")
    If(x <> "") then HighScore(1) = CDbl(x) Else HighScore(1) = 100000 End If
    x = LoadValue(TableName, "HighScore2Name")
    If(x <> "") then HighScoreName(1) = x Else HighScoreName(1) = "BBB" End If
    x = LoadValue(TableName, "HighScore3")
    If(x <> "") then HighScore(2) = CDbl(x) Else HighScore(2) = 100000 End If
    x = LoadValue(TableName, "HighScore3Name")
    If(x <> "") then HighScoreName(2) = x Else HighScoreName(2) = "CCC" End If
    x = LoadValue(TableName, "HighScore4")
    If(x <> "") then HighScore(3) = CDbl(x) Else HighScore(3) = 100000 End If
    x = LoadValue(TableName, "HighScore4Name")
    If(x <> "") then HighScoreName(3) = x Else HighScoreName(3) = "DDD" End If
    x = LoadValue(TableName, "Credits")
    If(x <> "") then Credits = CInt(x) Else Credits = 0:If bFreePlay = False Then DOF 125, DOFOff:End If
    x = LoadValue(TableName, "TotalGamesPlayed")
    If(x <> "") then TotalGamesPlayed = CInt(x) Else TotalGamesPlayed = 0 End If
End Sub

Sub Savehs
    SaveValue TableName, "HighScore1", HighScore(0)
    SaveValue TableName, "HighScore1Name", HighScoreName(0)
    SaveValue TableName, "HighScore2", HighScore(1)
    SaveValue TableName, "HighScore2Name", HighScoreName(1)
    SaveValue TableName, "HighScore3", HighScore(2)
    SaveValue TableName, "HighScore3Name", HighScoreName(2)
    SaveValue TableName, "HighScore4", HighScore(3)
    SaveValue TableName, "HighScore4Name", HighScoreName(3)
    SaveValue TableName, "Credits", Credits
    SaveValue TableName, "TotalGamesPlayed", TotalGamesPlayed
End Sub

Sub Reseths
    HighScoreName(0) = "AAA"
    HighScoreName(1) = "BBB"
    HighScoreName(2) = "CCC"
    HighScoreName(3) = "DDD"
    HighScore(0) = 200000
    HighScore(1) = 150000
    HighScore(2) = 100000
    HighScore(3) = 50000
    Savehs
End Sub

' ***********************************************************
'  High Score Initals Entry Functions - based on Black's code
' ***********************************************************

Dim hsbModeActive
Dim hsEnteredName
Dim hsEnteredDigits(3)
Dim hsCurrentDigit
Dim hsValidLetters
Dim hsCurrentLetter
Dim hsLetterFlash

Sub CheckHighscore()
    Dim tmp
    tmp = Score(1)
    If Score(2)> tmp Then tmp = Score(2)
    If Score(3)> tmp Then tmp = Score(3)
    If Score(4)> tmp Then tmp = Score(4)

    'If tmp > HighScore(1)Then 'add 1 credit for beating the highscore
    '    Credits = Credits + 1
    '    DOF 125, DOFOn
    'End If

    If tmp> HighScore(3) Then
        'PlaySound SoundFXDOF("fx_Knocker", 122, DOFPulse, DOFKnocker)
        DOF 121, DOFPulse
        HighScore(3) = tmp
        'enter player's name
        HighScoreEntryInit()
    Else
        EndOfBallComplete()
    End If
End Sub

Sub HighScoreEntryInit()
    hsbModeActive = True
    ChangeSong
	PlaySound "vo_soviet_high_score"
    hsLetterFlash = 0

    hsEnteredDigits(0) = " "
    hsEnteredDigits(1) = " "
    hsEnteredDigits(2) = " "
    hsCurrentDigit = 0

    'hsValidLetters = " ABCDEFGHIJKLMNOPQRSTUVWXYZ'<>*+-/=\^0123456789`" ' ` is back arrow
	hsValidLetters = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789<" ' < is back arrow JP FLEX FIX
    hsCurrentLetter = 1
    DMDFlush()
    HighScoreDisplayNameNow()

    HighScoreFlashTimer.Interval = 250
    HighScoreFlashTimer.Enabled = True
End Sub

Sub EnterHighScoreKey(keycode)
    If keycode = LeftFlipperKey Then
        playsound "fx_links"
        hsCurrentLetter = hsCurrentLetter - 1
        if(hsCurrentLetter = 0) then
            hsCurrentLetter = len(hsValidLetters)
        end if
        HighScoreDisplayNameNow()
    End If

    If keycode = RightFlipperKey Then
        playsound "fx_rechts"
        hsCurrentLetter = hsCurrentLetter + 1
        if(hsCurrentLetter> len(hsValidLetters) ) then
            hsCurrentLetter = 1
        end if
        HighScoreDisplayNameNow()
    End If

    If keycode = StartGameKey Then
        'if(mid(hsValidLetters, hsCurrentLetter, 1) <> "`") then
		if(mid(hsValidLetters, hsCurrentLetter, 1) <> "<") then 'JP FLEX FIX
            playsound "pling"
            hsEnteredDigits(hsCurrentDigit) = mid(hsValidLetters, hsCurrentLetter, 1)
            hsCurrentDigit = hsCurrentDigit + 1
            if(hsCurrentDigit = 3) then
                HighScoreCommitName()
            else
                HighScoreDisplayNameNow()
            end if
        else
            playsound "fx_Esc"
            hsEnteredDigits(hsCurrentDigit) = " "
            if(hsCurrentDigit> 0) then
                hsCurrentDigit = hsCurrentDigit - 1
            end if
            HighScoreDisplayNameNow()
        end if
    end if
End Sub

Sub HighScoreDisplayNameNow()
    HighScoreFlashTimer.Enabled = False
    hsLetterFlash = 0
    HighScoreDisplayName()
    HighScoreFlashTimer.Enabled = True
End Sub

Sub HighScoreDisplayName()
    Dim i
    Dim TempTopStr
    Dim TempBotStr

    TempTopStr = "YOUR NAME:"
    dLine(0) = ExpandLine(TempTopStr, 0)
    DMDUpdate 0

    TempBotStr = "    > "
    if(hsCurrentDigit> 0) then TempBotStr = TempBotStr & hsEnteredDigits(0)
    if(hsCurrentDigit> 1) then TempBotStr = TempBotStr & hsEnteredDigits(1)
    if(hsCurrentDigit> 2) then TempBotStr = TempBotStr & hsEnteredDigits(2)

    if(hsCurrentDigit <> 3) then
        if(hsLetterFlash <> 0) then
            TempBotStr = TempBotStr & "_"
        else
            TempBotStr = TempBotStr & mid(hsValidLetters, hsCurrentLetter, 1)
        end if
    end if

    if(hsCurrentDigit <1) then TempBotStr = TempBotStr & hsEnteredDigits(1)
    if(hsCurrentDigit <2) then TempBotStr = TempBotStr & hsEnteredDigits(2)

    TempBotStr = TempBotStr & " <    "
    dLine(1) = ExpandLine(TempBotStr, 1)
    DMDUpdate 1
End Sub

Sub HighScoreFlashTimer_Timer()
    HighScoreFlashTimer.Enabled = False
    hsLetterFlash = hsLetterFlash + 1
    if(hsLetterFlash = 2) then hsLetterFlash = 0
    HighScoreDisplayName()
    HighScoreFlashTimer.Enabled = True
End Sub

Sub HighScoreCommitName()
    HighScoreFlashTimer.Enabled = False
    hsbModeActive = False
    ChangeSong
    hsEnteredName = hsEnteredDigits(0) & hsEnteredDigits(1) & hsEnteredDigits(2)
    if(hsEnteredName = "   ") then
        hsEnteredName = "YOU"
    end if

    HighScoreName(3) = hsEnteredName
    SortHighscore
    EndOfBallComplete()
End Sub

Sub SortHighscore
    Dim tmp, tmp2, i, j
    For i = 0 to 3
        For j = 0 to 2
            If HighScore(j) <HighScore(j + 1) Then
                tmp = HighScore(j + 1)
                tmp2 = HighScoreName(j + 1)
                HighScore(j + 1) = HighScore(j)
                HighScoreName(j + 1) = HighScoreName(j)
                HighScore(j) = tmp
                HighScoreName(j) = tmp2
            End If
        Next
    Next
End Sub

' *************************************************************************
'   JP's Reduced Display Driver Functions (based on script by Black)
' only 5 effects: none, scroll left, scroll right, blink and blinkfast
' 3 Lines, treats all 3 lines as text. 3rd line is just 1 character
' Example format:
' DMD "text1","text2","backpicture", eNone, eNone, eNone, 250, True, "sound"
' Short names:
' dq = display queue
' de = display effect
' *************************************************************************

Const eNone = 0        ' Instantly displayed
Const eScrollLeft = 1  ' scroll on from the right
Const eScrollRight = 2 ' scroll on from the left
Const eBlink = 3       ' Blink (blinks for 'TimeOn')
Const eBlinkFast = 4   ' Blink (blinks for 'TimeOn') at user specified intervals (fast speed)

Const dqSize = 64

Dim dqHead
Dim dqTail
Dim deSpeed
Dim deBlinkSlowRate
Dim deBlinkFastRate

Dim dCharsPerLine(2)
Dim dLine(2)
Dim deCount(2)
Dim deCountEnd(2)
Dim deBlinkCycle(2)

Dim dqText(2, 64)
Dim dqEffect(2, 64)
Dim dqTimeOn(64)
Dim dqbFlush(64)
Dim dqSound(64)

Dim FlexDMD
Dim DMDScene

Sub DMD_Init() 'default/startup values
    If UseFlexDMD Then
        Set FlexDMD = CreateObject("FlexDMD.FlexDMD")
        If Not FlexDMD is Nothing Then
            FlexDMD.TableFile = Table1.Filename & ".vpx"
            FlexDMD.RenderMode = 2
            FlexDMD.Width = 128
            FlexDMD.Height = 32
            FlexDMD.Clear = True
            FlexDMD.GameName = cGameName
            FlexDMD.Run = True
            Set DMDScene = FlexDMD.NewGroup("Scene")
            DMDScene.AddActor FlexDMD.NewImage("Back", "VPX.bkempty")
            DMDScene.GetImage("Back").SetSize FlexDMD.Width, FlexDMD.Height
            For i = 0 to 35
                DMDScene.AddActor FlexDMD.NewImage("Dig" & i, "VPX.dempty&dmd=2")
                Digits(i).Visible = False
            Next
            'digitgrid.Visible = False
            For i = 0 to 19 ' Top
                DMDScene.GetImage("Dig" & i).SetBounds 4 + i * 6, 3 + 16 + 2, 8, 8
            Next
            For i = 20 to 35 ' Bottom
                DMDScene.GetImage("Dig" & i).SetBounds 8 * (i - 20), 3, 8, 16
            Next
            FlexDMD.LockRenderThread
            FlexDMD.Stage.AddActor DMDScene
            FlexDMD.UnlockRenderThread
        End If
    End If


'Sub DMD_Init() 'default/startup values
    Dim i, j
    DMDFlush()
    deSpeed = 20
    deBlinkSlowRate = 5
    deBlinkFastRate = 2
    dCharsPerLine(0) = 16 'characters lower line
    dCharsPerLine(1) = 20 'characters top line
    dCharsPerLine(2) = 1  'characters back line
    For i = 0 to 2
        dLine(i) = Space(dCharsPerLine(i) )
        deCount(i) = 0
        deCountEnd(i) = 0
        deBlinkCycle(i) = 0
        dqTimeOn(i) = 0
        dqbFlush(i) = True
        dqSound(i) = ""
    Next
    For i = 0 to 2
        For j = 0 to 64
            dqText(i, j) = ""
            dqEffect(i, j) = eNone
        Next
    Next
    DMD dLine(0), dLine(1), dLine(2), eNone, eNone, eNone, 25, True, ""
End Sub

Sub DMDFlush()
    Dim i
    DMDTimer.Enabled = False
    DMDEffectTimer.Enabled = False
    dqHead = 0
    dqTail = 0
    For i = 0 to 2
        deCount(i) = 0
        deCountEnd(i) = 0
        deBlinkCycle(i) = 0
    Next
End Sub

Sub DMDScore()
    Dim tmp, tmp1, tmp2
    if(dqHead = dqTail) Then
        tmp = RL(0, FormatScore(Score(Currentplayer) ) )
        tmp1 = CL(1, "PLAYER " & CurrentPlayer & "  BALL " & Balls)
        tmp2 = "bkborder"
    End If
    DMD tmp, tmp1, tmp2, eNone, eNone, eNone, 25, True, ""
End Sub

Sub DMDScoreNow
    DMDFlush
    DMDScore
End Sub

Sub DMD(Text0, Text1, Text2, Effect0, Effect1, Effect2, TimeOn, bFlush, Sound)
    if(dqTail <dqSize) Then
        if(Text0 = "_") Then
            dqEffect(0, dqTail) = eNone
            dqText(0, dqTail) = "_"
        Else
            dqEffect(0, dqTail) = Effect0
            dqText(0, dqTail) = ExpandLine(Text0, 0)
        End If

        if(Text1 = "_") Then
            dqEffect(1, dqTail) = eNone
            dqText(1, dqTail) = "_"
        Else
            dqEffect(1, dqTail) = Effect1
            dqText(1, dqTail) = ExpandLine(Text1, 1)
        End If

        if(Text2 = "_") Then
            dqEffect(2, dqTail) = eNone
            dqText(2, dqTail) = "_"
        Else
            dqEffect(2, dqTail) = Effect2
            dqText(2, dqTail) = Text2 'it is always 1 letter in this table
        End If

        dqTimeOn(dqTail) = TimeOn
        dqbFlush(dqTail) = bFlush
        dqSound(dqTail) = Sound
        dqTail = dqTail + 1
        if(dqTail = 1) Then
            DMDHead()
        End If
    End If
End Sub

Sub DMDHead()
    Dim i
    deCount(0) = 0
    deCount(1) = 0
    deCount(2) = 0
    DMDEffectTimer.Interval = deSpeed

    For i = 0 to 2
        Select Case dqEffect(i, dqHead)
            Case eNone:deCountEnd(i) = 1
            Case eScrollLeft:deCountEnd(i) = Len(dqText(i, dqHead) )
            Case eScrollRight:deCountEnd(i) = Len(dqText(i, dqHead) )
            Case eBlink:deCountEnd(i) = int(dqTimeOn(dqHead) / deSpeed)
                deBlinkCycle(i) = 0
            Case eBlinkFast:deCountEnd(i) = int(dqTimeOn(dqHead) / deSpeed)
                deBlinkCycle(i) = 0
        End Select
    Next
    if(dqSound(dqHead) <> "") Then
        PlaySound(dqSound(dqHead) )
    End If
    DMDEffectTimer.Enabled = True
End Sub

Sub DMDEffectTimer_Timer()
    DMDEffectTimer.Enabled = False
    DMDProcessEffectOn()
End Sub

Sub DMDTimer_Timer()
    Dim Head
    DMDTimer.Enabled = False
    Head = dqHead
    dqHead = dqHead + 1
    if(dqHead = dqTail) Then
        if(dqbFlush(Head) = True) Then
            DMDScoreNow()
        Else
            dqHead = 0
            DMDHead()
        End If
    Else
        DMDHead()
    End If
End Sub

Sub DMDProcessEffectOn()
    Dim i
    Dim BlinkEffect
    Dim Temp

    BlinkEffect = False

    For i = 0 to 2
        if(deCount(i) <> deCountEnd(i) ) Then
            deCount(i) = deCount(i) + 1

            select case(dqEffect(i, dqHead) )
                case eNone:
                    Temp = dqText(i, dqHead)
                case eScrollLeft:
                    Temp = Right(dLine(i), dCharsPerLine(i) - 1)
                    Temp = Temp & Mid(dqText(i, dqHead), deCount(i), 1)
                case eScrollRight:
                    Temp = Mid(dqText(i, dqHead), (dCharsPerLine(i) + 1) - deCount(i), 1)
                    Temp = Temp & Left(dLine(i), dCharsPerLine(i) - 1)
                case eBlink:
                    BlinkEffect = True
                    if((deCount(i) MOD deBlinkSlowRate) = 0) Then
                        deBlinkCycle(i) = deBlinkCycle(i) xor 1
                    End If

                    if(deBlinkCycle(i) = 0) Then
                        Temp = dqText(i, dqHead)
                    Else
                        Temp = Space(dCharsPerLine(i) )
                    End If
                case eBlinkFast:
                    BlinkEffect = True
                    if((deCount(i) MOD deBlinkFastRate) = 0) Then
                        deBlinkCycle(i) = deBlinkCycle(i) xor 1
                    End If

                    if(deBlinkCycle(i) = 0) Then
                        Temp = dqText(i, dqHead)
                    Else
                        Temp = Space(dCharsPerLine(i) )
                    End If
            End Select

            if(dqText(i, dqHead) <> "_") Then
                dLine(i) = Temp
                DMDUpdate i
            End If
        End If
    Next

    if(deCount(0) = deCountEnd(0) ) and(deCount(1) = deCountEnd(1) ) and(deCount(2) = deCountEnd(2) ) Then

        if(dqTimeOn(dqHead) = 0) Then
            DMDFlush()
        Else
            if(BlinkEffect = True) Then
                DMDTimer.Interval = 10
            Else
                DMDTimer.Interval = dqTimeOn(dqHead)
            End If

            DMDTimer.Enabled = True
        End If
    Else
        DMDEffectTimer.Enabled = True
    End If
End Sub

Function ExpandLine(TempStr, id) 'id is the number of the dmd line
    If TempStr = "" Then
        TempStr = Space(dCharsPerLine(id) )
    Else
        if(Len(TempStr)> Space(dCharsPerLine(id) ) ) Then
            TempStr = Left(TempStr, Space(dCharsPerLine(id) ) )
        Else
            if(Len(TempStr) <dCharsPerLine(id) ) Then
                TempStr = TempStr & Space(dCharsPerLine(id) - Len(TempStr) )
            End If
        End If
    End If
    ExpandLine = TempStr
End Function

Function FormatScore(ByVal Num) 'it returns a string with commas (as in Black's original font)
    dim i
    dim NumString

    NumString = CStr(abs(Num) )

    For i = Len(NumString) -3 to 1 step -3
        if IsNumeric(mid(NumString, i, 1) ) then
            NumString = left(NumString, i-1) & chr(asc(mid(NumString, i, 1) ) + 48) & right(NumString, Len(NumString) - i)
        end if
    Next
    FormatScore = NumString
End function

Function CL(id, NumString)
    Dim Temp, TempStr
    Temp = (dCharsPerLine(id) - Len(NumString) ) \ 2
    TempStr = Space(Temp) & NumString & Space(Temp)
    CL = TempStr
End Function

Function RL(id, NumString)
    Dim Temp, TempStr
    Temp = dCharsPerLine(id) - Len(NumString)
    TempStr = Space(Temp) & NumString
    RL = TempStr
End Function

'**************
' Update DMD
'**************

Sub DMDUpdate(id)
    Dim digit, value
    If UseFlexDMD Then FlexDMD.LockRenderThread
    Select Case id
        Case 0 'top text line
            For digit = 20 to 35
                DMDDisplayChar mid(dLine(0), digit-19, 1), digit
            Next
        Case 1 'bottom text line
            For digit = 0 to 19
                DMDDisplayChar mid(dLine(1), digit + 1, 1), digit
            Next
        Case 2 ' back image - back animations
            If dLine(2) = "" OR dLine(2) = " " Then dLine(2) = "bkempty"
            DigitsBack(0).ImageA = dLine(2)
            If UseFlexDMD Then DMDScene.GetImage("Back").Bitmap = FlexDMD.NewImage("", "VPX." & dLine(2) & "&dmd=2").Bitmap
    End Select
    If UseFlexDMD Then FlexDMD.UnlockRenderThread
End Sub

Sub DMDDisplayChar(achar, adigit)
    If achar = "" Then achar = " "
    achar = ASC(achar)
    Digits(adigit).ImageA = Chars(achar)
    If UseFlexDMD Then DMDScene.GetImage("Dig" & adigit).Bitmap = FlexDMD.NewImage("", "VPX." & Chars(achar) & "&dmd=2&add").Bitmap
End Sub

'****************************
' JP's new DMD using flashers
'****************************

Dim Digits, DigitsBack, Chars(255), Images(255)

DMDInit

Sub DMDInit
    Dim i
    'If Table1.ShowDT = true then
        Digits = Array(digit0, digit1, digit2, digit3, digit4, digit5, digit6, digit7, digit8, digit9, digit10, digit11,                  _
            digit12, digit13, digit14, digit15, digit16, digit17, digit18, digit19, digit20, digit21, digit22, digit23, digit24, digit25, _
            digit26, digit27, digit28, digit29, digit30, digit31, digit32, digit33, digit34, digit35)
        DigitsBack = Array(digit36)

    For i = 0 to 255:Chars(i)  = "dempty":Next '= "dempty":Images(i) = "dempty":Next

    Chars(32) = "dempty"
    '    Chars(34) = '"
    '    Chars(36) = '$
    '    Chars(39) = ''
    '    Chars(42) = '*
    '    Chars(43) = '+
    '    Chars(45) = '-
    '    Chars(47) = '/
    Chars(48) = "d0"       '0
    Chars(49) = "d1"       '1
    Chars(50) = "d2"       '2
    Chars(51) = "d3"       '3
    Chars(52) = "d4"       '4
    Chars(53) = "d5"       '5
    Chars(54) = "d6"       '6
    Chars(55) = "d7"       '7
    Chars(56) = "d8"       '8
    Chars(57) = "d9"       '9
    Chars(60) = "dless"    '<
    Chars(61) = "dequal"   '=
    Chars(62) = "dgreater" '>
    '   Chars(64) = '@
    Chars(65) = "da" 'A
    Chars(66) = "db" 'B
    Chars(67) = "dc" 'C
    Chars(68) = "dd" 'D
    Chars(69) = "de" 'E
    Chars(70) = "df" 'F
    Chars(71) = "dg" 'G
    Chars(72) = "dh" 'H
    Chars(73) = "di" 'I
    Chars(74) = "dj" 'J
    Chars(75) = "dk" 'K
    Chars(76) = "dl" 'L
    Chars(77) = "dm" 'M
    Chars(78) = "dn" 'N
    Chars(79) = "do" 'O
    Chars(80) = "dp" 'P
    Chars(81) = "dq" 'Q
    Chars(82) = "dr" 'R
    Chars(83) = "ds" 'S
    Chars(84) = "dt" 'T
    Chars(85) = "du" 'U
    Chars(86) = "dv" 'V
    Chars(87) = "dw" 'W
    Chars(88) = "dx" 'X
    Chars(89) = "dy" 'Y
    Chars(90) = "dz" 'Z
    'Chars(91) = "dball" '[
    'Chars(92) = "dcoin" '|
    'Chars(93) = "dpika" ']
    '    Chars(94) = '^
    '    Chars(95) = '_
    Chars(96) = "d0a"  '0.
    Chars(97) = "d1a"  '1.
    Chars(98) = "d2a"  '2.
    Chars(99) = "d3a"  '3.
    Chars(100) = "d4a" '4.
    Chars(101) = "d5a" '5.
    Chars(102) = "d6a" '6.
    Chars(103) = "d7a" '7.
    Chars(104) = "d8a" '8.
    Chars(105) = "d9a" '9
End Sub

'********************************************************************************************
' Only for VPX 10.2 and higher.
' FlashForMs will blink light or a flasher for TotalPeriod(ms) at rate of BlinkPeriod(ms)
' When TotalPeriod done, light or flasher will be set to FinalState value where
' Final State values are:   0=Off, 1=On, 2=Return to previous State
'********************************************************************************************

Sub FlashForMs(MyLight, TotalPeriod, BlinkPeriod, FinalState) 'thanks gtxjoe for the first version

    If TypeName(MyLight) = "Light" Then

        If FinalState = 2 Then
            FinalState = MyLight.State 'Keep the current light state
        End If
        MyLight.BlinkInterval = BlinkPeriod
        MyLight.Duration 2, TotalPeriod, FinalState
    ElseIf TypeName(MyLight) = "Flasher" Then

        Dim steps

        ' Store all blink information
        steps = Int(TotalPeriod / BlinkPeriod + .5) 'Number of ON/OFF steps to perform
        If FinalState = 2 Then                      'Keep the current flasher state
            FinalState = ABS(MyLight.Visible)
        End If
        MyLight.UserValue = steps * 10 + FinalState 'Store # of blinks, and final state

        ' Start blink timer and create timer subroutine
        MyLight.TimerInterval = BlinkPeriod
        MyLight.TimerEnabled = 0
        MyLight.TimerEnabled = 1
        ExecuteGlobal "Sub " & MyLight.Name & "_Timer:" & "Dim tmp, steps, fstate:tmp=me.UserValue:fstate = tmp MOD 10:steps= tmp\10 -1:Me.Visible = steps MOD 2:me.UserValue = steps *10 + fstate:If Steps = 0 then Me.Visible = fstate:Me.TimerEnabled=0:End if:End Sub"
    End If
End Sub

' #####################################
' ###### Flashers flupper #####
' #####################################

Dim TestFlashers, TableRef, FlasherLightIntensity, FlasherFlareIntensity, FlasherOffBrightness

								' *********************************************************************
TestFlashers = 0				' *** set this to 1 to check position of flasher object 			***
Set TableRef = Table1   		' *** change this, if your table has another name       			***
FlasherLightIntensity = 1		' *** lower this, if the VPX lights are too bright (i.e. 0.1)		***
FlasherFlareIntensity = 1		' *** lower this, if the flares are too bright (i.e. 0.1)			***
FlasherOffBrightness = 0.5		' *** brightness of the flasher dome when switched off (range 0-2)	***
								' *********************************************************************

Dim ObjLevel(20), objbase(20), objlit(20), objflasher(20), objlight(20)
Dim tablewidth, tableheight : tablewidth = TableRef.width : tableheight = TableRef.height
'initialise the flasher color, you can only choose from "green", "red", "purple", "blue", "white" and "yellow"
'InitFlasher 1, "green" : InitFlasher 2, "red" : InitFlasher 3, "white"
InitFlasher 4, "Blue" : 
InitFlasher 5, "blue" : InitFlasher 6, "blue" :
'InitFlasher 7, "Blue" :'InitFlasher 8, "Blue" : 
InitFlasher 9, "blue" ': InitFlasher 10, "red" : InitFlasher 11, "white" 
' rotate the flasher with the command below (first argument = flasher nr, second argument = angle in degrees)
'RotateFlasher 4,17 : RotateFlasher 5,0 : RotateFlasher 6,90
'RotateFlasher 7,0 : RotateFlasher 8,0 
'RotateFlasher 9,-45 : RotateFlasher 10,90 : RotateFlasher 11,90

Sub InitFlasher(nr, col)
	' store all objects in an array for use in FlashFlasher subroutine
	Set objbase(nr) = Eval("Flasherbase" & nr) : Set objlit(nr) = Eval("Flasherlit" & nr)
	Set objflasher(nr) = Eval("Flasherflash" & nr) : Set objlight(nr) = Eval("Flasherlight" & nr)
	' If the flasher is parallel to the playfield, rotate the VPX flasher object for POV and place it at the correct height
	If objbase(nr).RotY = 0 Then
		objbase(nr).ObjRotZ =  atn( (tablewidth/2 - objbase(nr).x) / (objbase(nr).y - tableheight*1.1)) * 180 / 3.14159
		objflasher(nr).RotZ = objbase(nr).ObjRotZ : objflasher(nr).height = objbase(nr).z + 60
	End If
	' set all effects to invisible and move the lit primitive at the same position and rotation as the base primitive
	objlight(nr).IntensityScale = 0 : objlit(nr).visible = 0 : objlit(nr).material = "Flashermaterial" & nr
	objlit(nr).RotX = objbase(nr).RotX : objlit(nr).RotY = objbase(nr).RotY : objlit(nr).RotZ = objbase(nr).RotZ
	objlit(nr).ObjRotX = objbase(nr).ObjRotX : objlit(nr).ObjRotY = objbase(nr).ObjRotY : objlit(nr).ObjRotZ = objbase(nr).ObjRotZ
	objlit(nr).x = objbase(nr).x : objlit(nr).y = objbase(nr).y : objlit(nr).z = objbase(nr).z
	objbase(nr).BlendDisableLighting = FlasherOffBrightness
	' set the texture and color of all objects
	select case objbase(nr).image
		Case "dome2basewhite" : objbase(nr).image = "dome2base" & col : objlit(nr).image = "dome2lit" & col : 
		Case "ronddomebasewhite" : objbase(nr).image = "ronddomebase" & col : objlit(nr).image = "ronddomelit" & col
		Case "domeearbasewhite" : objbase(nr).image = "domeearbase" & col : objlit(nr).image = "domeearlit" & col
	end select
	If TestFlashers = 0 Then objflasher(nr).imageA = "domeflashwhite" : objflasher(nr).visible = 0 : End If
	select case col
		Case "blue" :   objlight(nr).color = RGB(4,120,255) : objflasher(nr).color = RGB(200,255,255) : objlight(nr).intensity = 5000
		Case "green" :  objlight(nr).color = RGB(12,255,4) : objflasher(nr).color = RGB(12,255,4)
		Case "red" :    objlight(nr).color = RGB(255,32,4) : objflasher(nr).color = RGB(255,32,4)
		Case "purple" : objlight(nr).color = RGB(230,49,255) : objflasher(nr).color = RGB(255,64,255) 
		Case "yellow" : objlight(nr).color = RGB(200,173,25) : objflasher(nr).color = RGB(255,200,50)
		Case "white" :  objlight(nr).color = RGB(255,240,150) : objflasher(nr).color = RGB(100,86,59)
	end select
	objlight(nr).colorfull = objlight(nr).color
	If TableRef.ShowDT and ObjFlasher(nr).RotX = -45 Then 
		objflasher(nr).height = objflasher(nr).height - 20 * ObjFlasher(nr).y / tableheight
		ObjFlasher(nr).y = ObjFlasher(nr).y + 10
	End If
End Sub

Sub RotateFlasher(nr, angle) : angle = ((angle + 360 - objbase(nr).ObjRotZ) mod 180)/30 : objbase(nr).showframe(angle) : objlit(nr).showframe(angle) : End Sub

Sub FlashFlasher(nr)
	If not objflasher(nr).TimerEnabled Then objflasher(nr).TimerEnabled = True : objflasher(nr).visible = 1 : objlit(nr).visible = 1 : End If
	objflasher(nr).opacity = 1000 *  FlasherFlareIntensity * ObjLevel(nr)^2.5
	objlight(nr).IntensityScale = 0.5 * FlasherLightIntensity * ObjLevel(nr)^3
	objbase(nr).BlendDisableLighting =  FlasherOffBrightness + 10 * ObjLevel(nr)^3	
	objlit(nr).BlendDisableLighting = 10 * ObjLevel(nr)^2
	UpdateMaterial "Flashermaterial" & nr,0,0,0,0,0,0,ObjLevel(nr),RGB(255,255,255),0,0,False,True,0,0,0,0 
	ObjLevel(nr) = ObjLevel(nr) * 0.9 - 0.01
	If ObjLevel(nr) < 0 Then objflasher(nr).TimerEnabled = False : objflasher(nr).visible = 0 : objlit(nr).visible = 0 : End If
End Sub

Sub FlasherFlash1_Timer() : FlashFlasher(1) : End Sub 
Sub FlasherFlash2_Timer() : FlashFlasher(2) : End Sub 
Sub FlasherFlash3_Timer() : FlashFlasher(3) : End Sub 
Sub FlasherFlash4_Timer() : FlashFlasher(4) : End Sub 
Sub FlasherFlash5_Timer() : FlashFlasher(5) : End Sub 
Sub FlasherFlash6_Timer() : FlashFlasher(6) : End Sub 
Sub FlasherFlash7_Timer() : FlashFlasher(7) : End Sub
Sub FlasherFlash8_Timer() : FlashFlasher(8) : End Sub
Sub FlasherFlash9_Timer() : FlashFlasher(9) : End Sub
Sub FlasherFlash10_Timer() : FlashFlasher(10) : End Sub
Sub FlasherFlash11_Timer() : FlashFlasher(11) : End Sub

' ###################################
' ###### copy script until here #####
' ###################################

' ***      script for demoing flashers					***
' *** you should not need this in your table			***
' *** in your table start a flash with :				***
' *** ObjLevel(xx) = 1 : FlasherFlashxx_Timer			***
' *** for modulated flashers use 0-1 for ObjLevel(xx)	***

'dim countr : Randomize

'Sub Timer1_Timer
'	If TestFlashers = 0 Then
'		countr = countr + 1 : If Countr > 11 then Countr = 3 : end If
'		If rnd(1) < 0.04 Then
'			PlaySound "fx_relay_on",0,1
'			select case countr
				'case 1 : Objlevel(1) = 1 : FlasherFlash1_Timer
				'case 2 : Objlevel(2) = 1 : FlasherFlash2_Timer
				'case 3 : ObjLevel(3) = 1 : FlasherFlash3_Timer
				'case 4 : ObjLevel(4) = 1 : FlasherFlash4_Timer
				'case 5 : ObjLevel(5) = 1 : FlasherFlash5_Timer
				'case 6 : ObjLevel(6) = 1 : FlasherFlash6_Timer
				'case 7 : ObjLevel(7) = 1 : FlasherFlash7_Timer
				'case 8 : ObjLevel(8) = 1 : FlasherFlash8_Timer
'				case 9 : ObjLevel(9) = 1 : FlasherFlash9_Timer
				'case 10 : ObjLevel(10) = 1 : FlasherFlash10_Timer
				'case 11 : ObjLevel(11) = 1 : FlasherFlash11_Timer
'			end Select
'		End If
'	End If
'end Sub

' ********************************
'   Table info & Attract Mode
' ********************************

Sub ShowTableInfo
    Dim ii
    'info goes in a loop only stopped by the credits and the startkey
    If Score(1) Then
        DMD CL(0, "LAST SCORE"), CL(1, "PLAYER 1 " &FormatScore(Score(1) ) ), "", eNone, eNone, eNone, 3000, False, ""
    End If
    If Score(2) Then
        DMD CL(0, "LAST SCORE"), CL(1, "PLAYER 2 " &FormatScore(Score(2) ) ), "", eNone, eNone, eNone, 3000, False, ""
    End If
    If Score(3) Then
        DMD CL(0, "LAST SCORE"), CL(1, "PLAYER 3 " &FormatScore(Score(3) ) ), "", eNone, eNone, eNone, 3000, False, ""
    End If
    If Score(4) Then
        DMD CL(0, "LAST SCORE"), CL(1, "PLAYER 4 " &FormatScore(Score(4) ) ), "", eNone, eNone, eNone, 3000, False, ""
    End If
     DMD CL(0, "GAME OVER"), CL(1, "TRY AGAIN"), "", eNone, eBlink, eNone, 2000, True, ""
    If bFreePlay Then
        DMD "", CL(1, "FREE PLAY"), "", eNone, eNone, eNone, 2000, False, ""
    Else
        If Credits> 0 Then
            DMD CL(0, "CREDITS " & Credits), CL(1, "PRESS START"), "", eNone, eBlink, eNone, 2000, False, ""
        Else
            DMD CL(0, "CREDITS " & Credits), CL(1, "INSERT COIN"), "", eNone, eBlink, eNone, 2000, False, ""
        End If
    End If
DMD "", "", "dmdintro1", eNone, eNone, eNone, 3000, True, ""
DMD "", "", "dmdintro2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro3", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro4", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro5", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro6", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro7", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro8", eNone, eNone, eNone, 100, True, ""
DMD "", "", "dmdintro9", eNone, eNone, eNone, 200, True, ""
DMD "", "", "dmdintro10", eNone, eNone, eNone, 200, True, ""
DMD "", "", "dmdintro11", eNone, eNone, eNone, 200, True, ""
DMD "", "", "dmdintro12", eNone, eNone, eNone, 200, True, ""
DMD "", "", "dmdintro13", eNone, eNone, eNone, 200, True, ""
DMD "", "", "dmdintro14", eNone, eNone, eNone, 500, True, ""
DMD "", "", "dmdintro15", eNone, eNone, eNone, 400, True, ""
DMD "", "", "dmdintro16", eNone, eNone, eNone, 250, True, ""
DMD "", "", "dmdintro17", eNone, eNone, eNone, 250, True, ""
DMD "", "", "dmdintro18", eNone, eNone, eNone, 250, True, ""
DMD "", "", "dmdintro19", eNone, eNone, eNone, 250, True, ""
DMD "", "", "dmdintro20", eNone, eNone, eNone, 250, True, ""
	'   Put here your intro DMD

    DMD CL(0, "HIGHSCORES"), Space(dCharsPerLine(1) ), "", eScrollLeft, eScrollLeft, eNone, 20, False, ""
    DMD CL(0, "HIGHSCORES"), "", "", eBlinkFast, eNone, eNone, 1000, False, ""
    DMD CL(0, "HIGHSCORES"), "1> " &HighScoreName(0) & " " &FormatScore(HighScore(0) ), "", eNone, eScrollLeft, eNone, 2000, False, ""
    DMD "_", "2> " &HighScoreName(1) & " " &FormatScore(HighScore(1) ), "", eNone, eScrollLeft, eNone, 2000, False, ""
    DMD "_", "3> " &HighScoreName(2) & " " &FormatScore(HighScore(2) ), "", eNone, eScrollLeft, eNone, 2000, False, ""
    DMD "_", "4> " &HighScoreName(3) & " " &FormatScore(HighScore(3) ), "", eNone, eScrollLeft, eNone, 2000, False, ""
    DMD Space(dCharsPerLine(0) ), Space(dCharsPerLine(1) ), "", eScrollLeft, eScrollLeft, eNone, 500, False, ""
End Sub

Sub StartAttractMode
lightsout
	'Table1.ColorGradeImage = "ColorGradeLUT256x16_1to1"
'	GiOn
    ChangeSong
    StartLightSeq
    DMDFlush
    ShowTableInfo
End Sub

Sub StopAttractMode
    LightSeqAttract.StopPlay
    DMDScoreNow
End Sub

Sub StartLightSeq()
    'lights sequences
    LightSeqAttract.UpdateInterval = 25
    LightSeqAttract.Play SeqBlinking, , 5, 150
    LightSeqAttract.Play SeqRandom, 40, , 4000
    LightSeqAttract.Play SeqAllOff
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 50, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqCircleOutOn, 15, 2
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 10
    LightSeqAttract.Play SeqCircleOutOn, 15, 3
    LightSeqAttract.UpdateInterval = 5
    LightSeqAttract.Play SeqRightOn, 50, 1
    LightSeqAttract.UpdateInterval = 5
    LightSeqAttract.Play SeqLeftOn, 50, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 50, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 50, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 40, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 40, 1
    LightSeqAttract.UpdateInterval = 10
    LightSeqAttract.Play SeqRightOn, 30, 1
    LightSeqAttract.UpdateInterval = 10
    LightSeqAttract.Play SeqLeftOn, 30, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 15, 1
    LightSeqAttract.UpdateInterval = 10
    LightSeqAttract.Play SeqCircleOutOn, 15, 3
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 5
    LightSeqAttract.Play SeqStripe1VertOn, 50, 2
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqCircleOutOn, 15, 2
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqStripe1VertOn, 50, 3
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqCircleOutOn, 15, 2
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqStripe2VertOn, 50, 3
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 25, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqStripe1VertOn, 25, 3
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqStripe2VertOn, 25, 3
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqUpOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqDownOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqRightOn, 15, 1
    LightSeqAttract.UpdateInterval = 8
    LightSeqAttract.Play SeqLeftOn, 15, 1
End Sub

Sub LightSeqAttract_PlayDone()
    StartLightSeq()
End Sub

Sub LightSeqTilt_PlayDone()
    LightSeqTilt.Play SeqAllOff
End Sub

'***********************************************************************
' *********************************************************************
'                     Table Specific Script Starts Here
' *********************************************************************
'***********************************************************************

' droptargets, animations, etc
Sub VPObjects_Init
End Sub

' tables variables and Mode init
Dim HoleBonus, TargetBonus    

Sub Game_Init() 'called at the start of a new game
    Dim i, j
    ChangeSong
	TargetBonus = 0
	HoleBonus = 0
	BallInHole6 = 0
	'BallInHole = 0
    TurnOffPlayfieldLights()
End Sub

Sub StopEndOfBallMode()     'this sub is called after the last ball is drained
End Sub

Sub ResetNewBallVariables() 'reset variables for a new ball or player
Dim i
TargetBonus = 0
HoleBonus = 0
bBallSaverReady = True
End Sub

Sub ResetNewBallLights()    'turn on or off the needed lights before a new ball is released
    'TurnOffPlayfieldLights
    'li025.State = 1
    'li021.State = 1
    'li022.State = 1
    'li023.State = 1
    'li024.State = 1
	'li033.state = 1
	'gi1.state = 1
	'gi2.state = 1
	'gi3.state = 1
	'gi4.state = 1
End Sub

Sub TurnOffPlayfieldLights()
    Dim a
    For each a in aLights
        a.State = 0
    Next
End Sub

' *********************************************************************
'                        Table Object Hit Events
'
' Any target hit Sub should do something like this:
' - play a sound
' - do some physical movement
' - add a score, bonus
' - check some variables/Mode this trigger is a member of
' - set the "LastSwitchHit" variable in case it is needed later
' *********************************************************************

'************
' Slingshots
'************

Dim RStep, Lstep

Sub RightSlingShot_Slingshot
DOF 104, DOFPulse
	akR.TransZ = -20
Score(CurrentPlayer) = Score(CurrentPlayer) + (20*PFMultiplier*kgbmulti)
Bbullits = Bbullits + 1
if AKbullits = 0 Then
PlaySound "LEEG"
else
ObjLevel(6) = 1 : FlasherFlash6_Timer
PlaySound "rechtshot"
end if
   RSling.Visible = 0:RSling1.Visible = 1
    sling1.rotx = 20
    RStep = 0
    RightSlingShot.TimerEnabled = 1
'	gi1.State = 0
'	Gi2.State = 0	
	if AKbullits = 0 then 
	kogelempty
	exit sub
	end if
	AKbullits = AKbullits - 1
	checkdibullits
End Sub

Sub RightSlingShot_Timer
    Select Case RStep
        Case 1:RSLing1.Visible = 0:RSLing2.Visible = 1:sling1.rotx = 10:akR.TransZ = -10:If AKbullits>0 Then GIrightoff
		Case 1:RSLing1.Visible = 0:RSLing2.Visible = 1:sling1.rotx = 5:akR.TransZ = 0
        Case 2:RSLing2.Visible = 0:RSLing.Visible = 1:sling1.rotx = 0:RightSlingShot.TimerEnabled = False:GiRightOn
    End Select
    RStep = RStep + 1
End Sub

Sub LeftSlingShot_Slingshot
DOF 103, DOFPulse
	akL.TransZ = -20
Score(CurrentPlayer) = Score(CurrentPlayer) + (20*PFMultiplier*kgbmulti)
Bbullits = Bbullits + 1	
if AKbullits = 0 Then
PlaySound "LEEG"
else
ObjLevel(5) = 1 : FlasherFlash5_Timer
PlaySound "linksshot"
end if
    LSling.Visible = 0:LSling1.Visible = 1
    sling2.rotx = 20
	 LStep = 0
    LeftSlingShot.TimerEnabled = 1
'	gi3.State = 0
'	Gi4.State = 0
	if AKbullits = 0 then 
	kogelempty
	exit sub
	end if
	AKbullits = AKbullits - 1
	checkdibullits
End Sub

Sub LeftSlingShot_Timer
    Select Case LStep
        Case 1:LSLing1.Visible = 0:LSLing2.Visible = 1:sling2.rotx = 10:akL.TransZ = -10:If AKbullits>0 Then GiLeftOff
        Case 2:LSLing1.Visible = 0:LSLing2.Visible = 1:sling2.rotx = 5:akL.TransZ = 0
        Case 3:LSLing2.Visible = 0:LSLing.Visible = 1:sling2.rotx = 0:LeftSlingShot.TimerEnabled = False:GiLeftOn
    End Select
    LStep = LStep + 1
End Sub

Sub checkdibullits
	Select Case AKbullits
		Case 0 kogelempty
		Case 1 kogel1
		Case 2 kogel2
		Case 3 kogel3
		Case 4 kogel4
		Case 5 kogel5
		Case 6 kogel6
		Case 7 kogel7
		Case 8 kogel8
		Case 9 kogel9
		Case 10 kogel10
		Case 11 kogel11
		Case 12 kogel12
		Case 13 kogel13
		Case 14 kogel14
		Case 15 kogel15
		Case 16 kogel16
		Case 17 kogel17
		Case 18 kogel18
		Case 19 kogel19
		Case 20 kogel20
    End Select
end sub

sub enablemagazines
Mhit = 0
playsong "6"
TrotateI003.enabled = true
Magazine001.Visible = true
tsMagazine001.enabled = true
Magazine002.Visible = true
tsMagazine002.enabled = true
end sub

sub tsMagazine001_hit
playsound "amopickup"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
Mhit = Mhit + 1
Magazine001.Visible = false
tsMagazine001.enabled = false
checkMagazineit
end sub

sub tsMagazine002_hit
playsound "amopickup"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
Mhit = Mhit + 1
Magazine002.Visible = false
tsMagazine002.enabled = false
checkMagazineit
end sub

Sub checkMagazineit
if Mhit = 2 then
TrotateI003.enabled = false
AKbullits = 20
getnewbullits = 0
UpdateMusicNow
end if
end sub

'*****************
'triggers
'*****************

Dim Vodkaspin : Vodkaspin = -1
Dim Vodkaspeed : Vodkaspeed = 0
Dim VodkaPos : Vodkapos = 0
sub Trigger001_hit()
playsound "bottlespin2"
	If Vodkaspin = -1 Then 
		Trigger001.timerenabled=True
		Vodkaspin = 0
		Vodkaspeed = 0 
		Vodkapos = 0
	End If
End Sub

Sub Trigger001_Timer
	Vodkaspin = Vodkaspin + 1
	If Vodkaspin < 70 Then
		Vodkaspeed = Vodkaspeed + 1
		If Vodkaspeed > 30 Then Vodkaspeed = 30
	Elseif Vodkaspin < 170 Then
		Vodkaspeed = Vodkaspeed - 1
		If Vodkaspeed < 1 Then Vodkaspeed = 1
	End If
	VodkaPos = VodkaPos + Vodkaspeed
	If VodkaPos > 360 Then VodkaPos = VodkaPos - 360

	vodkabottle.rotz = VodkaPos

	If Vodkaspin > 170 Then
		If VodkaPos > 358 Then
			vodkabottle.rotz = 0
			VodkaPos = 0
			Vodkaspin = -1
			Trigger001.timerenabled = False
		End If
	End If
End Sub

'****************************
'jackpot
'****************************

sub tjackpot001_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
playsound "pinhit_low"
Jhit = Jhit + 1
li134.state = 0
buttonprim001. z = -10
jackpotchecker
tjackpot001.enabled = false
end sub

sub tjackpot002_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
playsound "pinhit_low"
Jhit = Jhit + 1
li135.state = 0
buttonprim002. z = -10
jackpotchecker
tjackpot002.enabled = false
end sub

sub tjackpot003_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
playsound "pinhit_low"
Jhit = Jhit + 1
li136.state = 0
buttonprim003. z = -10
jackpotchecker
tjackpot003.enabled = false
end sub

sub tjackpot004_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
playsound "pinhit_low"
Jhit = Jhit + 1
li137.state = 0
buttonprim004. z = -10
jackpotchecker
tjackpot004.enabled = false
end sub

sub tjackpot005_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
playsound "pinhit_low"
Jhit = Jhit + 1
li138.state = 0
buttonprim005. z = -10
jackpotchecker
tjackpot005.enabled = false
end sub

sub jackpotchecker
if Jhit = 5 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (5000*PFMultiplier*kgbmulti)
Playsound "vo_ruble_jackpot"
vpmtimer.addtimer 1000, "resetdijackpot ' "
'resetdijackpot
end if 
end sub

sub resetdijackpot
buttonprim001. z = -5
buttonprim002. z = -5
buttonprim003. z = -5
buttonprim004. z = -5
buttonprim005. z = -5
li134.state = 1
li135.state = 1
li136.state = 1
li137.state = 1
li138.state = 1
tjackpot001.enabled = True
tjackpot002.enabled = True
tjackpot003.enabled = True
tjackpot004.enabled = True
tjackpot005.enabled = True
Jhit = 0
end sub

'****************************
'da triggers
'****************************

sub trda001_hit()
playsound "beepda"
Score(CurrentPlayer) = Score(CurrentPlayer) + (50*PFMultiplier*kgbmulti)
if li128.state = 1 or li130.state = 1 or li132.state = 1 then exit sub
if damode = 0 Then
DMD "", "", "da1", eNone, eNone, eNone, 500, True, ""
li128.state = 1
end if
if damode = 1 Then
DMD "", "", "da1", eNone, eNone, eNone, 500, True, ""
li130.state = 1
end if
if damode = 2 Then
DMD "", "", "da1", eNone, eNone, eNone, 500, True, ""
li132.state = 1
end if
dapoints = dapoints + 1
checkda
end sub

sub trda002_hit()
playsound "beepda"
Score(CurrentPlayer) = Score(CurrentPlayer) + (50*PFMultiplier*kgbmulti)
if li129.state = 1 or li131.state = 1 or li133.state = 1 then exit sub
if damode = 0 Then
DMD "", "", "da2", eNone, eNone, eNone, 500, True, ""
li129.state = 1
end if
if damode = 1 Then
DMD "", "", "da2", eNone, eNone, eNone, 500, True, ""
li131.state = 1
end if
if damode = 2 Then
DMD "", "", "da2", eNone, eNone, eNone, 500, True, ""
li133.state = 1
end if
dapoints = dapoints + 1
checkda
end sub

sub checkda
if dapoints = 2 then
DMD "", "", "da3", eNone, eNone, eNone, 500, True, ""
playsound "vo_da"
lightsyoff4
damode = damode + 1
dapoints = 0
end if
If damode = 3 Then
damode = 0
exit sub
end if
end sub

Sub lightsyoff4
li128.state = 0
li129.state = 0
li130.state = 0
li131.state = 0
li132.state = 0
li133.state = 0
end sub

'**********************inner/outerlane*********************

Sub TLeftInlane_Hit
playsound "beepinlane"
DMD "", "", "cyka02", eNone, eNone, eNone, 500, True, ""
	LeftInlane.State = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
	PlaySound ""
'	DMD "", "", "10k", eNone, eNone, eNone, 500, True, ""
	CheckCYKA
End Sub

Sub TLeftOutlane_Hit
playsound "beepoutlane"
DMD "", "", "cyka01", eNone, eNone, eNone, 500, True, ""
	LeftOutlane.State = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	PlaySound ""
'	DMD "", "", "50k", eNone, eNone, eNone, 500, True, ""
	CheckCYKA
End Sub

Sub TRightInlane_Hit
playsound "beepinlane"
DMD "", "", "cyka03", eNone, eNone, eNone, 500, True, ""
	RightInlane.State = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
	PlaySound ""
'	DMD "", "", "10k", eNone, eNone, eNone, 500, True, ""
	CheckCYKA
End Sub

Sub TRightOutlane_Hit
playsound "beepoutlane"
DMD "", "", "cyka04", eNone, eNone, eNone, 500, True, ""
	RightOutlane.State = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (50000*PFMultiplier*kgbmulti)
	PlaySound ""
'	DMD "", "", "50k", eNone, eNone, eNone, 500, True, ""
	CheckCYKA
End Sub

Sub CheckCYKA
	If(LeftInlane.State = 1) And(LeftOutlane.State = 1) And(RightInlane.State = 1) And(RightOutlane.State = 1) Then
	playsound "vo_suka"
	cykaANI
	Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
	LeftInlane.State=0
	LeftOutlane.State=0
	RightInlane.State=0
	RightOutlane.State=0	  
	End If
End Sub

sub cykaANI
DMD "", "", "cyka", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka", eNone, eNone, eNone, 100, True, ""
DMD "", "", "cyka2", eNone, eNone, eNone, 100, True, ""
end sub

Sub Bonuschecker_Hit
ObjLevel(4) = 1 : FlasherFlash4_Timer
ObjLevel(5) = 1 : FlasherFlash5_Timer
ObjLevel(6) = 1 : FlasherFlash6_Timer
ObjLevel(9) = 1 : FlasherFlash9_Timer
FlashForMs Flasher001, 1000, 50, 0
FlashForMs Flasher002, 1000, 50, 0
End Sub


'***************** sovjet logo triggers

sub Trigger003_hit
FlagDir = 5
playsound "fx_metalrolling"
if putinpoints = 0  and putwait = 1 Then
playsound "vo_ha_ha_never_get_me"
enablevladputins()
putwait = 0
end if
if putinpoints = 0 then
FlagTimer.enabled =true
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
lighty001.Image = "bulb_red"
lighty002.Image = "bulb_green"
putinpoints = 1
exit sub
end if
if putinpoints = 1 then
lighty001.Image = "bulb_green"
lighty002.Image = "bulb_red"
putinpoints = 0
exit sub
end if
end sub

sub Trigger004_hit
FlagDir = 5
playsound "fx_metalrolling"
if putinpoints = 1  and putwait = 1 Then
playsound "vo_ha_ha_never_get_me"
enablevladputins()
putwait = 0
end if
if putinpoints = 0 then
lighty001.Image = "bulb_red"
lighty002.Image = "bulb_green"
putinpoints = 1
exit sub
end if
if putinpoints = 1 then
FlagTimer.enabled =true
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
lighty001.Image = "bulb_green"
lighty002.Image = "bulb_red"
putinpoints = 0
exit sub
end if
end sub


'***************sound shout the baal from Plunger
sub Trigger006_hit()
If activeball.vely > 0 then
playsound "shootyball"
bAutoPlunger = true
end if
end sub 


'************************** 
'Bumpers 
'************************** 
Dim bumperHits

Sub Bumper001_hit()
DOF 107, DOFPulse
capy002.blenddisablelighting = 1
Tbumpy002.enabled = True
Score(CurrentPlayer) = Score(CurrentPlayer) + (60*PFMultiplier*kgbmulti)	
ObjLevel(9) = 1 : FlasherFlash9_Timer
playsound "10a"
End sub
' Bumper Bonus
' 100000 i bonus after each 100 hits

sub Bumper002_hit()
DOF 109, DOFPulse
capy001.blenddisablelighting = 1
Tbumpy001.enabled = True
Score(CurrentPlayer) = Score(CurrentPlayer) + (30*PFMultiplier*kgbmulti)	
playsound "100a"
end sub

sub Tbumpy001_timer()
capy001.blenddisablelighting = 0
Tbumpy001.enabled = false
end sub

sub Tbumpy002_timer()
capy002.blenddisablelighting = 0
Tbumpy002.enabled = false
end sub

'*****************
'Targets
'*****************

'************************
' comrade targets + matruska mode
'************************

sub target001_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeE
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li001.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li009.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li017.state = 1
checktchecky
exit sub
end if
end sub

sub target002_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeD
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li002.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li010.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li018.state = 1
checktchecky
exit sub
end if
end sub

sub target003_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeA
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li003.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li011.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li019.state = 1
checktchecky
exit sub
end if
end sub

sub target004_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeR
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li004.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li012.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li020.state = 1
checktchecky
exit sub
end if
end sub

sub target005_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeM
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li005.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li013.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li021.state = 1
checktchecky
exit sub
end if
end sub

sub target006_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeO
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li006.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li014.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li022.state = 1
checktchecky
exit sub
end if
end sub

sub target007_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
comradeC
tchecky = tchecky + 1
playsound "Drop_fall_L"
if matruska = 0 then
li007.state = 1
checktchecky
exit sub
end if
if matruska = 1 then
li015.state = 1
checktchecky
exit sub
end if
if matruska = 2 then
li023.state = 1
checktchecky
exit sub
end if
end sub

sub checktchecky
if tchecky = 7 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (700*PFMultiplier*kgbmulti)	
matruskamode = 1
comradeCL
if matruska = 0 Then
playsound "vo_comrade_complete"
li001.state=2
li002.state=2
li003.state=2
li004.state=2
li005.state=2
li006.state=2
li007.state=2
end if
if matruska = 1 Then
playsound "vo_comrade_complete"
li009.state=2
li010.state=2
li011.state=2
li012.state=2
li013.state=2
li014.state=2
li015.state=2
end if
if matruska = 2 Then
playsound "vo_comrade_complete"
li017.state=2
li018.state=2
li019.state=2
li020.state=2
li021.state=2
li022.state=2
li023.state=2
end if
'vpmtimer.addtimer 2005, "Resettargets1 ' "
checkbabuskaanimation
StopSong
playsong "7"
'UpdateMusic = 7
'UpdateMusicNow
babsyspidersChecker = 0	
enablebabsyspiderss()	
'matruska = matruska + 1
exit sub
end if
end sub

sub checkbabuskaanimation
if matruska=0 then
babtimer.enabled = true
matruska=1
li082.state = 1
exit sub
end if 
if matruska=1 then
babtimer001.enabled = True
matruska=2
li083.state = 1
exit sub
end if
if matruska=2 then
Bab021.visible=false
Bab001.visible=True
matruska=0
li084.state = 1
exit sub
end if 
end sub

Dim Whichbabsyspiders, babsyspidersChecker
Whichbabsyspiders = 0
babsyspidersChecker = 0
sub enablebabsyspiderss()
	If babsyspidersChecker = 7 Then
		CheckBonusbabsyspiders()
		Exit Sub
	End If
	Randomize()
	Whichbabsyspiders = INT(RND * 3) + 1
	Select Case Whichbabsyspiders
		Case 3
			Whichbabsyspiders = 4
	End Select
	Do While (Whichbabsyspiders AND babsyspidersChecker) > 0
		Whichbabsyspiders = INT(RND * 3) + 1
		Select Case Whichbabsyspiders
			Case 3
				Whichbabsyspiders = 4
		End Select
	Loop
	Select Case Whichbabsyspiders
		Case 1
			TBA001.enabled = 1
			babsspider001.Visible = 1
			babsspider001.X = TBA001.X
			babsspider001.Y = TBA001.Y
		Case 2
			TBA002.enabled = 1
			babsspider001.Visible = 1
			babsspider001.X = TBA002.X
			babsspider001.Y = TBA002.Y
		Case 4
			TBA003.enabled = 1
			babsspider001.Visible = 1
			babsspider001.X = TBA003.X
			babsspider001.Y = TBA003.Y
	End Select
end sub

sub movebabsyspidersdown()
	Dim X
	For Each X in babsyspiderss
		X.Visible = 0
	Next
end sub

Sub TBA001_Hit()
	TBA001.enabled = 0
	playsound "spiderhity"
	movebabsyspidersdown()
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
DMD "", "", "spiders", eNone, eNone, eNone, 1000, True, ""	
	Playsound "babsyspiders1"
	babsyspidersChecker = (babsyspidersChecker OR 1)
	Enablebabsyspiderss()
end sub

Sub TBA002_Hit()
	TBA002.enabled = 0
	movebabsyspidersdown()
playsound "spiderhity"
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
DMD "", "", "spiders", eNone, eNone, eNone, 1000, True, ""
	Playsound "babsyspiders1"
	babsyspidersChecker = (babsyspidersChecker OR 2)
	Enablebabsyspiderss()
end sub

Sub TBA003_Hit()
	TBA003.enabled = 0
	movebabsyspidersdown()
playsound "spiderhity"
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
DMD "", "", "spiders", eNone, eNone, eNone, 1000, True, ""
	Playsound "babsyspiders1"
	babsyspidersChecker = (babsyspidersChecker OR 4)
	Enablebabsyspiderss()
end sub

sub checkbonusbabsyspiders()
	If babsyspidersChecker = 7 then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
		playsound ""
		Resettargets1
		UpdateMusicNow
end if
end sub

sub Resettargets1
Playsound "Drop_reset_L"
matruskamode = 0
movebabsyspidersdown()
babsyspidersChecker = 0
tchecky = 0
TBA001.enabled = False
TBA002.enabled = False
TBA003.enabled = False
li001.state = 0
li002.state = 0
li003.state = 0
li004.state = 0
li005.state = 0
li006.state = 0
li007.state = 0
li009.state = 0
li010.state = 0
li011.state = 0
li012.state = 0
li013.state = 0
li014.state = 0
li015.state = 0
li017.state = 0
li018.state = 0
li019.state = 0
li020.state = 0
li021.state = 0
li022.state = 0
li023.state = 0
target001.IsDropped = False
target002.IsDropped = False
target003.IsDropped = False
target004.IsDropped = False
target005.IsDropped = False
target006.IsDropped = False
target007.IsDropped = False
if matruska = 3 Then
matruska = 0
end if
end sub

'************************
' nuke targets
'************************

sub target008_hit
Playsound "targetnukes"
TargetBonus = TargetBonus + 1
nukeS
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li025.state = 1 or li026.state = 1 or li027.state = 1 then exit sub
if bommermode = 0 Then
li025.state = 1
end if
if bommermode = 1 Then
li026.state = 1 
end if
if bommermode = 2 Then
li027.state = 1
end if
bommer = bommer + 1
checkbom
end sub

sub target009_hit
Playsound "targetnukes"
TargetBonus = TargetBonus + 1
nukeE
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li028.state = 1 or li029.state = 1 or li030.state = 1 then exit sub
if bommermode = 0 Then
li028.state = 1
end if
if bommermode = 1 Then
li029.state = 1 
end if
if bommermode = 2 Then
li030.state = 1
end if
bommer = bommer + 1
checkbom
end sub

sub target010_hit
Playsound "targetnukes"
TargetBonus = TargetBonus + 1
nukeK
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li031.state = 1 or li032.state = 1 or li033.state = 1 then exit sub
if bommermode = 0 Then
li031.state = 1
end if
if bommermode = 1 Then
li032.state = 1 
end if
if bommermode = 2 Then
li033.state = 1
end if
bommer = bommer + 1
checkbom
end sub

sub target011_hit
Playsound "targetnukes"
TargetBonus = TargetBonus + 1
nukeU
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li034.state = 1 or li035.state = 1 or li036.state = 1 then exit sub
if bommermode = 0 Then
li034.state = 1
end if
if bommermode = 1 Then
li035.state = 1 
end if
if bommermode = 2 Then
li036.state = 1
end if
bommer = bommer + 1
checkbom
end sub

sub target012_hit
Playsound "targetnukes"
TargetBonus = TargetBonus + 1
nukeN
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li037.state = 1 or li038.state = 1 or li039.state = 1 then exit sub
if bommermode = 0 Then
li037.state = 1
end if
if bommermode = 1 Then
li038.state = 1 
end if
if bommermode = 2 Then
li039.state = 1
end if
bommer = bommer + 1
checkbom
end sub

sub checkbom
If bommer = 5 Then
nukerbegin
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)	
bommermode = bommermode + 1
Bnukes = Bnukes + 1
bommer = 0
lightsyoff2
nukesleft = nukesleft + 1
checknukes
end if
If bommermode = 3 Then
bommermode = 0
exit sub
end if
end sub

Sub lightsyoff2
li025.state = 0
li026.state = 0
li027.state = 0
li028.state = 0
li029.state = 0
li030.state = 0
li031.state = 0
li032.state = 0
li033.state = 0
li034.state = 0
li035.state = 0
li036.state = 0
li037.state = 0
li038.state = 0
li039.state = 0
end sub

sub checknukes
select case nukesleft
case 1: nuke001.visible = false:playsound "vo_nuke_1_disarmed"
case 2: nuke002.visible = false:playsound "vo_nuke_2_disarmed"
case 3: nuke003.visible = false:playsound "vo_nuke_3_disarmed"
case 4: nuke004.visible = false:playsound "vo_nuke_4_disarmed"
case 5: nuke005.visible = false:playsound "vo_putin_disarmed":shownukes
end select
end sub

sub shownukes
nuke001.visible = true
nuke002.visible = true
nuke003.visible = true
nuke004.visible = true
nuke005.visible = true
end sub

'************************
' KGB targets
'************************

sub target014_hit
Playsound "targethit3"
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li040.state = 1 or li041.state = 1 or li042.state = 1 then exit sub
if kgbmode = 0 Then
li040.state = 1
end if
if kgbmode = 1 Then
li041.state = 1 
end if
if kgbmode = 2 Then
li042.state = 1
end if
kgbpoints = kgbpoints + 1
checkkgb
end sub

sub target015_hit
Playsound "targethit3"
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li097.state = 1 or li044.state = 1 or li045.state = 1 then exit sub
if kgbmode = 0 Then
li097.state = 1
end if
if kgbmode = 1 Then
li044.state = 1 
end if
if kgbmode = 2 Then
li045.state = 1
end if
kgbpoints = kgbpoints + 1
checkkgb
end sub

sub target016_hit
Playsound "targethit3"
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)	
playsound ""
if li046.state = 1 or li047.state = 1 or li048.state = 1 then exit sub
if kgbmode = 0 Then
li046.state = 1
end if
if kgbmode = 1 Then
li047.state = 1 
end if
if kgbmode = 2 Then
li048.state = 1
end if
kgbpoints = kgbpoints + 1
checkkgb
end sub

sub checkkgb
If kgbpoints = 3 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (300*PFMultiplier*kgbmulti)	
kgbmode = kgbmode + 1
kgblevel = kgblevel + 1
Bkgbl = Bkgbl + 1
if kgblevel >= 27 then kgblevel = 27 end if
kgbpoints = 0
lightsyoff3
checkkgblevel
end if
If kgbmode = 3 Then
kgbmode = 0
exit sub
end if
end sub

Sub lightsyoff3
li040.state = 0
li041.state = 0
li042.state = 0
li097.state = 0
li044.state = 0
li045.state = 0
li046.state = 0
li047.state = 0
li048.state = 0
end sub

sub checkkgblevel
select case kgblevel
case 1: kgblvl1
case 2: kgblvl2
case 3: kgblvl3
case 4: kgblvl4
case 5: kgblvl5
case 7: kgblvl6
case 8: kgblvl7
case 9: kgblvl8
case 10: kgblvl9
case 11: kgblvl10
case 12: kgblvl11
case 13: kgblvl12
case 14: kgblvl13
case 15: kgblvl14
case 16: kgblvl15
case 17: kgblvl16
case 18: kgblvl17
case 19: kgblvl18
case 20: kgblvl19
case 21: kgblvl20
case 22: kgblvl2l
case 23: kgblvl22
case 24: kgblvl23
case 25: kgblvl24
case 26: kgblvl25
case 27: kgblvl26
end select
end sub

'************************
' Stalin target
'************************

sub Target013_hit
TargetBonus = TargetBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (10*PFMultiplier*kgbmulti)
playsound "Drop_fall_L"
end sub

'*****************
'Kickers
'*****************

'************************
'bear kicker
'************************

Dim bearShake

sub Kicker001_hit()
HoleBonus = HoleBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (100*PFMultiplier*kgbmulti)	
if BearM = 5 Then
kickout001
exit Sub
end if
BearM = BearM + 1
bearShaker
bearcavelighton
checkdibear
end sub

sub kickout001
'bearcavelightoff
Playsound SoundFXDOF("fx_kicker", 112, DOFPulse, DOFContactors)
Kicker001.Kick 140, 30, 12	'160, 4, 12
DOF 116, DOFOff
end sub

Sub dobear1
showdmdbearB
if bearhits=1 and bearcollor=0 then
li093.state = 1
checkbearchange
exit Sub
end if
if bearhits=1 and bearcollor=1 then
li089.state = 1
checkbearchange
exit Sub
end if
if bearhits=1 and bearcollor=2 then
li086.state = 1
checkbearchange
exit Sub
end if
end sub

Sub dobear2
showdmdbearE
if bearhits=2 and bearcollor=0 then
li094.state = 1
checkbearchange
exit Sub
end if
if bearhits=2 and bearcollor=1 then
li090.state = 1
checkbearchange
exit Sub
end if
if bearhits=2 and bearcollor=2 then
li087.state = 1
checkbearchange
exit Sub
end if
end sub

Sub dobear3
showdmdbearA
if bearhits=3 and bearcollor=0 then
li095.state = 1
checkbearchange
exit Sub
end if
if bearhits=3 and bearcollor=1 then
li091.state = 1
checkbearchange
exit Sub
end if
if bearhits=3 and bearcollor=2 then
li088.state = 1
checkbearchange
exit Sub
end if
end sub

Sub dobear4
showdmdbearR
if bearhits=4 and bearcollor=0 then
li093.state=2
li094.state=2
li095.state=2
li096.state=2
checkbearchange
exit Sub
end if
if bearhits=4 and bearcollor=1 then
li089.state=2
li090.state=2
li091.state=2
li092.state=2
checkbearchange
exit Sub
end if
if bearhits=4 and bearcollor=2 then
li086.state=2
li087.state=2
li088.state=2
li1000.state=2
checkbearchange
exit Sub
end if
end sub

sub checkbearchange
if BearM = 5 Then
bear.visible = false
enableBears()
BearChecker = 0
end if
end sub

Dim WhichBear, BearChecker
WhichBear = 0
BearChecker = 0
sub enableBears()
	If BearChecker = 7 Then
		CheckBonusBear()
		Exit Sub
	End If
	Randomize()
	WhichBear = INT(RND * 3) + 1
	Select Case WhichBear
		Case 3
			WhichBear = 4
	End Select
	Do While (WhichBear AND BearChecker) > 0
		WhichBear = INT(RND * 3) + 1
		Select Case WhichBear
			Case 3
				WhichBear = 4
		End Select
	Loop
	Select Case WhichBear
		Case 1
			Tbear001.enabled = 1
			grizzlyb.Visible = 1
			grizzlyb.X = Tbear001.X
			grizzlyb.Y = Tbear001.Y
		Case 2
			Tbear002.enabled = 1
			grizzlyb.Visible = 1
			grizzlyb.X = Tbear002.X
			grizzlyb.Y = Tbear002.Y
		Case 4
			Tbear003.enabled = 1
			grizzlyb.Visible = 1
			grizzlyb.X = Tbear003.X
			grizzlyb.Y = Tbear003.Y
	End Select
end sub

sub moveBeardown()
	Dim X
	For Each X in Bears
		X.Visible = 0
	Next
end sub

Sub Tbear001_Hit()
	Tbear001.enabled = 0
	BBearfight =  BBearfight + 1
	moveBeardown()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
	Playsound "BEAR1"
	BearChecker = (BearChecker OR 1)
	EnableBears()
end sub

Sub tBear002_Hit()
	tBear002.enabled = 0
	BBearfight =  BBearfight + 1
	moveBeardown()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
	Playsound "BEAR1"
	BearChecker = (BearChecker OR 2)
	EnableBears()
end sub

Sub tBear003_Hit()
	tBear003.enabled = 0
	BBearfight =  BBearfight + 1
	moveBeardown()
Score(CurrentPlayer) = Score(CurrentPlayer) + (250*PFMultiplier*kgbmulti)
	Playsound "BEAR1"
	BearChecker = (BearChecker OR 4)
	EnableBears()
end sub

sub checkbonusBear()
	If BearChecker = 7 then
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
		playsound ""
		BearChecker = 0
		bearcollor = bearcollor + 1
bearhits = 0
BearM = 0 
li086.state=0
li087.state=0
li088.state=0
li089.state=0
li1000.state=0
li090.state=0
li091.state=0
li092.state=0
li093.state=0
li094.state=0
li095.state=0
li096.state=0
Tbear001.enabled = False
Tbear002.enabled = False
Tbear003.enabled = False
bear.visible = true
checkbearcollor
end if
end sub

sub checkbearcollor
if bearcollor = 3 Then
bearcollor = 0
end if
end sub


sub checkdibear
if BearM = 1 then
showdmdbear
playsound "vo_fight_bear"
'bearstart = 0
bearhits=1
vpmtimer.AddTimer 2000, "bearcavelightoff '"
vpmtimer.AddTimer 2000, "kickout001 '"
end if
if BearM = 2 then
playsound "BEAR1"
dobear1
bearhits=2
vpmtimer.AddTimer 300, "bearcavelightoff '"
vpmtimer.AddTimer 1000, "kickout001 '"
end if
if BearM = 3 then
playsound "BEAR2"
dobear2
bearhits=3
vpmtimer.AddTimer 300, "bearcavelightoff '"
vpmtimer.AddTimer 600, "bearcavelighton '"
vpmtimer.AddTimer 1000, "bearcavelightoff '"
vpmtimer.AddTimer 2000, "kickout001 '"
end if
if BearM = 4 then
playsound "BEAR3"
dobear3
bearhits=4
vpmtimer.AddTimer 300, "bearcavelightoff '"
vpmtimer.AddTimer 600, "bearcavelighton '"
vpmtimer.AddTimer 900, "bearcavelightoff '"
vpmtimer.AddTimer 1200, "bearcavelighton '"
vpmtimer.AddTimer 1500, "bearcavelightoff '"
vpmtimer.AddTimer 2000, "kickout001 '"
end if
if BearM = 5 then
playsound "BEAR4"
dobear4
vpmtimer.AddTimer 300, "bearcavelightoff '"
vpmtimer.AddTimer 600, "bearcavelighton '"
vpmtimer.AddTimer 900, "bearcavelightoff '"
vpmtimer.AddTimer 1200, "bearcavelighton '"
vpmtimer.AddTimer 1500, "bearcavelightoff '"
vpmtimer.AddTimer 1800, "bearcavelighton '"
vpmtimer.AddTimer 2100, "bearcavelightoff '"
vpmtimer.AddTimer 3000, "kickout001 '"
'resetdibear
end if
end Sub

sub resetdibear
BearM = 0
end sub

sub bearcavelighton
bearcave.blenddisablelighting= 1
DOF 116, DOFOn
end sub

sub bearcavelightoff
bearcave.blenddisablelighting=0
end sub


Sub bearShaker()
    bearShake = 6
    bearTimer.Enabled = True
End Sub

Sub bearTimer_Timer()
    bear.Transz = bearShake / 2
    If bearShake = 0 Then Me.Enabled = False:Exit Sub
    If bearShake <0 Then
        bearShake = ABS(bearShake)- 0.1
    Else
        bearShake = - bearShake + 0.1
    End If
End Sub

'************************
'vodka kicker
'************************

sub Kicker002_hit()
HoleBonus = HoleBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (100*PFMultiplier*kgbmulti)
drink = drink + 1
vodkaL = vodkaL + 1
vodkalights
if jeltsin = 0 then
boss5starts
drink = 0
jeltsin = 1
exit sub
end if
countdrinksjeltsin
vpmtimer.AddTimer 250, "kickout002 '"
end sub

sub kickout002
Playsound SoundFXDOF("fx_kicker", 113, DOFPulse, DOFContactors)
'Kicker002.Kick 0, 32, 90
Kicker002.Kick 0, 32, 1.56
end sub

sub vodkalights
select case vodkaL
case 1:li098.state=1
case 2:li099.state=1
case 3:li100.state=1
case 4:li101.state=1
case 5:li102.state=1
end Select
end sub



'************************
'Gazprom kicker
'************************

sub Kicker004_hit()
HoleBonus = HoleBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (100*PFMultiplier*kgbmulti)	
vpmtimer.AddTimer 250, "kickout004 '" 
end sub

sub kickout004
Playsound SoundFXDOF("fx_kicker", 115, DOFPulse, DOFContactors)
'Kicker004.Kick 0, 45, 90
Kicker004.Kick 0, 45, 1.56
end sub

Dim BallInHole6

sub Kicker005_Hit()
BallInHole6 = BallInHole6 + 1
Kicker005.DestroyBall
if pipehit = 6 Then
kickout005
playsound "dropball"
exit sub
end if
pipehit = pipehit + 1
if pipehit = 1 Then
kickout005
playsound "dropball"
checkpipehit
exit sub
end if
if pipehit = 2 Then
kickout005
playsound "dropball"
checkpipehit
exit sub
end if
if pipehit = 3 Then
leninstart
vpmtimer.addtimer 3000, "kickout005 '"
vpmtimer.addtimer 3000, "playballout '"
exit sub
end if
if pipehit = 4 Then
pipelinehit = pipelinehit + 1
checkpipelinehit
vpmtimer.addtimer 2700, "kickout005 '"
vpmtimer.addtimer 2700, "playballout '"
exit sub
end if
if pipehit = 5 Then
pipelinehit = pipelinehit + 1
checkpipelinehit
vpmtimer.addtimer 2400, "kickout005 '"
vpmtimer.addtimer 2400, "playballout '"
exit sub
end if
if pipehit = 6 Then
pipelinehit = pipelinehit + 1
checkpipelinehit
vpmtimer.addtimer 3000, "kickout005 '"
vpmtimer.addtimer 3000, "playballout '"
exit sub
end if
end sub

sub checkpipehit
if pipehit = 3 Then
leninstart
end if
end sub

sub kickout005
	If BallInHole6> 0 Then
        BallInHole6 = BallInHole6 - 1
Kicker005.CreateSizedball BallSize / 2
Kicker005.Kick 0, 40, 12
 vpmtimer.addtimer 1000, "kickout005 '" 
end If
end sub

sub playballout
playsound "dropball"
end sub

'************************
'buildingup kicker
'************************

sub Kicker006_hit()
HoleBonus = HoleBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (100*PFMultiplier*kgbmulti)	
if bMultiBallMode = true then
vpmtimer.AddTimer 300, "kickout006 '"
exit sub
end if
locky = locky + 1
if locky = 1 then
li008.state = 1
playsound "vo_locked1"
lampiechange01
DMD "", "", "dmdL1", eNone, eNone, eNone, 3000, True, ""
vpmtimer.AddTimer 3000, "kickout006 '"
exit sub 
end if
if locky = 2 then
li016.state = 1
playsound "vo_locked2"
lampiechange02
DMD "", "", "dmdL2", eNone, eNone, eNone, 4000, True, ""
vpmtimer.AddTimer 4000, "kickout006 '"
exit sub 
end if
if locky = 3 then
li075.state = 1
playsound "vo_locked3"
lampiechange03
DMD "", "", "dmdL3", eNone, eNone, eNone, 5000, True, ""
vpmtimer.AddTimer 5000, "kickout006 '"
exit sub 
end if
if locky = 4 then
li016.state = 2
li008.state = 2
li075.state = 2
playsound "vo_multiball"
lampiechange01
DMD "", "", "dmdL4", eNone, eNone, eNone, 3000, True, ""
vpmtimer.AddTimer 2100, "startmultibally '"
vpmtimer.AddTimer 2000, "kickout006 '"
exit sub 
end if
end sub

sub startmultibally
AddMultiball 3
locky = 0
vpmtimer.AddTimer 10000, "lightsmbout '"
end sub

sub lightsmbout
li016.state = 0
li008.state = 0
li075.state = 0
end sub

sub lampiechange01
lampion002
vpmtimer.AddTimer 1500, "lampion001 '"
end sub

sub lampiechange02
lampion002
vpmtimer.AddTimer 750, "lampion001 '"
vpmtimer.AddTimer 1200, "lampion002 '"
vpmtimer.AddTimer 1950, "lampion001 '"
end sub

sub lampiechange03
lampion002
vpmtimer.AddTimer 750, "lampion001 '"
vpmtimer.AddTimer 1200, "lampion002 '"
vpmtimer.AddTimer 1950, "lampion001 '"
vpmtimer.AddTimer 2300, "lampion002 '"
vpmtimer.AddTimer 3000, "lampion001 '"
end sub

sub lampion001
lampies.image = "lampoff"
end sub

sub lampion002
lampies.image = "lampon"
end sub

sub kickout006
Playsound "fx_kicker"
Kicker006.Kick 90, 26, 12
end sub

'************************
'church kicker
'************************

sub Kicker003_hit()
HoleBonus = HoleBonus + 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (100*PFMultiplier*kgbmulti)	
if modeon = 1 Then
GiveSlotAwardBaseliek
exit Sub
end if
churchpoints = churchpoints + 1
if churchpoints = 3 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 4 Then
stopsong
basiliekyblend
if rassput = 0 Then boss1starts
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '"
modeon = 1
exit sub
end if
if churchpoints = 6 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 7 Then
stopsong
basiliekyblend
startnobelprice
vpmtimer.AddTimer 3000, "GiveSlotAwardBaseliek '"
modeon = 1
exit sub
end if
if churchpoints = 9 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 12 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 15 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 18 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 21 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 23 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 25 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 27 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 29 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 31 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 33 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 35 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 37 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 39 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 41 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 43 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 45 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 47 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 49 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 51 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 53 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 55 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 57 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 59 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 61 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 63 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 65 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 67 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 69 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 71 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 73 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 75 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 77 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 79 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 81 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 83 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 85 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 87 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 89 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 91 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 93 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 95 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 97 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 99 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 101 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 103 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 105 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
if churchpoints = 107 Then
stopsong
basiliekyblend
enableheartss
modeon = 1
vpmtimer.AddTimer 2000, "GiveSlotAwardBaseliek '" 
exit sub
end if
'AddMultiball 1
basilieky
vpmtimer.AddTimer 1300, "GiveSlotAwardBaseliek '" 
end sub

Dim SlotValue:SlotValue = INT(RND(1)*2)

Sub GiveSlotAwardBaseliek()
	DMDFlush()
	Randomize()
	SlotValue = INT(RND(1)*2)
	Select Case SlotValue
		Case 0:kickout003a
		Case 1:kickout003b
	End Select
End Sub

sub kickout003a
Playsound "fx_kicker"
Kicker003.Kick 160, 9, 30
bassie.blenddisablelighting = 0
DMDScoreNow
end sub

sub kickout003b
Playsound "fx_kicker"
Kicker003.Kick -160, 9, 30
bassie.blenddisablelighting = 0
DMDScoreNow
end sub

sub basilieky
DMD "", "", "b1", eNone, eNone, eNone, 100, True, "":bassie.blenddisablelighting = 0.1
DMD "", "", "b2", eNone, eNone, eNone, 100, True, ""':bassie.blenddisablelighting = 0.2
DMD "", "", "b3", eNone, eNone, eNone, 100, True, "":bassie.blenddisablelighting = 0.2
DMD "", "", "b4", eNone, eNone, eNone, 100, True, ""':bassie.blenddisablelighting = 0.4
DMD "", "", "b5", eNone, eNone, eNone, 100, True, "":bassie.blenddisablelighting = 0.3
DMD "", "", "b6", eNone, eNone, eNone, 100, True, ""':bassie.blenddisablelighting = 0.6
DMD "", "", "b7", eNone, eNone, eNone, 100, True, "":bassie.blenddisablelighting = 0.4
DMD "", "", "b8", eNone, eNone, eNone, 100, True, ""':bassie.blenddisablelighting = 0.8
DMD "", "", "b9", eNone, eNone, eNone, 100, True, ""':bassie.blenddisablelighting = 0.9
DMD "", "", "b10", eNone, eNone, eNone, 400, True, "":bassie.blenddisablelighting = 1.0
end sub

sub basiliekyblend
bassie.blenddisablelighting = 0.1
bassie.blenddisablelighting = 0.2
bassie.blenddisablelighting = 0.3
bassie.blenddisablelighting = 0.4
bassie.blenddisablelighting = 1.0
end sub


'************************
' Hearth multiplier
'************************

sub enableheartss
li024.state = 0
li085.state = 0
li043.state = 2
Hhit = 0
playsound "vo_get_hart"
Hearth001.Visible = True
tsHearth001.enabled = True
Hearth002.Visible = True
tsHearth002.enabled = True
TrotateI004.enabled = true
vpmtimer.AddTimer 2000, "changesongies '" 
end sub

sub changesongies
playsong "8"
end sub

sub tsHearth001_hit
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
Hhit = Hhit + 1
li024.state = 1
playsound "hearth"
Hearth001.Visible = false
tsHearth001.enabled = false
checkHearthit
end sub

sub tsHearth002_hit
Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
Hhit = Hhit + 1
li085.state = 1
playsound "hearth"
Hearth002.Visible = false
tsHearth002.enabled = false
checkHearthit
end sub

Sub checkHearthit
if Hhit = 2 then
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
pfmulti = pfmulti + 1
playsound "vo_multiplier"
checkpfmulti
UpdateMusicNow
li043.state = 0
TrotateI004.enabled = False
modeon = 0
end if
end sub

Sub checkpfmulti
    Select Case pfmulti
Case 1 dmdx2
Case 2 dmdx3
Case 3 dmdx4
Case 4 dmdx5
Case 5 dmdx6
Case 6 dmdx7
Case 7 dmdx8
Case 8 dmdx9
Case 9 dmdx10
Case 10 dmdx11
Case 11 dmdx12
Case 12 dmdx13
Case 13 dmdx14
Case 14 dmdx15
Case 15 dmdx16
Case 16 dmdx17
Case 17 dmdx18
Case 18 dmdx19
Case 19 dmdx20
Case 20 dmdx21
Case 21 dmdx22
Case 22 dmdx23
Case 23 dmdx24
Case 24 dmdx25
Case 25 dmdx26
Case 26 dmdx27
Case 27 dmdx28
Case 28 dmdx29
Case 29 dmdx30
Case 30 dmdx31
Case 31 dmdx32
Case 32 dmdx33
Case 33 dmdx34
Case 34 dmdx35
Case 35 dmdx36
Case 36 dmdx37
Case 37 dmdx38
Case 38 dmdx39
Case 39 dmdx40
Case 40 dmdx41
Case 41 dmdx42
Case 42 dmdx43
Case 43 dmdx44
Case 44 dmdx45
Case 45 dmdx46
Case 46 dmdx47
Case 47 dmdx48
Case 48 dmdx49
Case 49 dmdx50
    End Select
end sub

'************************
'stalin
'************************
sub Kicker007_hit()
HoleBonus = HoleBonus + 1
if stalinstart = 0 Then
StopSong
DMD "", "", "dmdbossy", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss3", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
stalinstart = 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
vpmtimer.addtimer 3000, "kickout007 '"
Playsong "10"
li110.state = 2
exit sub
end if
Shit = Shit + 1
if Shit = 1 then
StopSong
Playsong "10"
playsound "vo_hit2"
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
li079.state = 1
checkdistalin
kickout007
exit sub
end if
if Shit = 2 then
StopSong
Playsong "10"
playsound "vo_hit2"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
li080.state = 1
checkdistalin
kickout007
exit sub
end if
if Shit = 3 then
Score(CurrentPlayer) = Score(CurrentPlayer) + (4000*PFMultiplier*kgbmulti)
Trigger002.enabled = true
playsound "vo_hit2"
li081.state = 1
checkdistalin
exit sub
end if
kickout007
end sub

sub checkdistalin
if Shit = 3 then
playsound "vo_object_complete"
UpdateMusicNow
Score(CurrentPlayer) = Score(CurrentPlayer) + (5000*PFMultiplier*kgbmulti)
DMD "", "", "dmdhealth4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss3", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
Bbosses = Bbosses + 1
checkbigboss
li110.state = 1
'stalinstart = 0
'li079.state = 0
'li080.state = 0
'li081.state = 0
kickout007
'kickout0072
end if
end sub

'sub resetstalin
'Shit = 0
'li110.state = 1
'stalinstart = 0
'li079.state = 0
'li080.state = 0
'li081.state = 0
'end sub

sub Trigger002_hit()
Target013.Isdropped = False
Playsound SoundFXDOF("Drop_reset_L", 119, DOFPulse, DOFContactors)
Trigger002.enabled = False
end sub

sub kickout007
Playsound SoundFXDOF("fx_kicker", 118, DOFPulse, DOFContactors)
Kicker007.Kick 220, 9, 30
end sub

sub kickout0072
Playsound SoundFXDOF("fx_kicker", 118, DOFPulse, DOFContactors)
Kicker007.Kick 220, 9, 30
vpmtimer.addtimer 2000, "resetstalin '"
end sub


'************
' Spinning Disc - RetroG33K
'************

'******* Left Clockwise Spinning Disc *********

Dim LmDISC
    Set LmDISC=New cvpmTurnTable
		LmDISC.InitTurnTable SpinningDiskTrigger1,Ldiscspeed
		LmDISC.SpinUp=50
		LmDISC.SpinDown=10
		LmDISC.CreateEvents"LmDISC"

Sub LRotationTimer_Timer
    dim Ltemptimer
    if LmDisc.speed > 0 Then
        Ltemptimer = int(((1/LmDisc.speed)*50)+0.5)
        if Ltemptimer<1 Then
                LRotationTimer.interval = 1
            elseif Ltemptimer>100 then
                LRotationTimer.interval = 100
            else Lrotationtimer.interval=Ltemptimer
        end if
        SpinningDiskL.ObjRotz = (SpinningDiskL.ObjRotz + Ldiscrotspeed) MOD 360
      Else
        LRotationTimer.interval = 1
        SpinningDiskL.ObjRotz=90
    end If
End Sub

'****** Left Clockwise Stop SpinDisc ***************

Sub LStopDisc
	LmDISC.MotorOn = 0
	stopsound "disc_noise"
	stopsound "disc_noise1"
	stopsound "Disc_Noise2"
End Sub

'******* Left Counter Clockwise Spinning Disc *********

Dim LCCmDISC
    Set LCCmDISC=New cvpmTurnTable
		LCCmDISC.InitTurnTable SpinningDiskTrigger1,LCCdiscspeed
		LCCmDISC.SpinUp=1000
		LCCmDISC.SpinDown=10
		LCCmDISC.CreateEvents"LCCmDISC"

'Thanks DAPHISHBOWL!!

Sub LCCRotationTimer_Timer
    dim LCCtemptimer
    if LCCmDisc.speed > 0 Then
        LCCtemptimer = int(((1/LCCmDisc.speed)*100)+0.5)
        if LCCtemptimer<1 Then
                LCCRotationTimer.interval = 1
            elseif LCCtemptimer>100 then
                LCCRotationTimer.interval = 100
            else LCCrotationtimer.interval=LCCtemptimer
        end if
        SpinningDiskL.ObjRotz = (SpinningDiskL.ObjRotz + LCCdiscrotspeed) MOD 360
      Else
        LCCRotationTimer.interval = 1
        SpinningDiskL.ObjRotz=0
    end If
End Sub

'****** Left Counter Clockwise Stop SpinDisc ***************

Sub LCCStopDisc
	LCCmDISC.MotorOn = 0
	stopsound "disc_noise"
	stopsound "disc_noise1"
	stopsound "Disc_Noise2"
End Sub

'*****************
'Gates
'*****************
sub Gate_Hit()
End Sub

sub Trigger005_hit()
If activeball.vely < 0 then
spy = spy + 1
if spy=1 Then
countr42 = 0
playsound "spying"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
Tboard001.enabled=true
li123.state=2
vpmtimer.AddTimer 1400, "changeboardAsia '" 
exit sub
end if
if spy=2 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=3 Then
Tboard003.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
board.image="scas"
countr43 = 0
li123.state=1
vpmtimer.AddTimer 2000, "changenormalboard '" 
exit sub
end if
if spy=4 Then
Tboard002.enabled=False
countr42 = 0
playsound "spying"
Tboard001.enabled=true
li125.state=2
vpmtimer.AddTimer 1400, "changeboardMidleEast '" 
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
exit sub
end if
if spy=5 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=6 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=7 Then
Tboard004.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
countr43 = 0
li125.state=1
board.image="scme"
vpmtimer.AddTimer 3000, "changenormalboard '" 
exit sub
end if
if spy=8 Then
Tboard002.enabled=False
countr42 = 0
playsound "spying"
Tboard001.enabled=true
li124.state=2
vpmtimer.AddTimer 1400, "changeboardEurope '"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
exit sub
end if
if spy=9 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=10 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=11 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=12 Then
Tboard005.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
countr43 = 0
li124.state=1
board.image="sceuro"
vpmtimer.AddTimer 3000, "changenormalboard '" 
exit sub
end if
if spy=13 Then
Tboard002.enabled=False
countr42 = 0
playsound "spying"
Tboard001.enabled=true
li126.state=2
vpmtimer.AddTimer 1400, "changeboardNamerica '"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti) 
exit sub
end if
if spy=14 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=15 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=16 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=17 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=18 Then
Tboard006.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
countr43 = 0
li126.state=1
board.image="scna"
vpmtimer.AddTimer 3000, "changenormalboard '" 
exit sub
end if
if spy=19 Then
Tboard002.enabled=False
countr42 = 0
playsound "spying"
Tboard001.enabled=true
li122.state=2
vpmtimer.AddTimer 1400, "changeboardAfrica '"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti) 
exit sub
end if
if spy=20 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=21 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=22 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=23 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=24 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=25 Then
Tboard007.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
countr43 = 0
li122.state=1
board.image="scaf"
vpmtimer.AddTimer 3000, "changenormalboard '" 
exit sub
end if
if spy=26 Then
Tboard002.enabled=False
countr42 = 0
playsound "spying"
Tboard001.enabled=true
li127.state=2
vpmtimer.AddTimer 1400, "changeboardSamerica '"
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
exit sub
end if
if spy=27 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=28 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=29 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=30 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=31 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=32 Then
Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
animationsatalite
exit sub
end if
if spy=33 Then
Tboard008.enabled=false
playsound "vo_continent_spying_complete"
Score(CurrentPlayer) = Score(CurrentPlayer) + (3000*PFMultiplier*kgbmulti)
countr43 = 0
li127.state=1
board.image="scsa"
vpmtimer.AddTimer 3000, "changenormalboard '" 
exit sub
end if
if spy=34 Then
spy=0
li122.state=0
li123.state=0
li124.state=0
li125.state=0
li126.state=0
li127.state=0
exit sub
end if
else
end if 
end sub

sub changenormalboard
Tboard002.enabled=true
end sub

sub changeboardAsia
Tboard002.enabled=False
board.Image = "sbas1"
vpmtimer.AddTimer 1500, "enablespyingasia '" 
end sub

sub changeboardMidleEast
Tboard002.enabled=False
board.Image = "sbme1"
vpmtimer.AddTimer 1500, "enablespyingMidleEast '" 
end sub

sub changeboardEurope
Tboard002.enabled=False
board.Image = "sbeu1"
vpmtimer.AddTimer 1500, "enablespyingEurope '" 
end sub

sub changeboardNamerica
Tboard002.enabled=False
board.Image = "sbna1"
vpmtimer.AddTimer 1500, "enablespyingNamerica '" 
end sub

sub changeboardAfrica
Tboard002.enabled=False
board.Image = "sbaf1"
vpmtimer.AddTimer 1500, "enablespyingAfrika '" 
end sub

sub changeboardSamerica
Tboard002.enabled=False
board.Image = "sbsa1"
vpmtimer.AddTimer 1500, "enablespyingSamerica '" 
end sub

sub enablespyingasia
Tboard003.enabled=true
end sub

sub enablespyingMidleEast
Tboard004.enabled=true
end sub

sub enablespyingEurope
Tboard005.enabled=true
end sub

sub enablespyingNamerica
Tboard006.enabled=true
end sub

sub enablespyingAfrika
Tboard007.enabled=true
end sub

sub enablespyingSamerica
Tboard008.enabled=true
end sub

sub animationsatalite
TrotateI001.Enabled = false
TrotateI002.Enabled = false
satalite.visible = False
dish.RotY= 0
satalite.TransX = 0
satalite.visible = True
TrotateI002.Enabled = true
TrotateI001.Enabled = true
playsound "satalite"
end sub


sub Tboard001_timer
countr42 = countr42 + 1 : If countr42 > 12 then Tboard001.enabled=false : end If 
select case countr42
				case 1 : board.image ="sb5"
				case 2 : board.image ="sb6"
				case 3 : board.image ="sb7"
				case 4 : board.image ="sb8"
				case 5 : board.image ="sb5"
				case 6 : board.image ="sb6"
				case 7 : board.image ="sb7"
				case 8 : board.image ="sb8"
				case 9 : board.image ="sb5"
				case 10 : board.image ="sb6" 
				case 11 : board.image ="sb7" 
				case 12 : board.image ="sb8" 
			end Select
End Sub


sub Tboard002_timer
countr43 = countr43 + 1 : If countr43 > 4 then countr43=1 : end If 
select case countr43
				case 1 : board.image ="sb2"
				case 2 : board.image ="sb2"
				case 3 : board.image ="sb3"
				case 4 : board.image ="sb4"
			end Select
End Sub

sub Tboard003_timer
countr44 = countr44 + 1 : If countr44 > 4 then countr44=1 : end If 
select case countr44
				case 1 : board.image ="sbas2"
				case 2 : board.image ="sbas3"
				case 3 : board.image ="sbas4"
				case 4 : board.image ="sbas5"
			end Select
End Sub

sub Tboard004_timer
countr45 = countr45 + 1 : If countr45 > 4 then countr45=1 : end If 
select case countr45
				case 1 : board.image ="sbme2"
				case 2 : board.image ="sbme3"
				case 3 : board.image ="sbme4"
				case 4 : board.image ="sbme5"
			end Select
End Sub

sub Tboard005_timer
countr46 = countr46 + 1 : If countr46 > 4 then countr46=1 : end If 
select case countr46
				case 1 : board.image ="sbeu2"
				case 2 : board.image ="sbeu3"
				case 3 : board.image ="sbeu4"
				case 4 : board.image ="sbeu5"
			end Select
End Sub

sub Tboard006_timer
countr47 = countr47 + 1 : If countr47 > 4 then countr47=1 : end If 
select case countr47
				case 1 : board.image ="sbna2"
				case 2 : board.image ="sbna3"
				case 3 : board.image ="sbna4"
				case 4 : board.image ="sbna5"
			end Select
End Sub

sub Tboard007_timer
countr48 = countr48 + 1 : If countr48 > 4 then countr48=1 : end If 
select case countr48
				case 1 : board.image ="sbaf2"
				case 2 : board.image ="sbaf3"
				case 3 : board.image ="sbaf4"
				case 4 : board.image ="sbaf5"
			end Select
End Sub

sub Tboard008_timer
countr49 = countr49 + 1 : If countr49 > 4 then countr49=1 : end If 
select case countr49
				case 1 : board.image ="sbsa2"
				case 2 : board.image ="sbsa3"
				case 3 : board.image ="sbsa4"
				case 4 : board.image ="sbsa5"
			end Select
End Sub




Sub SpinnerStop_Hit(idx)
	LStopDisc
	LCCStopDisc
PlaySoundAtBall "rollover"
End Sub

Sub SpinnerGates_Hit(idx)
	PlaySoundatBall "fx_gate"
	LmDISC.MotorOn = 1:LRotationtimer.interval =1
	LccmDisc.MotorOn= 1:LRotationtimer.interval =1
'	Playsound "disc_noise"
End Sub


sub Gate002_hit()
If activeball.vely < 0 then
playsound "LADAHORN"
FlashForMs Flasher001, 1000, 50, 0
FlashForMs Flasher002, 1000, 50, 0
else
end if
end sub

' *************************************************
' ***** Stalin Look at ball system **********
' *************************************************
'TODO Look at what's wrong with the math he seems to be looking someplace else, yet following the ball, maybe on another axis?

Sub RotateWW_Timer 
	Dim obj, BOT, b
	Dim Offset : Offset = 90
	BOT = GetBalls

	'If WWpos = WWdest Then
	'	Me.Enabled = 0
	'End If
	
	'Make sure only one ball is on playfield
	If UBound(BOT) = -1 Then
		'Debug.Print ("No Ball On Table")
		Exit Sub
	End If
	
	
	'For b = 0 to UBound(BOT) 
	'	Debug.Print "Balls On Table"
	'	Debug.Print UBound(BOT)
	'Next
	
	'Dim BallPosX : BallPosX = BOT(2).X ' Set to values between 0-2 for captive balls may need to set a different offset as well
	'Dim BallPosY : BallPosY = BOT(2).Y
	
	Dim BallPosX : BallPosX = BOT(UBound(BOT)).X
	Dim BallPosY : BallPosY = BOT(UBound(BOT)).Y
	'Debug.Print ("X")
	'Debug.Print BallPosX
	'Debug.Print ("Y")
	'Debug.Print BallPosY
	
	
	Dim DistanceX : DistanceX = Stalin(0).X - BallPosX
	Dim DistanceY : DistanceY = Stalin(0).Y - BallPosY
	Dim WWDist : WWDist  = 0.5 * (DistanceX + DistanceY + max(DistanceX, DistanceY))
	Debug.Print WWDist
	
	if abs(WWDist) > 100 Then	
		For Each obj in Stalin						 
				Dim SourcePosX : SourcePosX = obj.X
				Dim SourcePosY : SourcePosY = obj.Y
				'obj.RotZ = (dAtn2(SourcePosY - BallPosY, SourcePosX - BallPosX) * 180 / PI) *-.1 
				Dim rotation : rotation = dAtn2( BallPosY - SourcePosY, BallPosX - SourcePosX) * -1 + Offset
				'obj.RotZ = dAtn2( BallPosY - SourcePosY, BallPosX - SourcePosX) * -1 + Offset
				'obj.RotZ = obj.RotZ - 1				
				obj.ObjRotZ = rotation				
		Next
	End If
	
	
	
End Sub

' Math Utilities for implemeting Atan and Atan2
'Dim Pi : Pi = csng(4*Atn(1))					'3.1415926535897932384626433832795

Function dAtn(x)  
	datn = atn(x) * 180 / Pi
End Function

Function dAtn2(X, Y)
	If X > 0 Then
		dAtn2 = dAtn(Y / X)
	ElseIf X < 0 Then
		dAtn2 = dAtn(Y / X) + 180 * Sgn(Y)
		If Y = 0 Then dAtn2 = dAtn2 + 180
		If Y < 0 Then dAtn2 = dAtn2 + 360
	Else
		dAtn2 = 90 * Sgn(Y)
	End If
	dAtn2 = dAtn2+90
End Function



' *************************************************
' ***** Babuska animation **********
' *************************************************
Sub babtimer_Timer
countr40 = countr40 + 1 : If Countr40 > 12 then Countr40 = 0 : babtimer.enabled = false : end If 
select case countr40
				case 1 : Bab001.visible=true
				case 2 : Bab001.visible=False:Bab002.visible=true
				case 3 : Bab002.visible=False:Bab003.visible=true
				case 4 : Bab003.visible=False:Bab004.visible=true
				case 5 : Bab004.visible=False:Bab005.visible=true
				case 6 : Bab005.visible=False:Bab006.visible=true
				case 7 : Bab006.visible=False:Bab007.visible=true
				case 8 : Bab007.visible=False:Bab008.visible=true
				case 9 : Bab008.visible=False:Bab009.visible=true
				case 10 : Bab009.visible=False:Bab010.visible=true
				case 11 : Bab010.visible=False:Bab011.visible=true
			end Select
End Sub

Sub babtimer001_Timer
countr41 = countr41 + 1 : If Countr41 > 10 then Countr41 = 0 : babtimer001.enabled=false : end If 
select case countr41
				case 1 : Bab011.visible=False:Bab012.visible=true
				case 2 : Bab012.visible=False:Bab013.visible=True
				case 3 : Bab013.visible=False:Bab014.visible=True
				case 4 : Bab014.visible=False:Bab015.visible=True
				case 5 : Bab015.visible=False:Bab016.visible=True
				case 6 : Bab016.visible=False:Bab017.visible=True
				case 7 : Bab017.visible=False:Bab018.visible=True
				case 8 : Bab018.visible=False:Bab019.visible=True
				case 9 : Bab019.visible=False:Bab020.visible=True
				case 10 : Bab020.visible=False:Bab021.visible=True 
			end Select
End Sub

'************************
' ak-bullits
'************************



'**********************************************************
'DMD subs
'**********************************************************

'bears*****************************************************

sub showdmdbear
	DMD "", "", "bear1", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear2", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear3", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear4", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear5", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear6", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear7", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear8", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear9", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear10", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear12", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear13", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear14", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear15", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear14", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear15", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear14", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear15", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bear14", eNone, eNone, eNone, 100, True, ""
end sub

sub showdmdbearB
	DMD "", "", "bearh11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh12", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh12", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh12", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh12", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh11", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh12", eNone, eNone, eNone, 100, True, ""
end sub

sub showdmdbearE
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh21", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh22", eNone, eNone, eNone, 100, True, ""
end sub

sub showdmdbearA
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh31", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh32", eNone, eNone, eNone, 100, True, ""
end sub

sub showdmdbearR
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh41", eNone, eNone, eNone, 100, True, ""
	DMD "", "", "bearh42", eNone, eNone, eNone, 100, True, ""
end sub

'vodka*****************************************************

sub vodka1
DMD "", "", "vdk1", eNone, eNone, eNone, 500, True, ""
end sub

sub vodka2
DMD "", "", "vdk2", eNone, eNone, eNone, 500, True, ""
end sub

sub vodka3
DMD "", "", "vdk3", eNone, eNone, eNone, 500, True, ""
end sub

sub vodka4
DMD "", "", "vdk4", eNone, eNone, eNone, 500, True, ""
end sub

sub vodka5
DMD "", "", "vdk5", eNone, eNone, eNone, 500, True, ""
end sub

'nukes*****************************************************

sub nukerbegin
DMD "", "", "nuker1", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker2", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker3", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker4", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker5", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker6", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker7", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker8", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker9", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker10", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker11", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker12", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker13", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker14", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker15", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker16", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker17", eNone, eNone, eNone, 100, True, ""
DMD "", "", "nuker18", eNone, eNone, eNone, 500, True, ""
end sub

sub nukeN
DMD "", "", "nke11", eNone, eNone, eNone, 500, True, ""
end sub

sub nukeU
DMD "", "", "nke21", eNone, eNone, eNone, 500, True, ""
end sub

sub nukeK
DMD "", "", "nke31", eNone, eNone, eNone, 500, True, ""
end sub

sub nukeE
DMD "", "", "nke41", eNone, eNone, eNone, 500, True, ""
end sub

sub nukeS
DMD "", "", "nke51", eNone, eNone, eNone, 500, True, ""
end sub

'mania*****************************************************

sub mandia1
DMD "", "", "man11", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man12", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man13", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man14", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man11", eNone, eNone, eNone, 100, True, ""
end sub

sub mandia2
DMD "", "", "man21", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man22", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man23", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man24", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man21", eNone, eNone, eNone, 100, True, ""
end sub

sub mandia3
DMD "", "", "man31", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man32", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man33", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man34", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man31", eNone, eNone, eNone, 100, True, ""
end sub

sub mandia4
DMD "", "", "man41", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man42", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man43", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man44", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man41", eNone, eNone, eNone, 100, True, ""
end sub

sub mandia5
DMD "", "", "man51", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man52", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man53", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man54", eNone, eNone, eNone, 100, True, ""
DMD "", "", "man51", eNone, eNone, eNone, 100, True, ""
end sub

'KGB*****************************************************

sub kgblvl1
li049.state=1
kgbmulti = 1
Playsound "vo_level_01"
DMD "", "", "lvl1", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl2
li050.state=1
kgbmulti = 2
Playsound "vo_level_02"
DMD "", "", "lvl2", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl3
li051.state=1
kgbmulti = 3
Playsound "vo_level_03"
DMD "", "", "lvl3", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl4
li052.state=1
kgbmulti = 4
Playsound "vo_level_04"
DMD "", "", "lvl4", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl5
li053.state=1
kgbmulti = 5
Playsound "vo_level_05"
DMD "", "", "lvl5", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl6
li054.state=1
kgbmulti = 6
Playsound "vo_level_06"
DMD "", "", "lvl6", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl7
li055.state=1
kgbmulti = 7
Playsound "vo_level_07"
DMD "", "", "lvl7", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl8
li056.state=1
kgbmulti = 8
Playsound "vo_level_08"
DMD "", "", "lvl8", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl9
li057.state=1
kgbmulti = 9
Playsound "vo_level_09"
DMD "", "", "lvl9", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl10
li058.state=1
kgbmulti = 10
Playsound "vo_level_10"
DMD "", "", "lvl10", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl11
li059.state=1
kgbmulti = 11
Playsound "vo_level_11"
DMD "", "", "lvl11", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl12
li060.state=1
kgbmulti = 12
Playsound "vo_level_12"
DMD "", "", "lvl12", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl13
li061.state=1
kgbmulti = 13
Playsound "vo_level_13"
DMD "", "", "lvl13", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl14
li062.state=1
kgbmulti = 14
Playsound "vo_level_14"
DMD "", "", "lvl14", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl15
li063.state=1
kgbmulti = 15
Playsound "vo_level_15"
DMD "", "", "lvl15", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl16
li064.state=1
kgbmulti = 16
Playsound "vo_level_16"
DMD "", "", "lvl16", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl17
li065.state=1
kgbmulti = 17
Playsound "vo_level_17"
DMD "", "", "lvl17", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl18
li066.state=1
kgbmulti = 18
Playsound "vo_level_18"
DMD "", "", "lvl18", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl19
li067.state=1
kgbmulti = 19
Playsound "vo_level_19"
DMD "", "", "lvl19", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl20
li068.state=1
kgbmulti = 20
Playsound "vo_level_20"
DMD "", "", "lvl20", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl21
li069.state=1
kgbmulti = 21
Playsound "vo_level_21"
DMD "", "", "lvl21", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl22
li070.state=1
kgbmulti = 22
Playsound "vo_level_22"
DMD "", "", "lvl22", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl23
li071.state=1
kgbmulti = 23
Playsound "vo_level_23"
DMD "", "", "lvl23", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl24
li072.state=1
kgbmulti = 24
Playsound "vo_level_24"
DMD "", "", "lvl24", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl25
li073.state=1
kgbmulti = 25
Playsound "vo_level_25"
DMD "", "", "lvl25", eNone, eNone, eNone, 500, True, ""
end sub

sub kgblvl26
li074.state=1
kgbmulti = 26
Playsound "vo_level_26"
DMD "", "", "lvl26", eNone, eNone, eNone, 500, True, ""
end sub

'COMRADE*****************************************************

sub comradeCL
DMD "", "", "comy", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy0", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy0", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy0", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy0", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy", eNone, eNone, eNone, 100, True, ""
DMD "", "", "comy0", eNone, eNone, eNone, 100, True, ""
end sub

sub comradeC
DMD "", "", "comy11", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeO
DMD "", "", "comy21", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeM
DMD "", "", "comy31", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeR
DMD "", "", "comy41", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeA
DMD "", "", "comy51", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeD
DMD "", "", "comy61", eNone, eNone, eNone, 500, True, ""
end sub

sub comradeE
DMD "", "", "comy71", eNone, eNone, eNone, 500, True, ""
end sub

'Amunition*****************************************************

sub kogel1
DMD "", "", "akb1", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel2
DMD "", "", "akb2", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel3
DMD "", "", "akb3", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel4
DMD "", "", "akb4", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel5
DMD "", "", "akb5", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel6
DMD "", "", "akb6", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel7
DMD "", "", "akb7", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel8
DMD "", "", "akb8", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel9
DMD "", "", "akb9", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel10
DMD "", "", "akb10", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel11
DMD "", "", "akb11", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel12
DMD "", "", "akb12", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel13
DMD "", "", "akb13", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel14
DMD "", "", "akb14", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel15
DMD "", "", "akb15", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel16
DMD "", "", "akb16", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel17
DMD "", "", "akb17", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel18
DMD "", "", "akb18", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel19
DMD "", "", "akb19", eNone, eNone, eNone, 500, True, ""
end sub

sub kogel20
DMD "", "", "akb20", eNone, eNone, eNone, 500, True, ""
end sub

sub kogelempty
kogelemptydmd
if getnewbullits = 1 then exit sub
if AKbullits = 0 then
getnewbullits = 1
enablemagazines
end if
end sub

sub kogelemptydmd
DMD "", "", "akb0", eNone, eNone, eNone, 500, True, ""
DMD "", "", "akb00", eNone, eNone, eNone, 500, True, ""
end sub

'Multiplier*****************************************************

sub dmdx2
DMD "", "", "dmdx2", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 2
end sub

sub dmdx3
DMD "", "", "dmdx3", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 3
end sub

sub dmdx4
DMD "", "", "dmdx4", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 4
end sub

sub dmdx5
DMD "", "", "dmdx5", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 5
end sub

sub dmdx6
DMD "", "", "dmdx6", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 6
end sub

sub dmdx7
DMD "", "", "dmdx7", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 7
end sub

sub dmdx8
DMD "", "", "dmdx8", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 8
end sub

sub dmdx9
DMD "", "", "dmdx9", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 9
end sub

sub dmdx10
DMD "", "", "dmdx10", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 10
end sub

sub dmdx11
DMD "", "", "dmdx11", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 11
end sub

sub dmdx12
DMD "", "", "dmdx12", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 12
end sub

sub dmdx13
DMD "", "", "dmdx13", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 13
end sub

sub dmdx14
DMD "", "", "dmdx14", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 14
end sub

sub dmdx15
DMD "", "", "dmdx15", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 15
end sub

sub dmdx16
DMD "", "", "dmdx16", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 16
end sub

sub dmdx17
DMD "", "", "dmdx17", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 17
end sub

sub dmdx18
DMD "", "", "dmdx18", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 18
end sub

sub dmdx19
DMD "", "", "dmdx19", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 19
end sub

sub dmdx20
DMD "", "", "dmdx20", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 20
end sub

sub dmdx21
DMD "", "", "dmdx21", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 21
end sub

sub dmdx22
DMD "", "", "dmdx22", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 22
end sub

sub dmdx23
DMD "", "", "dmdx23", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 23
end sub

sub dmdx24
DMD "", "", "dmdx24", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 24
end sub

sub dmdx25
DMD "", "", "dmdx25", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 25
end sub

sub dmdx26
DMD "", "", "dmdx26", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 26
end sub

sub dmdx27
DMD "", "", "dmdx27", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 27
end sub

sub dmdx28
DMD "", "", "dmdx28", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 28
end sub

sub dmdx29
DMD "", "", "dmdx29", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 29
end sub

sub dmdx30
DMD "", "", "dmdx30", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 30
end sub

sub dmdx31
DMD "", "", "dmdx31", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 31
end sub

sub dmdx32
DMD "", "", "dmdx32", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 32
end sub

sub dmdx33
DMD "", "", "dmdx33", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 33
end sub

sub dmdx34
DMD "", "", "dmdx34", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 34
end sub

sub dmdx35
DMD "", "", "dmdx35", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 35
end sub

sub dmdx36
DMD "", "", "dmdx36", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 36
end sub

sub dmdx37
DMD "", "", "dmdx37", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 37
end sub

sub dmdx38
DMD "", "", "dmdx38", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 38
end sub

sub dmdx39
DMD "", "", "dmdx39", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 39
end sub

sub dmdx40
DMD "", "", "dmdx40", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 40
end sub

sub dmdx41
DMD "", "", "dmdx41", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 41
end sub

sub dmdx42
DMD "", "", "dmdx42", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 42
end sub

sub dmdx43
DMD "", "", "dmdx43", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 43
end sub

sub dmdx44
DMD "", "", "dmdx44", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 44
end sub

sub dmdx45
DMD "", "", "dmdx45", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 45
end sub

sub dmdx46
DMD "", "", "dmdx46", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 46
end sub

sub dmdx47
DMD "", "", "dmdx47", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 47
end sub

sub dmdx48
DMD "", "", "dmdx48", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 48
end sub

sub dmdx49
DMD "", "", "dmdx49", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 49
end sub

sub dmdx50
DMD "", "", "dmdx50", eNone, eNone, eNone, 1000, True, ""
PFMultiplier = 50 
end sub

'********************************************
'end of ball
'********************************************

sub endofballput
DMD "", "", "PUTL19", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL20", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL21", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL22", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL23", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL24", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL25", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL26", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL27", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL28", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL29", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL30", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL31", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL32", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL33", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL34", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL35", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL36", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL37", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL38", eNone, eNone, eNone, 100, True, ""
DMD "", "", "PUTL39", eNone, eNone, eNone, 100, True, ""

end sub


'**********************************************************
' Timers
'**********************************************************

sub TrotateI001_timer()
   dish.RotY= dish.RotY+ 10
   if dish.RotY> 360 then
	   TrotateI001.Enabled = false
	   dish.RotY= 0	
end if
end sub

sub TrotateI002_timer()
satalite.TransX = satalite.TransX + 20
   if satalite.TransX> 720 then
	   TrotateI002.Enabled = false
	   satalite.visible = False
	   satalite.TransX = 0
end if
end sub


sub TrotateI003_timer()
   magazine001.ObjRotZ= magazine001.ObjRotZ+ 10
   if magazine001.ObjRotZ> 360 then
	   magazine001.ObjRotZ= 0	
end if
   magazine002.ObjRotZ= magazine002.ObjRotZ+ 10
   if magazine002.ObjRotZ> 360 then
	   magazine002.ObjRotZ= 0	
end if
end sub

sub TrotateI004_timer()
   Hearth001.RotY= Hearth001.RotY+ 10
   if Hearth001.RotY> 360 then
	   Hearth001.RotY= 0	
end if
   Hearth002.RotY= Hearth002.RotY+ 10
   if Hearth002.RotY> 360 then
	   Hearth002.RotY= 0	
end if
end sub 

sub TrotateI005_timer()
   price.RotY= price.RotY+ 10
   if price.RotY> 360 then
	   price.RotY= 0	
end if
end sub 

sub lightsout
li001.state=0
li002.state=0
li003.state=0
li004.state=0
li005.state=0
li006.state=0
li007.state=0
li008.state=0
li009.state=0
li010.state=0
li011.state=0
li012.state=0
li013.state=0
li014.state=0
li015.state=0
li016.state=0
li017.state=0
li018.state=0
li019.state=0
li020.state=0
li021.state=0
li022.state=0
li023.state=0
li024.state=0
li025.state=0
li026.state=0
li027.state=0
li028.state=0
li029.state=0
li030.state=0
li031.state=0
li032.state=0
li033.state=0
li034.state=0
li035.state=0
li036.state=0
li037.state=0
li038.state=0
li039.state=0
li040.state=0
li041.state=0
li042.state=0
li043.state=0
li044.state=0
li045.state=0
li046.state=0
li047.state=0
li048.state=0
li049.state=0
li050.state=0
li051.state=0
li052.state=0
li053.state=0
li054.state=0
li055.state=0
li056.state=0
li057.state=0
li058.state=0
li059.state=0
li060.state=0
li061.state=0
li062.state=0
li063.state=0
li064.state=0
li065.state=0
li066.state=0
li067.state=0
li068.state=0
li069.state=0
li070.state=0
li071.state=0
li072.state=0
li073.state=0
li074.state=0
li075.state=0
li076.state=0
li077.state=0
li078.state=0
li079.state=0
li080.state=0
li081.state=0
li082.state=0
li083.state=0
li084.state=0
li085.state=0
li086.state=0
li087.state=0
li088.state=0
li089.state=0
li090.state=0
li091.state=0
li092.state=0
li093.state=0
li094.state=0
li095.state=0
li096.state=0
li097.state=0
li098.state=0
li099.state=0
li100.state=0
li101.state=0
li102.state=0
li103.state=0
li104.state=0
li105.state=0
li106.state=0
li107.state=0
li108.state=0
li109.state=0
li110.state=0
li111.state=0
li112.state=0
li113.state=0
li114.state=0
li115.state=0
li116.state=0
li117.state=0
li118.state=0
li119.state=0
li120.state=0
li121.state=0
li122.state=0
li123.state=0
li124.state=0
li125.state=0
li126.state=0
li127.state=0
li128.state=0
li129.state=0
li130.state=0
li131.state=0
li132.state=0
li133.state=0
li134.state=0
li135.state=0
li136.state=0
li137.state=0
li138.state=0
li1000.state=0
Balloon.Visible = False
puidle.Visible = true
Target013.IsDropped=false
TrotateI003.enabled = false
Magazine001.Visible = false
tsMagazine001.enabled = false
Magazine002.Visible = false
tsMagazine002.enabled = false
BearChecker = 0
bearhits = 0
BearM = 0
putwait = 0
Tbear001.enabled = False
Tbear002.enabled = False
Tbear003.enabled = False
bear.visible = true
Wall046.Isdropped = True
Wall045.Isdropped = True
rasphit = 0
drink = 0
moveBeardown
resetbabsys
lighty001.Image = "bulb_green"
lighty002.Image = "bulb_red"
Hearth001.Visible = False
tsHearth001.enabled = False
Hearth002.Visible = False
tsHearth002.enabled = False
TrotateI004.enabled = False
TrotateI005.enabled = False
TNP001.enabled = 0
TNP002.enabled = 0
TNP003.enabled = 0
movenobelpricedown
Tboard001.enabled=false
Tboard002.enabled=false
Tboard003.enabled=false
Tboard004.enabled=false
Tboard005.enabled=false
Tboard006.enabled=false
Tboard007.enabled=false
Tboard008.enabled=false
nuke001.visible =true
nuke002.visible =true
nuke003.visible =true
nuke004.visible =true
nuke005.visible =true
board.image ="sb1"
spy=0
FireTimer.enabled = false
explosion1.visible = False
explosion007.visible = False
explosion001.visible = False
explosion003.visible = False
explosion006.visible = False
explosion005.visible = False
explosion004.visible = False
explosion002.visible = False
gasbuis1.Image="gaspipedefuse1"
gasbuis2.Image="gaspipedefuse1"
if rassput = 1 then
Trasputinup.enabled = True
end if
end sub

sub resetbabsys
bab002.visible = false
bab003.visible = false
bab004.visible = false
bab005.visible = false
bab006.visible = false
bab007.visible = false
bab008.visible = false
bab009.visible = false
bab010.visible = false
bab011.visible = false
bab012.visible = false
bab013.visible = false
bab014.visible = false
bab015.visible = false
bab016.visible = false
bab017.visible = false
bab018.visible = false
bab019.visible = false
bab020.visible = false
bab021.visible = false
bab001.visible = true
end sub

'********************************
'BOSSES
'********************************

'*****BOSS 1 Rasputin

Sub boss1starts
li115.state = 2
li108.state = 2
StopSong
playsound "vo_hit_rasputin"
vpmtimer.addtimer 2000, "playstalingsong '"
Trasputindown.enabled = True
Wall046.Isdropped = false
Wall045.Isdropped = false
DMD "", "", "dmdbossy", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss1", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
end sub

sub playstalingsong
PlaySong "9"
end sub

sub Wall045_hit()
Score(CurrentPlayer) = Score(CurrentPlayer) + (1000*PFMultiplier*kgbmulti)
playsound "vo_hit1"
rasphit = rasphit + 1
checkrasphits
end sub 

sub checkrasphits
		select case rasphit
				case 1 : health1:playstalingsong
				case 2 : health2:playstalingsong
				case 3 : defeatboss1
			end Select
end sub

sub health1
DMD "", "", "dmdhealth2", eNone, eNone, eNone, 1000, True, ""
end sub 

sub health2
DMD "", "", "dmdhealth3", eNone, eNone, eNone, 1000, True, ""
end sub 

sub defeatboss1
li115.state = 0
playsound "vo_object_complete"
Trasputinup.enabled = True
Score(CurrentPlayer) = Score(CurrentPlayer) + (5000*PFMultiplier*kgbmulti)
Wall046.Isdropped = True
Wall045.Isdropped = True
DMD "", "", "dmdhealth4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss1", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
li108.state = 1
UpdateMusicNow
rasphit = 0
modeon = 0
Bbosses = Bbosses + 1
checkbigboss
end sub

Sub Trasputindown_Timer
If rasputin.z > 100 Then
rasputin.z = rasputin.z - 5
end if
If rasputin.TransX > -60 Then
rasputin.TransX = rasputin.TransX - 6
end if
If rasputin.RotY > 50 Then
rasputin.RotY = rasputin.RotY - 5
end if
checkrasputindown
end sub

sub checkrasputindown
If rasputin.RotY = 50 Then
rasputin.z = 100
rasputin.TransX = -60
rasputin.RotY = 50
rassput = 1
Trasputindown.enabled = False
end if
end sub

Sub Trasputinup_Timer
If rasputin.z < 150 Then
rasputin.z = rasputin.z + 5
end if
If rasputin.TransX < 0 Then
rasputin.TransX = rasputin.TransX + 6
end if
If rasputin.RotY < 110 Then
rasputin.RotY = rasputin.RotY + 5
end if
checkrasputinup
end sub

sub checkrasputinup
If rasputin.RotY = 110 Then 
rasputin.z = 150
rasputin.TransX = 0
rasputin.RotY = 110
rassput = 0
Trasputinup.enabled = False
end if
end sub

'*****BOSS 3 lenin

sub leninstart
Kicker005.DestroyBall
DMD "", "", "dmdbossy", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss2", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
li109.state = 2
li113.state= 2
FireTimer.enabled = true
playsound "vo_lenin_pipeline"
end sub

sub checkpipelinehit
		select case pipelinehit
				case 1 : pipehit001
				case 2 : pipehit002
				case 3 : pipehit003
			end Select
end sub

sub pipehit001
playsound "vo_explosion1"
explosion1.visible = true
explosion001.visible = true
explosion003.visible = true
explosion002.visible = true
health1
end sub

sub pipehit002
playsound "vo_explosion2"
explosion007.visible = true
explosion006.visible = true
explosion005.visible = true
explosion004.visible = true
health2
end sub

sub pipehit003
playsound "vo_not_soviet_quality"
li109.state = 1
li113.state=0
DMD "", "", "dmdhealth4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss2", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
explosion1.visible = False
explosion007.visible = False
explosion001.visible = False
explosion003.visible = False
explosion006.visible = False
explosion005.visible = False
explosion004.visible = False
explosion002.visible = False
FireTimer.enabled = false
gasbuis1.Image="gaspipedefuse3"
gasbuis2.Image="gaspipedefuse3"
Bbosses = Bbosses + 1
checkbigboss
end sub

'*****BOSS 4 gorbatsjov

sub startnobelprice()
	DMD "", "", "dmdbossy", eNone, eNone, eNone, 1500, True, ""
	DMD "", "", "dmdboss4", eNone, eNone, eNone, 1500, True, ""
'	DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
	playsound "vo_beat_gorbachev"
	enablenobelprices()
	nobelpriceChecker = 0
	li111.state = 2
	TrotateI005.enabled = True
	vpmtimer.addtimer 3000, "playmusicagainy '"
end sub

sub playmusicagainy
UpdateMusicNow
end sub

Dim Whichnobelprice, nobelpriceChecker
Whichnobelprice = 0
nobelpriceChecker = 0
sub enablenobelprices()
	If nobelpriceChecker = 7 Then
		CheckBonusnobelprice()
		Exit Sub
	End If
	Randomize()
	Whichnobelprice = INT(RND * 3) + 1
	Select Case Whichnobelprice
		Case 3
			Whichnobelprice = 4
	End Select
	Do While (Whichnobelprice AND nobelpriceChecker) > 0
		Whichnobelprice = INT(RND * 3) + 1
		Select Case Whichnobelprice
			Case 3
				Whichnobelprice = 4
		End Select
	Loop
	Select Case Whichnobelprice
		Case 1
			TNP001.enabled = 1
			price.Visible = 1
			price.X = TNP001.X
			price.Y = TNP001.Y
		Case 2
			TNP002.enabled = 1
			price.Visible = 1
			price.X = TNP002.X
			price.Y = TNP002.Y
		Case 4
			TNP003.enabled = 1
			price.Visible = 1
			price.X = TNP003.X
			price.Y = TNP003.Y
	End Select
end sub

sub movenobelpricedown()
	Dim X
	For Each X in nobelprices
		X.Visible = 0
	Next
end sub

Sub TNP001_Hit()
	TNP001.enabled = 0
	movenobelpricedown()
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "medalhit"
	nobelpriceChecker = (nobelpriceChecker OR 1)
	Enablenobelprices()
end sub

Sub TNP002_Hit()
	TNP002.enabled = 0
	movenobelpricedown()
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "medalhit"
	nobelpriceChecker = (nobelpriceChecker OR 2)
	Enablenobelprices()
end sub

Sub TNP003_Hit()
	TNP003.enabled = 0
	movenobelpricedown()
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "medalhit"
	nobelpriceChecker = (nobelpriceChecker OR 4)
	Enablenobelprices()
end sub

sub checkbonusnobelprice()
	If nobelpriceChecker = 7 then
playsound "vo_object_complete"
		Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
'DMD "", "", "dmdhealth4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
		playsound ""
		modeon = 0
		nobelpriceChecker = 0
	TrotateI005.enabled = false
		Bbosses = Bbosses + 1
		checkbigboss
		TNP001.enabled = False
		TNP002.enabled = False
		TNP003.enabled = False
		li111.state = 1
end if
end sub

'*****BOSS 5 Jeltsin

Sub boss5starts
li120.state = 2
li112.state = 2
StopSong
playsound "vo_beat_boris"
vpmtimer.addtimer 2000, "playjeltsinsong '"
li076.state = 2 
li077.state = 2
li078.state = 2
DMD "", "", "dmdbossy", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss5", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
end sub

sub playjeltsinsong
PlaySong "11"
kickout002
end sub

sub defeatboss5
playsound "vo_object_complete"
UpdateMusicNow
li120.state = 0
li112.state = 1
Score(CurrentPlayer) = Score(CurrentPlayer) + (5000*PFMultiplier*kgbmulti)
DMD "", "", "dmdhealth4", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss5", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
'drink = 0
Bbosses = Bbosses + 1
checkbigboss
end sub

sub jeltzin
PlaySong "11"
end sub

sub countdrinksjeltsin
		select case drink
				case 1 : health1:li078.state=1:health1:jeltzin
				case 2 : health2:li077.state=1:health2:jeltzin
				case 3 : defeatboss5:li076.state=1
			end Select
end sub

'*****BOSS checker

sub checkbigboss
if Bbosses = 5 Then
putinstart
end If
end sub

'*****BOSS Putin

dim pbdftFrame,pbdftFrameNext,pbdftFrameRate


sub putinstart
stopsong
playsound "vo_putin_vodka_mania"
PlaySong "13"
DMD "", "", "dmdbossy", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdboss6", eNone, eNone, eNone, 1000, True, ""
DMD "", "", "dmdhealth1", eNone, eNone, eNone, 1000, True, ""
li113.state=2
li098.state=2
li099.state=2
li100.state=2
li101.state=2
li102.state=2
li103.state=2
li104.state=2
li105.state=2
li106.state=2
li107.state=2
li108.state=2
li109.state=2
li110.state=2
li111.state=2
li112.state=2
putwait = 1
vladputinChecker = 0
end sub

sub putinhitanimation
pbdft.visible = true
pbdftFrame = 1
pbdftFrameRate = 0.08
timerfalling.enabled=true
end sub

sub timerfalling_timer
pbdftFrameNext = pbdftFrameRate
pbdft.ShowFrame(pbdftFrame)
pbdftFrame = pbdftFrame + pbdftFrameNext
if pbdftFrame >9 OR pbdftFrame < 1 Then
pbdft.Visible = False
timerfalling.enabled=false
end if
end sub

Dim Whichvladputin, vladputinChecker
Whichvladputin = 0
vladputinChecker = 0
sub enablevladputins()
	If vladputinChecker = 7 Then
		CheckBonusvladputin()
		Exit Sub
	End If
	Randomize()
	Whichvladputin = INT(RND * 3) + 1
	Select Case Whichvladputin
		Case 3
			Whichvladputin = 4
	End Select
	Do While (Whichvladputin AND vladputinChecker) > 0
		Whichvladputin = INT(RND * 3) + 1
		Select Case Whichvladputin
			Case 3
				Whichvladputin = 4
		End Select
	Loop
	Select Case Whichvladputin
		Case 1
			TVP001.enabled = 1
			puidle.Visible = 0
			putinyies.Visible = 1
			putinyies.X = TVP001.X
			putinyies.Y = TVP001.Y
		Case 2
			TVP002.enabled = 1
			puidle.Visible = 0
			putinyies.Visible = 1
			putinyies.X = TVP002.X
			putinyies.Y = TVP002.Y
		Case 4
			TVP003.enabled = 1
			puidle.Visible = 0
			putinyies.Visible = 1
			putinyies.X = TVP003.X
			putinyies.Y = TVP003.Y
	End Select
end sub

sub movevladputindown()
	Dim X
	For Each X in vladputins
		X.Visible = 0
	Next
end sub

Sub TVP001_Hit()
	TVP001.enabled = 0
	stopsong
	PlaySong "13"
	Playsound "vo_hit9"
	movevladputindown()
	pbdft.X = TVP001.X
	pbdft.Y = TVP001.Y
	putinhitanimation
	putwait = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "vladputin1"
	vladputinChecker = (vladputinChecker OR 1)
	puidle.Visible = 1
	checkbonusvladputin
end sub

Sub TVP002_Hit()
	TVP002.enabled = 0
	stopsong
	PlaySong "13"
	Playsound "vo_hit9"
	movevladputindown()
	pbdft.X = TVP002.X
	pbdft.Y = TVP002.Y
	putinhitanimation
	putwait = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "vladputin1"
	vladputinChecker = (vladputinChecker OR 2)
	puidle.Visible = 1
	checkbonusvladputin
end sub

Sub TVP003_Hit()
	TVP003.enabled = 0
	stopsong
	PlaySong "13"
	Playsound "vo_hit9"
	movevladputindown()
	pbdft.X = TVP003.X
	pbdft.Y = TVP003.Y
	putinhitanimation
	putwait = 1
	Score(CurrentPlayer) = Score(CurrentPlayer) + (500*PFMultiplier*kgbmulti)
	Playsound "vladputin1"
	vladputinChecker = (vladputinChecker OR 4)
	puidle.Visible = 1
	checkbonusvladputin
end sub

sub checkbonusvladputin()
	If vladputinChecker = 7 then
		playsound "vo_stong_leaders"
		Score(CurrentPlayer) = Score(CurrentPlayer) + (2000*PFMultiplier*kgbmulti)
		DMD "", "", "dmdboss6", eNone, eNone, eNone, 1000, True, ""
		DMD "", "", "dmddefeat", eNone, eNone, eNone, 1000, True, ""
		li098.state=2
		li099.state=0
		li100.state=0
		li101.state=0
		li102.state=0
		li103.state=0
		li104.state=0
		li105.state=0
		li106.state=0
		li107.state=0
		li108.state=0
		li109.state=0
		li110.state=0
		li111.state=0
		li112.state=0
		li113.state=0
		vladputinChecker = 0
'		vladputinhits = 0
		putwait = 0
		Bbosses = Bbosses + 1
		TVP001.enabled = False
		TVP002.enabled = False
		TVP003.enabled = False
		stopsong
		UpdateMusicNow
end if
end sub

'*****************
' Flag
'*****************

Dim FlagDir
FlagDir = 5 'this is both the direction, if + goes up, if - goes down, and also the speed

Sub FlagTimer_Timer
    Flag.z = Flag.z - FlagDir
    If Flag.z < 140 Then FlagDir = -5 'goes down
    If Flag.z = 200 Then FlagTimer.Enabled = 0
End Sub

'*****************
' explosion
'*****************
Dim Fire1Pos,Flames
Flames = Array("exp1", "exp2", "exp3", "exp4")

Sub StartFire
    Fire1Pos = 0
    FireTimer.Enabled = 1
End Sub

Sub FireTimer_Timer
	explosion1.ImageA = Flames(Fire1Pos)
	explosion001.ImageA = Flames(Fire1Pos)
	explosion002.ImageA = Flames(Fire1Pos)
	explosion003.ImageA = Flames(Fire1Pos)
	explosion004.ImageA = Flames(Fire1Pos)
	explosion005.ImageA = Flames(Fire1Pos)
	explosion006.ImageA = Flames(Fire1Pos)
	explosion007.ImageA = Flames(Fire1Pos)
    Fire1Pos = (Fire1Pos + 1) MOD 4
End Sub

'*****************
' tetris
'*****************

Dim TetrisDir
TetrisDir = 5 'this is both the direction, if + goes up, if - goes down, and also the speed

Sub TTetris_Timer
    tetris.z = tetris.z - TetrisDir
    If tetris.z > -450 Then TetrisDir = + 5 'goes down
    If tetris.z = -450 Then tetris.z = 850
End Sub