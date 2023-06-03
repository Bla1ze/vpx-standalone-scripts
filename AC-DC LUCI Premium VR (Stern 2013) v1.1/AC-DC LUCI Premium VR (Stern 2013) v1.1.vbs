'
'                    **************************************************************************
'                    *                                                                        *
'                    *                          STERN PINBALL, INC.                           *
'                    *             (C) COPYRIGHT 2011 - 2012 STERN PINBALL, INC.              *
'                    *                                                                        *
'                    **************************************************************************
'                    *                                                                        *
'                    *                               AC/DC LUCI		                     	  *
'                    *                                                                        *
'                    **************************************************************************
'
'             *                      *                                       *********                      *         
'            ***                    ***                                     ***********                    ***        
'           *****                  *****                                   *************                  *****       
'          *******                *******                                 ***************                *******      
'         *********              *********                               *****************              *********     
'        ***********            ***********                             *******************            ***********    
'       *************          *************                            ********************          *************   
'      ***************        ***************                            ********************        ***************  
'     *****************      *****************                            ******** ***********      ***************** 
'    ****** ************    ******* ***********             ********      ********  **********     ******* ***********
'   *******  ***********    *******  **********             ********      ********   *********     *******  **********
'   *******   **********    *******   ********             ********       ********    ********     *******   ******** 
'   *******    *********    *******    ******              ********       ********     *******     *******    ******  
'   *******     ********    *******     ****              *********       ********     *******     *******     ****   
'   *******      *******    *******      **               ********        ********     *******     *******      **    
'   *******      *******    *******                      *********        ********     *******     *******            
'   *******      *******    *******                      *********        ********     *******     *******            
'   *******      *******    *******                      ********         ********     *******     *******            
'   *******      *******    *******                     *********         ********     *******     *******            
'   *******      *******    *******                     ********          ********     *******     *******            
'   *******      *******    *******                    *********          ********     *******     *******            
'   *******      *******    *******                    ***************    ********     *******     *******            
'   ********************    *******                   ***************     ********     *******     *******            
'   ********************    *******                   **************      ********     *******     *******            
'   ********************    *******                   **************      ********     *******     *******            
'   ********************    *******                  **************       ********     *******     *******            
'   ********************    *******                  *************        ********     *******     *******            
'   ********************    *******                 *************         ********     *******     *******            
'   ********************    *******                       *******         ********     *******     *******            
'   ********************    *******       *               ******          ********     *******     *******      **    
'   *******      *******    *******      ***             ******           ********     *******     *******     ****   
'   *******      *******    *******     *****            ******           ********     *******     *******    ******  
'   *******      *******    *******    *******           *****            ********     *******     *******   ******** 
'   *******      *******    ********  *********         *****             ********    ********     *******  **********
'   *******      *******    *******************         ****              ********   *********     *******************
'  ********     ********    ******************          ****              ********  **********     ****************** 
' **********   **********    ****************          ****               ********************      ****************  
'************ ************    **************           ***               ********************        **************   
' *********** ************     ************            ***              ********************          ************    
'  *********   **********       **********            ***               *******************            **********     
'   *******     ********         ********             **                 *****************              ********      
'    *****       ******           ******              *                   ***************                ******       
'     ***         ****             ****              **                    *************                  ****        
'      *           **               **               *                      ***********                    **         
' 
'
'
'
'This mod started out as a simple collaboration between Hauntfreaks and Fluffhead35 to add new physics and VR room ended up as so much more.  
'This table has had the bell code completely reworked by Apophis to work more like the real table.  The playfield has been tweaked by none other than 
'nFozzy himself to be more in line with the blueprint.  He also fixed the right and left ramps to be true to the real table.  
'nFozzy has graced this table with his experience to make it table amazing to play.
'
'This table was a mod of Sixto's AC/DC VR Room, where we made it a hybrid table.
'
'Fluffhead35 - Fleep, nFozzy physics, dynamic shadows, drop target code and new drop targets, 3d inserts, added new flipper bats, lighting tweaks, 
'              added Lampz code, adjusted nudge
'Hauntfreak - Added new VR Room, Lighting Adjustments, Playfield Shadows
'Sixtoe - Original VR, Lighting, Separated out horns on the train, many more he could not remember.  Fixed right ramp, fixed bumper flashers.  
'         Realignment and prettying up rubbers and stuff.
'Apophis - New Bell Physics, scripting, guidance
'nFozzy  - new collidable ramps to fix the shapes of them, moved top hole variance, bell metal/orbit metal tweaks, playfield reshape to correct dimensions.  
'          Implemented ramp protectors, blank sidewalls, ramp stickers, adjusted bell position.
'Tomate - New visual ramps
'Retro27 - VR Room / Cabinet Reworked, New DMD Decals, Start button,tournament mode lights added. Adjustment to Instructions cards, added new render mode for VR
'Schlabber34 - reworked droptargets and other objects in blender for use in table.

'
'                                                  *                                                                 
'VPX recreation by ninuzzu
'thanks to javier for let me continue this table, wich is based on his PRO version
'Big thanks to DJRobX: without him, this table wouldn't exist.
'I also would like to thank:
'dark for the bell base model;
'tom tower for the LE apron;
'knorr for the laser mod
'rysr, Peter J and javier (again :D ) for the help with the pics.
'the VPDevTeam for the freaking amazing VPX

'Surround Sound MOD by RustyCardores
' This mod includeds a shaker pulse and if ned be it can easily be reomoved in the SOLENOIDS section of this script.

' New Stuff Fixed
' * Premium Cab and Backglass added for VR
' * Fixed plastic wall heights
' * Adjusted GI lights on Lower Playfied
' * Adjusted Bell Physics and copletely redone
' * Changed gates control on ramps form spinners to Gates
' * Adjusted gates so that they don't swing in the wind
' * Cannon speed and visual animation fixed
' * Cannon Shot Strength Increased
' * Slings Rubber animation adjusted 
' * Missing Band member restored on Playfield
' * Fix for diverter so ball is not thrown off ramp
' 

'1.0   Release
'1.0.2 Release
'1.0.3 - Fixed the custom flipper decals, added 2nd option for mini flippers custom decal, adjusted the hight of the Div1P primitive. VR back glass has been updated when nude mode option enabled.
'1.0.5 - Has updaes for vr cabinet and premium edition, updated newton ball code, db issues on lower playfield, corrected walls, added code to make cannon move at 1.8
'1.0.6 - Added animation class. Smoother, more accurate cannon rotation. Blendshape slingshots
'1.0.7 - Moved Bellk to 300h and moved invisible bell ramp up to 400z
'1.0.8 - New Brell physics by nfozzy
'1.0.9 - Added Gates on Ramp to correct collections for ssf
'1.0.10 - Added in new nFozzy Ramp Object. Updated Height of switchs on ramps.
'1.0.11 - Bell bugfixes, fixed some collideable objects, shortened flippers to ~3.15", dirty hue shift on blue bulbs, added narnia checker, optipng'd some images
'1.0.12 - Updated animation script, cleaned up post-pass geometry, hacked blue bulbs a bit more, added pinmame reset switch search
'1.0.13 - Updated animation script, adjusted position of inlane screws.
'1.1   Release


Option explicit
Randomize

'************************************************************************
'							TABLE OPTIONS
'************************************************************************
Const VaultEdition = 0				'Show new lower pf plate, LED flashers, apron stickers and DMD decal, these were added in the Vault Edition models produced in 2017
Const NudeMod = 0					'Enable Nude Mod, with new artwork (0= no, 1= yes)
Const InstrCardType = 1				'Instruction Cards Type (0= white, 1= yellow, 2 = custom)
Const TrainHornsLit = 0				'Light the Train Horns (0= no, 1= yes)
Const LaserMod = 0					'Shows a laser beam when Cannon is moving (0= no, 1= yes)
Const BellMod = 0					'Shows a Wooden Bell Log instead of the Metallic one (0= no, 1= yes)
Const RampsDecals = 0				'Shows Custom Ramps Decals (0= no, 1= yes)
Const FlippersDecals = 0			'Shows Custom Flippers Decals (0= no, 1= yes)
Const MFlippersDecals = 0			'Shows Custom Mini Flippers Decals (0= no, 1= yes)
Const SideCabDecals = 0				'0 - Standard Black Wooden Sideblades, 1 - Custom Fire Sideblades, 2 - Custom Decal Sideblades 
Const FIREButtonLight = 0			'Light the apron decal when FIRE button is on, useful for pincabs (0= no, 1= yes)
Const OutLaneDifficulty = 1         '0 - Easy, 1 - Normal, 2 - Hard

'************************************************************************
'							CABINET MODE
'************************************************************************
CabinetMode = 0        				'0 - Show SideRails, Lockdown Bar and Fire Button, 1 - Hide SideRails, Lockdown Bar and Fire Button

'************************************************************************
'							VR OPTIONS
'************************************************************************
Dim VRRoomChoice : VRRoomChoice = 1 '1 - Minimal Room, 2 - Blacklight Room (only applies when using VR headset)
Const VRTopper = 0					'0 - Topper off, 1 - ACDC Topper, 2 - Tournament Mode Topper
Const VRDMDDecal = 0				'0 - Standard DMD Speaker Decal, 1 - Amplifier DMD Decal, 2 - Custom DMD Decal

'************************************************************************
'							OTHER OPTIONS
'************************************************************************
'----- Shadow Options -----
Const DynamicBallShadowsOn = 1		'0 = no dynamic ball shadow ("triangles" near slings and such), 1 = enable dynamic ball shadow
Const AmbientBallShadowOn = 1		'0 = Static shadow under ball ("flasher" image, like JP's)
									'1 = Moving ball shadow ("primitive" object, like ninuzzu's) - This is the only one that shows up on the pf when in ramps and fades when close to lights!
									'2 = flasher image shadow, but it moves like ninuzzu's

'----- General Sound Options -----
Const VolumeDial = 0.8				'Overall Mechanical sound effect volume. Recommended values should be no greater than 1.
Const BallRollVolume = 0.5 			'Level of ball rolling volume. Value between 0 and 1
Const RampRollVolume = 0.5 			'Level of ramp rolling volume. Value between 0 and 1

'************************************************************************
'						END OF TABLE OPTIONS
'************************************************************************

On Error Resume Next
ExecuteGlobal GetTextFile("controller.vbs")
If Err Then MsgBox "You need the controller.vbs in order to run this table, available in the vp10 package"
On Error Goto 0

Const Ballsize = 50
Const BallMass = 1
Const cGameName = "acd_170h"
'Const cGameName = "acd_170hc" 'Color Rom

Dim tablewidth: tablewidth = ACDC.width
Dim tableheight: tableheight = ACDC.height
Const UseVPMModSol = True

Dim UseVPMDMD,CustomDMD,DesktopMode,CabinetMode
DesktopMode = ACDC.ShowDT : CustomDMD = False
If Right(cGamename,1)="c" Then CustomDMD= False
If CustomDMD OR (NOT DesktopMode AND NOT CustomDMD) Then UseVPMDMD = False		'hides the internal VPMDMD when using the color ROM or when table is in Full Screen and color ROM is not in use
If DesktopMode AND NOT CustomDMD Then UseVPMDMD = True							'shows the internal VPMDMD when in desktop mode and color ROM is not in use
Scoretext.visible = NOT CustomDMD												'hides the textbox when using the color ROM

LoadVPM "02800000", "Sam.VBS", 3.54

'********************
'Standard definitions
'********************

Const UseSolenoids = 1
Const UseLamps = 0
Const UseGI = 0
Const UseSync = 0
Const HandleMech = 0

'Standard Sounds
Const SSolenoidOn = "fx_Solon"
Const SSolenoidOff = ""
'Const SCoin = "fx_coin"

'************************************************************************
'						 INIT TABLE
'************************************************************************



Dim bsTrough, bsTEject, bsBellEject, bsLowEject, PlungerIM, ACDCBank, TNTBank

Sub ACDC_Init
	vpmInit Me
    With Controller
        .GameName = cGameName
		'.Games(cGameName).Settings.Value("rol") = 1
		'.Games(cGameName).Settings.Value("dmd_width")=128
		'.Games(cGameName).Settings.Value("dmd_height")=512
        .SplashInfoLine = "AC/DC LUCI (Stern 2013)"
        .HandleKeyboard = 0
        .ShowTitle = 0
        .ShowDMDOnly = 1
        .ShowFrame = 0
        If NOT CustomDMD Then .Hidden = DesktopMode				'hides the external DMD when in desktop mode and color ROM is not in use
        .HandleMechanics = 0
        On Error Resume Next
        .Run GetPlayerHWnd
        If Err Then MsgBox Err.Description
        On Error Goto 0
    End With

'Main Timer init
    PinMAMETimer.Interval = PinMAMEInterval
    PinMAMETimer.Enabled = 1

'Nudging
    vpmNudge.TiltSwitch = -7
    vpmNudge.Sensitivity = 5
    vpmNudge.TiltObj = Array(Bumper1, Bumper2, Bumper3, LeftSlingshot, RightSlingshot)

'Trough
    Set bsTrough = New cvpmTrough
    With bsTrough
		.Size = 4
		.InitSwitches Array(21, 20, 19, 18)
		.InitExit BallRelease, 70, 15
		.InitEntrySounds "", SoundFX(SSolenoidOn,DOFContactors), SoundFX(SSolenoidOn,DOFContactors)
		.InitExitSounds  SoundFX(SSolenoidOn,DOFContactors), SoundFX("BallRelease1",DOFContactors)
		.Balls = 4
		'.CreateEvents "bsTrough", Drain
    End With

'Top Eject
    Set bsTEject = new cvpmSaucer
    With bsTEject
		.InitKicker Sw37, 37, 89, 14, 0		'was Sw37, 37, 90, 9, 0
		.InitExitVariance 2,2
		.InitAltKick 90, 26, 0    'InitAltKick(aDir, aForce, aZForce)
'		.InitExitVariance 5, 1	' too much Variance may break super skillshot. see Sub SolTopEject
        .InitSounds "fx_kicker_enter", SoundFX(SSolenoidOn,DOFContactors), SoundFX("ExitSandman",DOFContactors)
        .CreateEvents "bsTEject", Sw37
    End With

'Bell Eject
    Set bsBellEject = new cvpmSaucer
    With bsBellEject
        .InitKicker Sw36, 36, 170, 8, 0 ' NF eject vel 10 -> 8
		.InitExitVariance 0, 2
        .InitSounds "Saucer_Enter_1", SoundFX(SSolenoidOn,DOFContactors), SoundFX("Saucer_Kick",DOFContactors)
        .CreateEvents "bsBellEject", Sw36
    End With

'Lower PF Eject
    Set bsLowEject = new cvpmTrough
    With bsLowEject
		.Size = 1
		.InitSwitches Array(49)
		.InitExit Sw49, 32, 35
		.InitExitVariance 0, 2
		.InitEntrySounds "fx_kin", "", ""
		.InitExitSounds  SoundFX(SSolenoidOn,DOFContactors), SoundFX("Popper",DOFContactors)
		.Balls = 1
		.CreateEvents "bsLowEject", Sw49
    End With

'Impulse Plunger
    Set plungerIM = New cvpmImpulseP
    With plungerIM
        '.InitImpulseP sw23, 65, 0.5
        .InitImpulseP sw23, 55, 0.5 ' nf rescale
        .Switch 23
        .Random 1.5
        .InitExitSnd SoundFX("fx_AutoPlunger",DOFContactors), SoundFX(SSolenoidOn,DOFContactors)
        .CreateEvents "plungerIM"
    End With


'Other Suff
	InitOptions:InitBell:InitCannon:InitDiverters: InitDropTargets



'Fast Flips
	On Error Resume Next 
	InitVpmFFlipsSAM
	If Err Then MsgBox "You need the latest sam.vbs in order to run this table, available with vp10.5 rev3434"
	On Error Goto 0


	Backwall_Tracks_Bubble.z=50 ' NF - overlapping transparent object workaround (consider removing transparency from lvl1 plastics)


End Sub

Sub Drain_Hit() 
	if bsTrough.balls >= 4 then Me.destroyball : Exit Sub ' If the trough is full, destroy excess balls
	bsTrough.AddBall Me
End Sub


sub BallSearch() ' check for down drop targets on start (pinmame reset)
	dim i : for i = 0 to uBound(DTArray) 
		if DTArray(i).prim.transz <> 0 then ' this seems like not an ideal way to do this
			Controller.switch(DTArray(i).sw ) = 1
		end if 
	Next
	bstrough.Update
end Sub

'*******************************************
' VR Room 
'*******************************************

	Dim VRRoom
	If RenderingMode = 2 Then VRRoom = VRRoomChoice Else VRRoom = 0
	DIM VRThings
	If VRRoom > 0 Then
		ScoreText.visible = 0
		If VRRoom = 1 Then
			for each VRThings in VR_Room:VRThings.visible = 1:Next
			for each VRThings in VR_Room2:VRThings.visible = 0:Next
			for each VRThings in VR_Cab:VRThings.visible = 1:Next
			for each VRThings in VR_topper:VRThings.visible = 1:Next
		End If
		If VRRoom = 2 Then
			for each VRThings in VR_Room:VRThings.visible = 0:Next
			for each VRThings in VR_Room2:VRThings.visible = 1:Next
			for each VRThings in VR_Cab:VRThings.visible = 1:Next
			for each VRThings in VR_topper:VRThings.visible = 1:Next
		End If
	Else
			for each VRThings in VR_Cab:VRThings.visible = 0:Next
	End if

'*******************************************
'VR Cabinet Mode
'*******************************************

	If CabinetMode and VRRoom=0 Then
		PinCab_Rails.visible=0
		PinCab_FirePlate.visible=0
		PushButton_0.visible=0
		PushButton_002.visible=0
		PushButton_001.visible=0
		PushButton_003.visible=0
	Else
		PinCab_Rails.visible=1
		PinCab_FirePlate.visible=1
		PushButton_0.visible=1
		PushButton_002.visible=1
		PushButton_001.visible=1
		PushButton_003.visible=1
	End If



'************************************************************************
'							KEYS
'************************************************************************

Sub ACDC_KeyDown(ByVal Keycode)
	If keycode = LeftFlipperKey  Then FlipperActivate LeftFlipper, LFPress : Controller.Switch(88) = 1 :PinCab_Flipper_Button_Left.X = PinCab_Flipper_Button_Left.X +6			'Mini PF flipper switch
	If keycode = RightFlipperKey  Then FlipperActivate RightFlipper, RFPress : Controller.Switch(86) = 1 :PinCab_Flipper_Button_Right.X = PinCab_Flipper_Button_Right.X -6		'Mini PF flipper switch
	If keycode = LeftTiltKey Then Nudge 90, 1:SoundNudgeLeft()
	If keycode = RightTiltKey Then Nudge 270, 1:SoundNudgeRight()
	If keycode = CenterTiltKey Then Nudge 0, 1:SoundNudgeCenter()
	If KeyCode = PlungerKey Then Plunger.Pullback: SoundPlungerPull()
	If KeyCode = RightMagnaSave OR KeyCode = LockbarKey Then Controller.Switch(64)=1 :PushButton_002.Z =PushButton_002.Z -6	:PushButton_001.Z =PushButton_001.Z -6		'FIRE Button, mapped to the right magna save
	If keycode = keyFront Then Controller.Switch(15) = 1 :PinCab_Tournament_Button.Y =PinCab_Tournament_Button.Y -2			'tournament
	If keycode = StartGameKey Then BallSearch : Controller.Switch(16)  = 1 :PinCab_Start_Button.Y = PinCab_Start_Button.Y -2 :PinCab_Start_Button_Inner_Ring.Y = PinCab_Start_Button_Inner_Ring.Y -2	
	If keycode = keyInsertCoin1 or keycode = keyInsertCoin2 or keycode = keyInsertCoin3 or keycode = keyInsertCoin4 Then
		Select Case Int(rnd*3)
			Case 0: PlaySound ("Coin_In_1"), 0, CoinSoundLevel, 0, 0.25
			Case 1: PlaySound ("Coin_In_2"), 0, CoinSoundLevel, 0, 0.25
			Case 2: PlaySound ("Coin_In_3"), 0, CoinSoundLevel, 0, 0.25

		End Select
	End If
	'if keycode = 30 then testball 'key=A. debug
    If vpmKeyDown(keycode) Then Exit Sub
End Sub

Sub ACDC_KeyUp(ByVal Keycode)
	If keycode = keyFront Then Controller.Switch(15) = 0
	If keycode = LeftFlipperKey  Then FlipperDeActivate LeftFlipper, LFPress :   Controller.Switch(88) = 0 :PinCab_Flipper_Button_Left.X = PinCab_Flipper_Button_Left.X -6		'Mini PF flipper switch
	If keycode = RightFlipperKey  Then FlipperDeActivate RightFlipper, RFPress : Controller.Switch(86) = 0 :PinCab_Flipper_Button_Right.X = PinCab_Flipper_Button_Right.X +6		'Mini PF flipper switch
	If KeyCode = PlungerKey Then Plunger.Fire: StopSound "fx_PlungerPull":PlaySoundAt "fx_Plunger",Plunger
	If KeyCode = RightMagnaSave OR KeyCode = LockbarKey Then Controller.Switch(64)=0 :PushButton_002.Z =PushButton_002.Z +6				'FIRE Button, mapped to the right magna save
	If keycode = StartGameKey Then Controller.Switch(16)  = 1 :PinCab_Start_Button.Y = PinCab_Start_Button.Y +2 :PinCab_Start_Button_Inner_Ring.Y = PinCab_Start_Button_Inner_Ring.Y +2	
	If keycode = keyFront Then Controller.Switch(15) = 1 :PinCab_Tournament_Button.Y =PinCab_Tournament_Button.Y +2			'tournament
    If vpmKeyUp(keycode) Then Exit Sub
End Sub

'Sub TimerPlunger_Timer
  'VR_Primary_plunger.Y = -26.5 + (5* Plunger.Position) -20
'End Sub

'**********************************************************************************************************
'Plunger code
'**********************************************************************************************************

TimerVRPlunger2.enabled = true   '  This sits outside of a sub, and tells the timer2 to be enabled at table load

Sub TimerVRPlunger_Timer
if PinCab_plunger.Y < 1530 then PinCab_plunger.Y = PinCab_plunger.y +5  'If the plunger is not fully extend it, then extend it by 5 coordinates in the Y, 
End Sub

Sub TimerVRPlunger2_Timer
PinCab_plunger.Y = 2330 + (5* Plunger.Position) -20  ' This follows our dummy plunger position for analog plunger hardware users.
end sub

Sub ACDC_Paused:Controller.Pause = 1:End Sub
Sub ACDC_UnPaused:Controller.Pause = 0:End Sub
Sub ACDC_Exit:Controller.Stop:End Sub

'************************************************************************
'						 SOLENOIDS
'************************************************************************

SolCallBack(1) = "SolTrough"						'Trough-Up Kicker
SolCallBack(2) = "SolAutoPlungerIM"					'AutoLaunch
SolCallback(3) = "bsLowEject.SolOut"				'Lower PF Eject
SolCallback(4) = "SolLFlipperMini"					'Lower PF Left Flipper
SolCallback(5) = "SolRFlipperMini"					'Lower PF Right Flipper
SolCallback(6) = "SolDTBank5" 						'5-bank Drop Target
SolCallback(7) = "SolDTBank3"						'3-bank Drop Target
SolCallback(8) = "vpmSolSound SoundFX(""ShakerPulse"",DOFShaker),"	'Shaker Motor
'SolCallback(9) = ""								'Left Bumper
'SolCallback(10)= ""								'Right Bumper			
'SolCallback(11)= ""								'Top Bumper
SolCallback(12)= "SolTopEject"						'Top Eject
SolModCallback(12)= "SolTopEject_catch"                'Top Eject NF - catch pwm value
'SolCallback(13)= ""								'Left Sling
'SolCallback(14)= ""								'Right Sling
SolCallback(15)= "SolLFlipper"						'Left Flipper
SolCallback(16)= "SolRFlipper"						'Right Flipper
SolModCallBack(17)= "SetLampMod 177,"				'Flasher: Train 
SolCallback(18)= "SolDetonator"						'Detonator
SolModCallBack(19)= "SetLampMod 179,"				'Flasher:Bottom Arch (x2)
SolModCallBack(20)= "SetLampMod 180,"				'Flasher: Left Ramp

'SolModCallBack(21)= "SetLampMod 181,"				'Flasher:Left Side
SolModCallback(21) = "FlashSol121"					'Flasher:Dome Left Side

SolModCallBack(22)= "SetLampMod 182,"				'Flasher:BackPanel
SolModCallBack(23)= "SetLampMod 183,"				'Flasher: Top Eject
SolCallBack(24)= "vpmSolSound SoundFX(""fx_knocker"",DOFKnocker),"					'Knocker
SolModCallBack(25)= "SetLampMod 185,"				'Flasher:Pop Bumpers (x3)
SolModCallBack(26)= "SetLampMod 186,"				'Flasher: Bell Arrow
SolModCallBack(27)= "SetLampMod 187,"				'Flasher:Left Ramp Left
SolModCallBack(28)= "SetLampMod 188,"				'Flasher:Left Ramp Right
SolModCallBack(29)= "SetLampMod 189,"				'Flasher:Right Ramp Right
SolModCallBack(30)= "SetLampMod 190,"				'Flasher:Right Ramp

'SolModCallBack(31)= "SetLampMod 191,"				'Flasher:Right Side
SolModCallback(31) = "FlashSol131"					'Flasher:Dome Right Side

SolCallback(32)= "SolCannonMotor"					'Cannon Motor

'aux coils 41-48
SolCallBack(51)  = "SolBandMembers"					'Band Members Mech
SolCallBack(52)  = "bsBellEject.SolOut"				'Bell Eject
SolCallBack(53)  = "SolCannon"						'Cannon Eject
SolCallBack(54)  = "SolBellMove"					'Bell Magnet
SolCallBack(55)  = "SolCannonDiv"					'Cannon Diverter
SolCallBack(56)  = "vpmSolGate Gate, SoundFX(SSolenoidOn,DOFContactors),"	'Right Control Gate
SolCallBack(57)  = "SolRampDiv"						'Left Ramp Diverter
'SolCallBack(58)  = ""								'Cabinet Topper (???)

'************************************************************************
' 							FLIPPERS
'************************************************************************
Const ReflipAngle = 20

Sub SolLFlipper(Enabled)
	If Enabled Then
		LF.Fire  'leftflipper.rotatetoend
	
		If leftflipper.currentangle < leftflipper.endangle + ReflipAngle Then 
			RandomSoundReflipUpLeft LeftFlipper
		Else 
			SoundFlipperUpAttackLeft LeftFlipper
			RandomSoundFlipperUpLeft LeftFlipper
		End If		
	Else
		LeftFlipper.RotateToStart
		If LeftFlipper.currentangle < LeftFlipper.startAngle - 5 Then
			RandomSoundFlipperDownLeft LeftFlipper
		End If
		FlipperLeftHitParm = FlipperUpSoundLevel
    End If
End Sub

Sub SolRFlipper(Enabled)
	If Enabled Then
		RF.Fire 'rightflipper.rotatetoend

		If rightflipper.currentangle > rightflipper.endangle - ReflipAngle Then
			RandomSoundReflipUpRight RightFlipper
		Else 
			SoundFlipperUpAttackRight RightFlipper
			RandomSoundFlipperUpRight RightFlipper
		End If
	Else
		RightFlipper.RotateToStart
		If RightFlipper.currentangle > RightFlipper.startAngle + 5 Then
			RandomSoundFlipperDownRight RightFlipper
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
	End If
End Sub

Sub SolLFlipperMini(Enabled)
    If Enabled Then
        LeftFlipperMini.RotateToEnd
		If LeftFlipperMini.currentangle > LeftFlipperMini.endangle - ReflipAngle Then
			RandomSoundReflipUpRight LeftFlipperMini
		Else 
			SoundFlipperUpAttackRight LeftFlipperMini
			RandomSoundFlipperUpRight LeftFlipperMini
		End If
    Else
        LeftFlipperMini.RotateToStart
		If LeftFlipperMini.currentangle > LeftFlipperMini.startAngle + 5 Then
			RandomSoundFlipperDownRight LeftFlipperMini
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
    End If
End Sub

Sub SolRFlipperMini(Enabled)
    If Enabled Then
        RightFlipperMini.RotateToEnd
		If RightFlipperMini.currentangle > RightFlipperMini.endangle - ReflipAngle Then
			RandomSoundReflipUpRight RightFlipperMini
		Else 
			SoundFlipperUpAttackRight RightFlipperMini
			RandomSoundFlipperUpRight RightFlipperMini
		End If
    Else
        RightFlipperMini.RotateToStart
		If RightFlipperMini.currentangle > RightFlipperMini.startAngle + 5 Then
			RandomSoundFlipperDownRight RightFlipperMini
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
    End If
End Sub


'************************************************************************
'						 BALL TROUGH
'************************************************************************
Sub SolTrough(Enabled)
	If Enabled Then
		bsTrough.ExitSol_On
		If BsTrough.Balls Then vpmTimer.PulseSw 22
	End If
End Sub

'************************************************************************
'						 AUTOPLUNGER 
'************************************************************************
Sub SolAutoPlungerIM(Enabled)
	If Enabled Then
		PlungerIM.AutoFire
		aAutoPlunger.Play ' animation
	End If
End Sub

'************************************************************************
'						 EXIT JUKEBOX
'************************************************************************

' NF note: This hole utilizes pulse width modulation for two kickouts
' If both flippers are held after plunging, targets light for super skillshot
' SolModCallback(12) will pulse to 255 if this is the case (usually within 10ms) 

Sub SolTopEject(enabled) ' SolCallBack
    If Enabled Then 
        ' vpmtimer is not precise enough - at 40ms, it will fire too quickly. at 80, it will be noticeably delayed. 
        ' So we will borrow the kicker's timer instead
        sw37.timerinterval=30 : sw37.timerenabled=1
    end if

End Sub

dim TopEjectMaxValue : TopEjectMaxValue=0
sub SolTopEject_catch(b) 'SolModCallBack: catch PWM value (assigned to variable TopEjectMaxValue)
    if b > TopEjectMaxValue then TopEjectMaxValue = b    ' all 
end Sub


sub sw37_timer() ' Kickout. kicker object timer
    if TopEjectMaxValue < 255 Then
        bsTEject.ExitSol_On
'        debug.print "regular kickout " & TopEjectMaxValue & vbnewline & "---"
    else 
        bsTEject.ExitAltSol_On
'        debug.print "super kickout " & TopEjectMaxValue & vbnewline & "---"
    end if

    TopEjectMaxValue=0
    me.timerenabled=0
end Sub

'************************************************************************
'                       DRAIN SOUND
'************************************************************************
Sub DrainSw_Hit
	RandomSoundDrain DrainSw
End Sub

'************************************************************************
' 						RAMP DIVERTERS
'************************************************************************
Dim Div1Hit,Div3Hit

Sub InitDiverters
	DiverterL.Isdropped = 1:DiverterR.Isdropped = 1
	Div1Hit=0: Div3Hit=0
End Sub

Sub InitDropTargets
	DTRaise 1
    DTRaise 2
    DTRaise 3
    DTRaise 4
    DTRaise 5
    DTRaise 10
    DTRaise 11
    DTRaise 12
End Sub

Sub SolCannonDiv(Enabled)
    If Enabled Then 
        DiverterR.Isdropped = 0
        'DivP.Z = 142
		aDiverterR.PlayFromTo 0, 100
        PlaySoundAt SoundFX("DiverterOn", DOFContactors),light41
    Else 
        DiverterR.Isdropped = 1
        'DivP.Z = 172.5
'		aDiverterR.PlayFrom 1000
		aDiverterR.PlayFrom 150
        PlaySoundAt SoundFX("DiverterOff", DOFContactors),light41
    End If
End Sub

Sub SolRampDiv(Enabled)
    If Enabled Then 
        DiverterL.Isdropped = 0
        'Div1P.Z = 185
		aDiverterL.PlayFromTo 0, 100
        PlaySoundAt SoundFX("DiverterOn", DOFContactors),light5
    Else 
        DiverterL.Isdropped = 1
        'Div1P.Z = 230.5
		aDiverterL.PlayFrom 150
        PlaySoundAt SoundFX("DiverterOff", DOFContactors),light5
    End If
End Sub



' **************** animations init ******************

dim aLeftSlingArm : Set aLeftSlingArm = New cAnimation2
dim aRightSlingArm : Set aRightSlingArm = New cAnimation2
dim aLeftSling : Set aLeftSling = New cAnimation2
dim aRightSling : Set aRightSling = New cAnimation2
dim aAutoPlunger : Set aAutoPlunger = New cAnimation2
LeftSlingBand.ShowFrame 0
RightSlingBand.ShowFrame 0

dim aCannon : set aCannon = New cAnimation2

dim aDiverterL, aDiverterR : set aDiverterL = new cAnimation2 : set aDiverterR = new cAnimation2


InitAnimations
Sub InitAnimations() ' animations plot can be printed in debugger with obj.TEST() method
	dim x,a
	a = array(aLeftSlingArm, aRightSlingArm)
	for each x in a 
		x.AddPoint 0, 0, -4.25
		x.AddPoint 1, 10, 0			' hit sling
		x.AddPoint 2, 31, 17		' 5 frames down (240fps)
		x.AddPoint 3, 77, 17		' 11 frames hold
		x.AddPoint 4, 110, -4.25	' 8 frames Up
	next
	aLeftSlingArm.Callback = "animLeftSlingArm"
	aRightSlingArm.Callback = "animRightSlingArm"

	a = Array(aLeftSling, aRightSling)
	for each x in a 
		x.AddPoint 0, 0, 0
		x.AddPoint 1, 10, 0		' wait for kicker
		x.AddPoint 2, 31, 1		' 5 frames down
		x.AddPoint 3, 77, 1		' 11 frames hold
		x.AddPoint 4, 110, 0	' 8 frames Up
	next
	aLeftSling.Callback = "animLeftSling"
	aRightSling.Callback = "animRightSling"


	With aAutoPlunger
		.InterpolationType=2 ' Catmull-Rom Spline Interpolation
		.AddPoint2 0, 0, 0 		' addpoint2 specifies x=duration of current frame, rather than the raw MS of the animation
		.AddPoint2 1, 25, 23
		.AddPoint2 2, 57, 23
		.AddPoint2 3, 27, 23
		.AddPoint2 4, 0,  23 ' Coil returns here. duration of 0 will break the spline gradient which can be useful
		.AddPoint2 5, 50, 0
		.AddPoint2 6, 50, 0
		.Callback= "animAutoPlunger"
	End With


	with aDiverterL
		.InterpolationType=2 ' Catmull-Rom Spline Interpolation
		.AddPoint 0, 0, 230.5
		.AddPoint 1, 31, 185
		.AddPoint 2, 100, 185
		.AddPoint 3, 150, 185 ' hold here
		.AddPoint 4, 200, 185
		.AddPoint2 5, 33, 230.5	
		.AddPoint2 6, 25, 230.5
		.Callback= "animDiverterL"
	end with

	with aDiverterR
		.InterpolationType=2 ' Catmull-Rom Spline Interpolation
		.AddPoint 0, 0, 172.5
		.AddPoint 1, 31, 142
		.AddPoint 2, 100, 142
		.AddPoint 3, 150, 142 ' hold here
		.AddPoint 4, 200, 142
		.AddPoint2 5, 33, 172.5
		.AddPoint2 6, 25, 172.5
		.Callback= "animDiverterR"
	end with

	with aCannon ' This animation is special. Could be converted to a spline interpolation
		.AddPoint 0, 0, 0		' home				loitering	266? 133? 150?
		.AddPoint 1, 150, 0		' home				2600ms travel
		.AddPoint 2, 2750, 1	' full rotation		
		.AddPoint 3, 2916, 1	' full rotation	waiting 166ms
		.AddPoint 4, 5548, 2	' returned home			2632ms
	End With

	aCannon.Callback = "animCannon"
	aCannon.InterpolationType=0 ' Linear interpolation for special cannon animation (don't touch this)
End Sub

'Animation Callbacks
Sub animLeftSlingArm(Value) : SlingKicker1.RotX = Value : End Sub
Sub animRightSlingArm(Value) : SlingKicker2.RotX = Value : End Sub
Sub animLeftSling(Value) : LeftSlingBand.ShowFrame Value :  End Sub
Sub animRightSling(Value) : RightSlingBand.ShowFrame Value : End Sub
Sub animAutoPlunger(Value) : AutoPlungerMesh.RotX = Value : End Sub
sub animDiverterL(Value) : Div1P.z = value : end Sub
sub animDiverterR(Value) : DivP.z = value : end Sub


'************************************************************************
' 						CANNON ENTER
'************************************************************************
Dim GPos, GDir, BallInGun, BallInGunRadius, LaserON, GDirStep
BallInGunRadius = SQR((Cannon_assyM.X - Sw45.X)^2 + (Cannon_assyM.Y - Sw45.Y)^2)
GPos = 110: GDir = -1.8 : GDirStep = 0.8

Sub Sw45_hit()
	RandomSoundMetal
	Controller.switch(45) = 1
	Set BallInGun = ActiveBall
End Sub

'************************************************************************
' 						CANNON MOTOR
'************************************************************************
Sub InitCannon
    Controller.switch(61) = 1
    Controller.switch(62) = 0
End Sub

Sub SolCannonMotor(Enabled)
    If Enabled Then
		aCannon.PlayLoop
'		GDir = -1.8
'		GDirStep = 0.8
		PlaySoundAt SoundFX("CannonMotor", DOFGear),light41
		If LaserMod = 1 then
			LaserR.Size_Z = 0.5
			LaserR1.Size_Z = 0.5
			LaserR.visible = 1
			LaserR1.visible = 1
			LaserZTimer.Enabled = 1
			LaserON = 1
		End if
     Else
		aCannon.Pause
		StopSound "CannonMotor"
		LaserON = 0
  End If
End Sub


Function InterpolateCannon(input)	'gives the cannon 'acceleration' characteristics, by using a polynomial
	dim x, xholdover : xholdover = 0
	x = input
	if x > 1 then 
		xholdover = cint(x+0.5)-1
		x = x - cint(x+0.5)+1
	end if
	'InterpolateGun = -1.94137*x^3 + 2.91206*x^2 + 0.0293147*x + 0	'Balanced but heavy	'1.02
	InterpolateCannon = -1.97035*x^3 + 2.95552*x^2 + 0.0148269*x - 2.22045*(1E-16)	'Balanced heavier
	InterpolateCannon = InterpolateCannon + xholdover
	if InterpolateCannon < 0 then InterpolateCannon = 0
End Function

sub animCannon(value)
	dim GPosStep : GPosStep = InterpolateCannon(Value+1) ' value between 1 and 3 (2 is furthest extent)
	GPos = LinearEnvelope(GPosStep, array(1,2,3),array(110,20,110)) ' map value to rotation value - 110 degrees is home position
	if GPosStep = 3 then GPosStep = 1

	If GPos < 110 and value >= 1 Then Controller.switch(61) = 0
	If GPos <= 89 Then Controller.switch(62) = 1	' 80
	If GPos > 89 and GPos < 110 and value < 1 Then Controller.switch(61) = 0: Controller.switch(62) = 0
	If GPos >= 110 Then GPos=110: Controller.switch(61) = 1: Controller.switch(62) = 0

	Cannon_assyM.RotZ = GPos
	Cannon_decalM.RotZ = GPos
	Cannon_assyP.RotZ = GPos
	Cannon_decalP.RotZ = GPos
	Cannon_Plunger.RotZ = GPos
	Cannon_shadow.RotZ = GPos
	LaserR.objRotZ = -(GPos-90)
	LaserR1.objRotZ = -(GPos -90)
	If Not IsEmpty(BallInGun) Then
		BallInGun.X = Cannon_assyM.X - BallInGunRadius * Cos(GPos*Pi/180)
		BallInGun.Y = Cannon_assyM.Y - BallInGunRadius * Sin(GPos*Pi/180)
		BallInGun.Z = CannonRamp.HeightTop + Ballsize
	End If

End Sub



'***LaserZTimer***

Sub LaserZTimer_Timer()
	If GPos >= 102 And GPos <= 110 then LaserR.Size_Z = 0.5: LaserR1.Size_Z = 0.5
	If GPos <= -101.99 And GPos >= 97 then LaserR.Size_Z = 1: LaserR1.Size_Z = 1
	If GPos <= -96.99 And GPos >= 89.01 then LaserR.Size_Z = 0.55: LaserR1.Size_Z = 0.55
	If GPos <= 89 And GPos >= 81.01 then LaserR.Size_Z = 0.48: LaserR1.Size_Z = 0.48
	If GPos <= 81 And GPos >= 73.01 then LaserR.Size_Z = 0.78: LaserR1.Size_Z = 0.78
	If GPos <= 73 And GPos >= 65.01 then LaserR.Size_Z = 0.7: LaserR1.Size_Z = 0.7
	If GPos <= 65 And GPos >= 45.01 then LaserR.Size_Z = 0.6: LaserR1.Size_Z = 0.6
	If GPos <= 45 And GPos >= 42.01 then LaserR.Size_Z = 0.43: LaserR1.Size_Z = 0.43
	If GPos <= 42 And GPos >= 40.01 then LaserR.Size_Z = 0.425: LaserR1.Size_Z = 0.425
	If GPos <= 40 And GPos >= 37.01 then LaserR.Size_Z = 0.41: LaserR1.Size_Z = 0.41
	If GPos <= 37 And GPos >= 30.01 then LaserR.Size_Z = 0.39: LaserR1.Size_Z = 0.39
	If GPos <= 30 And GPos >= 22.01 then LaserR.Size_Z = 0.385: LaserR1.Size_Z = 0.385
	If GPos <= 22  then LaserR.Size_Z = 0.385: LaserR1.Size_Z = 0.375
	If GPos >= 110 And LaserON = 0 Then
		LaserR.Visible = 0
		LaserR1.Visible = 0
		LaserZTimer.Enabled = 0
	End if
End Sub

'************************************************************************
' 						CANNON KICKOUT
'************************************************************************
 Sub SolCannon(Enabled)
	If Enabled Then
		PlaySoundAt SoundFX("CannoShot", DOFContactors),light41
		Cannon_Plunger.PlayAnim 0, 1
		If NOT IsEmpty(BallInGun) AND Gpos < 100 Then
			Sw45.kick GPos-90, 45
			Controller.switch(45) = 0
			BallInGun = Empty
		End If
	End If
End Sub

'************************************************************************
'						BAND MEMBERS MECH
'************************************************************************
Dim LegRotRadius,LegCase,LegShake
LegRotRadius = SQR((Figure_AngusLeg.X - Supp_Angus.X)^2 + (Figure_AngusLeg.Z - Supp_Angus.Z)^2)
LegShake = 0

Sub SolBandMembers(enabled)
	If Enabled Then
		Flipper1.TimerInterval = 10
		Flipper1.TimerEnabled = 1
		Flipper1.RotateToEnd
		Flipper2.RotateToEnd
		LegShake = 0: PlaySoundAtVol SoundFX("fx_solon", DOFContactors),light31,2
	End If
End Sub

Sub Flipper1_timer
	SolPlung.TransX = Flipper2.currentangle
	Supp_Angus.RotY = Flipper1.currentangle
	Supp_Malcolm.RotY = Flipper1.currentangle
	Supp_Brian.RotY = Flipper1.currentangle
	Supp_Cliff.RotY = Flipper1.currentangle
	Figure_Angus.RotY = Flipper1.currentangle
	Figure_AngusLeg.X = Supp_Angus.X + LegRotRadius * Sin((Supp_Angus.RotY)*Pi/180)
	Figure_AngusLeg.Z = Supp_Angus.Z + LegRotRadius * Cos((Supp_Angus.RotY)*Pi/180)
	Figure_Malcolm.RotY = Flipper1.currentangle
	Figure_Brian.RotY = Flipper1.currentangle
	Figure_Cliff.RotY = Flipper1.currentangle
	Figure_DrumL.RotY = Flipper2.currentangle
	Figure_DrumR.RotY = -Flipper2.currentangle
	If Supp_Angus.RotY > 10 Then LegCase = 1: Flipper2.TimerInterval= 10: Flipper2.TimerEnabled= 1
	If Supp_Angus.RotY = 35 Then Flipper1.RotateToStart: Flipper2.RotateToStart
	If Supp_Angus.RotY = 0 Then Me.TimerEnabled = 0
End Sub

Sub Flipper2_timer
	Select Case LegCase
		Case 1
			Figure_AngusLeg.RotY = Figure_AngusLeg.RotY - 10
			If Figure_AngusLeg.RotY < -50 Then LegCase = 2
		Case 2
			LegShake = LegShake + 0.05
			Figure_AngusLeg.RotY = Figure_AngusLeg.RotY + 3 * Sin(LegShake)
			If LegShake > 1.25 Then Me.TimerEnabled = 0: Figure_AngusLeg.RotY = 0: LegShake = 0
	End Select
End Sub

'************************************************************************
' 						T.N.T. DETONATOR
'************************************************************************
Dim detDir

Sub SolDetonator(enabled)
If Enabled Then
	PlaySoundAt SoundFX(SSolenoidOn,DOFContactors),light7
	DetonatorTimer.Enabled=1
	detDir=1
End If
End Sub

Sub DetonatorTimer_Timer
	Detonator.Z= Detonator.Z - 2 * detDir
'	If Detonator.Z <= 120 AND detDir=1 Then detDir=-1
'	If Detonator.Z >= 150 AND detDir=-1 Then Me.Enabled= 0
	If Detonator.Z <= 12 AND detDir=1 Then detDir=-1		'z=55 all the way up z=12 all the way down
	If Detonator.Z >= 55 AND detDir=-1 Then Me.Enabled= 0
End Sub


'************************************************************************
' 					BELL SWINGING ANIMATION
'************************************************************************

' Bell scripting includes two fake balls : One in a circular cage (CageBall), one on the playfield for collision (ColBall)

dim CageBall, BellTheta, BellY
dim ColBall : dim ColBallExists : ColBallExists = False
dim CageHeight : CageHeight = BellCage_610h.z ' To adjust height of cage, change height of this primitive and the wall "BellCageHeight"
dim BellRadius:  BellRadius = 224.2836762

dim Bell_DebugOn : Bell_DebugOn = False ' If true, keeps ColBall visible and in position all the time

dim Bell_Mass : Bell_Mass = 1.6

Sub SetMass(mass) 'DEBUG COMMAND: tweak mass of bell in debugger
	Bell_Mass = mass
	CageBall.mass = Bell_Mass
	ColBall.mass = Bell_Mass ' <- Mass only affects collisions, so this is the one that counts
	debug.print "SetMass: bell mass set to " & ColBall.mass
End Sub

' If BellHit is false, position and velocity data will be copied from the caged ball to the collideable ball on update
' If BellHit is true, velocity data will be copied *to* the caged ball from the collideable ball (for one update only)
dim BellHit : BellHit = False 

Sub InitBell()
	Set CageBall = Bellk.CreateSizedBallWithMass (25, Bell_Mass) ' ball radius must be 25
	CageBall.visible=False
	BellCage_610h.visible=False
	Bellk.Kick 0,1, 45
	Bellk.Enabled = False
	CageBall.ID = 1000 ' this should stop RollingUpdate from working on the caged ball
	BellY = Bell.Y

	' ColBall Init
	Set ColBall = ColBallFreezer.CreateSizedBallWithMass (25, Bell_Mass) ' ball radius must be 25
	ColBall.ID = 999
	ColBall.Color = rgb(255,0,255)
	ColBallFreezer.enabled=1 ' Kicker
	ColBall.Visible = 0
	if Bell_DebugOn then ColBall_Create ' DEBUG start ball immediately
End Sub


Sub ColBall_Create() ' Unfreeze Collideable ball

	ColBallExists = True
	ColBallFreezer.kick 0,0

	ColBall.Visible = Bell_DebugOn	' visible for debug
	ColBall_Update() ' Immediate update

End Sub

Sub ColBall_Kill() ' freeze Collideable ball

	if Bell_DebugOn then exit sub	' DEBUG if exit here, col ball stays forever 

	if not ColBallExists then debug.print gametime & ": ColBall_Kill warning: ColBall does not exist!" : exit sub

	ColBallExists = False

	ColBall.x = ColBallFreezer.x
	ColBall.y = ColBallFreezer.y - 26
	ColBall.z = CageHeight + 26
	ColBall.velx=0 = ColBall.velz=0 : ColBall.vely=50

End Sub



dim NoBallsInBellArea : NoBallsInBellArea = 0

sub BellArea_hit() ' BellArea.BallCntOver is unreliable for this because ColBall is in the area
	if activeball.id < 999 then 
		NoBallsInBellArea = NoBallsInBellArea + 1
		if NoBallsInBellArea = 1 and not ColBallExists then ColBall_Create
	end If
end Sub

sub BellArea_unhit() 
	if activeball.id < 999 then 
		NoBallsInBellArea = NoBallsInBellArea - 1 
		if NoBallsInBellArea = 0 then BellArea.TimerInterval = 250 : BellArea.TimerEnabled = True
	end If
end Sub

' Freeze the ball after the timer to filter out event calls
' This is to prevent hitching due to triggers sending dozens of events in a single MS. Happens a lot!
sub BellArea_Timer() 
	if NoBallsInBellArea = 0 then 
		ColBall_Kill
		me.TimerEnabled = False
	end If ' otherwise keep checking
end Sub


Sub BellMove_Timer()

	BellTheta = ASin((CageBall.y - BellY) / BellRadius)
	Bell.RotX = BellTheta * 180/PI
	Bell_Support.RotX = Bell.RotX
	Bell_Log.RotX = Bell.RotX

	if Bell.RotX > 13 OR Bell.RotX < 0 then ' +- 6.5 degrees?
        Controller.Switch(47) = True
    else 
        Controller.Switch(47) = False
    end If


	if NoBallsInBellArea < 1 then ' reduce jittering when the bell is settled
		if abs(CageBall.Vely) < 0.15 and Bell.RotX > 6 and Bell.RotX < 7 then 
			CageBall.velx = 0 : CageBall.vely = 0 : CageBall.velz = 0
		end If

	end If

	if ColBallExists then ColBall_Update()

End Sub


Sub ColBall_Update()

	if BellHit then ' transfer momentum the other way, set True by OnBallBallCollision

'		CageBall.x = ColBall.x
'		CageBall.y = ColBall.y
'		CageBall.z = ColBall.z + CageHeight

		CageBall.velx = ColBall.velx
		CageBall.vely = ColBall.vely
		CageBall.velz = ColBall.velz

		BellHit = False

'		debug.print Round(colball.velz,2) ' hmm

'		if Bell_DebugOn then debug.print Round(ColBall.velx,2) & ", " & Round(ColBall.vely,2) & ", " & Round(ColBall.velz,2)

	else 			' Copy all values from CagedBall to ColBall
		ColBall.x = CageBall.x
		ColBall.y = CageBall.y
		ColBall.z = CageBall.z - CageHeight

		' vel?
		ColBall.velx = CageBall.velx
		ColBall.vely = CageBall.vely
		ColBall.velz = CageBall.velz

	end if

'	if Bell_DebugOn then 
'		dim str :str="CollB  CageB" & vbnewline & _
'					"VelX:" & Round(ColBall.velx) & "  " & Round(CageBall.velx) & vbnewline & _
'					"VelY:" & Round(ColBall.vely) & "  " & Round(CageBall.vely) & vbnewline & _
'					"VelZ:" & Round(ColBall.velZ) & "  " & Round(CageBall.velZ) & vbnewline & _
'					"Posx:" & Round(ColBall.x) & "  " & Round(CageBall.x) & vbnewline & _
'					"PosY:" & Round(ColBall.y) & "  " & Round(CageBall.y) & vbnewline & _
'					"PosZ:" & Round(ColBall.z) & "  " & Round(CageBall.z) & vbnewline & _
'					"RotX:" & Round(Bell.RotX,1) & " Theta=" & Round(BellTheta,3) & vbnewline & _
'					"Mass:" & Bell_Mass & vbnewline & _
'					"_"
'		if tb.text <> str then tb.text = str end if
'	end if 

End Sub


' hacks for bell movement. This envelope multiplies the velocity of the caged ball when the caged ball passes the center line (trigger BellMomentumTrigger)
' The goal here is about 12-18 seconds of free swinging. typically 15 seconds from a cannon shot
' 	-- Bell should swing freely, but still settle quickly so it can be retriggered by ball hits

dim LastBellDampen : LastBellDampen = 0
sub BellMomentumTrigger_hit()
	if (LastBellDampen + 50) > gametime then exit sub ' this keeps triggering several times per ms... stop this
	LastBellDampen = gametime
	dim speed : speed = BallSpeed(activeball)

	' hack - dampen only
'	dim aSpeed : aSpeed = Array(0.0, 6.0, 7.0)
'	dim aMulty : aMulty = Array(0.2, 0.8, 0.8)

	dim aSpeed : aSpeed = Array(0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0)
	dim aMulty : aMulty = Array(0.19,0.70,1.00, 1.18, 1.28, 1.18, 1.0, 1.0)

	dim dampenamount : dampenamount = LinearEnvelope(speed, aSpeed, aMulty)

	activeball.velX = activeball.velX * dampenamount
	activeball.velY = activeball.velY * dampenamount
	activeball.velZ = 0

end Sub

dim LastBellHitTime : LastBellHitTime = 0 ' Keep track of last hit for cleaner SFX? - only used for debugging atm

'/////////////////////////////  BALL COLLISION SOUND  ////////////////////////////
Sub OnBallBallCollision(ball1, ball2, velocity)
	if ball1.id = 999 or ball2.id = 999 then ' 1: if bell collision is detected...
		BellHit = True						 ' 2: Flag BellHit. This will cause the update to copy velocity from ColBall back to the CageBall
		LastBellHitTime = gametime
		if (velocity < 3) then exit sub 		' don't spam bell collision sfx?

	end If

	Dim snd
	Select Case Int(Rnd*7)+1
		Case 1 : snd = "Ball_Collide_1"
		Case 2 : snd = "Ball_Collide_2"
		Case 3 : snd = "Ball_Collide_3"
		Case 4 : snd = "Ball_Collide_4"
		Case 5 : snd = "Ball_Collide_5"
		Case 6 : snd = "Ball_Collide_6"
		Case 7 : snd = "Ball_Collide_7"
	End Select

	PlaySound (snd), 0, Csng(velocity) ^2 / 200 * BallWithBallCollisionSoundFactor * VolumeDial, AudioPan(ball1), 0, Pitch(ball1), 0, 0, AudioFade(ball1)
End Sub



Function ASin(x)
	ASin = Atn(x / SQR(max(0.01,-x * x + 1)))
End Function

Sub SolBellMove(Enabled) ' Bell magnet. Only used during Hell's Bell song in rare circumstances
	If Enabled then
		if Bell.RotX > 10 then CageBall.vely = -35 else CageBall.vely = 35 end if
	End If
End Sub



'************************************************************************
'						SWITCHES
'************************************************************************

'Targets AC/DC
Sub sw1_hit:DTHit 1 : TargetBouncer Activeball, 1 :End Sub
Sub sw2_hit:DTHit 2 : TargetBouncer Activeball, 1 :End Sub
Sub sw3_hit:DTHit 3 : TargetBouncer Activeball, 1 :End Sub
Sub sw4_hit:DTHit 4 : TargetBouncer Activeball, 1 :End Sub
Sub sw5_hit:DTHit 5 : TargetBouncer Activeball, 1 :End Sub

Sub SolDTBank5(enabled)
	if enabled then
		RandomSoundDropTargetReset sw1p
		DTRaise 1
		DTRaise 2
		DTRaise 3
		DTRaise 4
		DTRaise 5
	end if
End Sub

'Sub sw1_dropped:ACDCBank.Hit 1:End Sub
'Sub sw2_dropped:ACDCBank.Hit 2:End Sub
'Sub sw3_dropped:ACDCBank.Hit 3:End Sub
'Sub sw4_dropped:ACDCBank.Hit 4:End Sub
'Sub sw5_dropped:ACDCBank.Hit 5:End Sub

'Targets ROCK
Sub Sw6_Hit():vpmTimer.PulseSw 6: TargetBouncer Activeball, 1 : End Sub
Sub Sw7_Hit():vpmTimer.PulseSw 7: TargetBouncer Activeball, 1 : End Sub
Sub Sw8_Hit():vpmTimer.PulseSw 8: TargetBouncer Activeball, 1 : End Sub
Sub Sw9_Hit():vpmTimer.PulseSw 9: TargetBouncer Activeball, 1 : End Sub

'Targets TNT
Sub sw10_hit:DTHit 10: TargetBouncer Activeball, 1 :End Sub
Sub sw11_hit:DTHit 11: TargetBouncer Activeball, 1 :End Sub
Sub sw12_hit:DTHit 12: TargetBouncer Activeball, 1 :End Sub

Sub SolDTBank3(enabled)
	if enabled then
		RandomSoundDropTargetReset sw10p
		DTRaise 10
		DTRaise 11
		DTRaise 12
	end if
End Sub



'Left Ramp
Sub Sw13_Hit:Controller.Switch(13)=1: End Sub
Sub Sw13_UnHit:Controller.Switch(13)=0: End Sub

Sub Sw14_Hit:Controller.Switch(14) = 1: End Sub 
Sub Sw14_UnHit():Controller.Switch(14) = 0: End Sub

'Bottom Lane Rollovers
Sub sw24_Hit:Controller.Switch(24) = 1:End Sub
Sub sw24_UnHit:Controller.Switch(24) = 0:End Sub

Sub sw25_Hit:Controller.Switch(25) = 1:End Sub
Sub sw25_UnHit:Controller.Switch(25) = 0:End Sub

Sub sw28_Hit:Controller.Switch(28) = 1:End Sub
Sub sw28_UnHit:Controller.Switch(28) = 0:End Sub

Sub sw29_Hit:Controller.Switch(29) = 1:End Sub
Sub sw29_UnHit:Controller.Switch(29) = 0:End Sub

' Slingshots


Sub LeftSlingShot_Slingshot()
	LS.VelocityCorrect(ActiveBall)
    RandomSoundSlingshotLeft SlingKicker1 
	aLeftSlingArm.play : aLeftSling.play
    vpmTimer.PulseSw 26
    Me.TimerEnabled = 1
End Sub


Sub RightSlingShot_Slingshot()
	RS.VelocityCorrect(ActiveBall)
    RandomSoundSlingshotRight SlingKicker2
	aRightSlingArm.play : aRightSling.play
    vpmTimer.PulseSw 27
    Me.TimerEnabled = 1
End Sub


' Bumpers
Sub Bumper1_Hit():vpmTimer.PulseSw 30:RandomSoundBumperTop Bumper1:End Sub
Sub Bumper2_Hit():vpmTimer.PulseSw 31:RandomSoundBumperMiddle Bumper2:End Sub
Sub Bumper3_Hit():vpmTimer.PulseSw 32:RandomSoundBumperBottom Bumper3:End Sub

' Spinner
Sub Sw33_Spin():vpmTimer.PulseSw 33: SoundSpinner sw34 : End Sub

'Targets Thunder
Sub Sw34_Hit():vpmTimer.PulseSw 34: End Sub
Sub Sw35_Hit():vpmTimer.PulseSw 35: End Sub
Sub Sw42_Hit():vpmTimer.PulseSw 42: End Sub

'Top Lane Rollovers
Sub sw38_Hit:Controller.Switch(38) = 1:End Sub
Sub sw38_UnHit:Controller.Switch(38) = 0:End Sub
Sub sw39_Hit:Controller.Switch(39) = 1:End Sub
Sub sw39_UnHit:Controller.Switch(39) = 0:End Sub
Sub sw40_Hit:Controller.Switch(40) = 1:End Sub
Sub sw40_UnHit:Controller.Switch(40) = 0:End Sub

'Right Ramp
Sub Sw41_Hit:Controller.Switch(41) = 1: End Sub 
Sub Sw41_UnHit:Controller.Switch(41) = 0: End Sub

Sub sw43_Hit:Controller.Switch(43)=1: End Sub
Sub sw43_UnHit:Controller.Switch(43)=0: End Sub

'Left Orbit
Sub sw44_Hit:Controller.Switch(44) = 1:End Sub
Sub sw44_UnHit:Controller.Switch(44) = 0:If Activeball.velX>20 Then Activeball.velX = Activeball.VelX*0.8:End If:End Sub

'Plunger Lane
Sub sw48_Hit:Controller.Switch(48) = 1:End Sub
Sub sw48_UnHit:Controller.Switch(48) = 0:End Sub

'Right Orbit
Sub sw59_Hit:Controller.Switch(59) = 1:End Sub
Sub sw59_UnHit:Controller.Switch(59) = 0:End Sub

'Detonator Target
Sub sw46_hit():vpmTimer.PulseSw 46:  End Sub

'Lower PF target left
Sub sw50_hit():vpmTimer.PulseSw 50:  End Sub

'Lower PF target center	
Sub sw51_hit():vpmTimer.PulseSw 51:  End Sub

'Lower PF target right		
Sub sw52_hit():vpmTimer.PulseSw 52: End Sub

'Lower PF rollover left
Sub sw53_hit:Controller.Switch(53) = 1:End Sub
Sub sw53_UnHit:Controller.Switch(53) = 0:End Sub

'Lower PF rollover right
Sub sw54_hit:Controller.Switch(54) = 1:End Sub
Sub sw54_UnHit:Controller.Switch(54) = 0:End Sub




Sub FlashSol121(level)
'		Objlevel(1) = level/255 : FlasherFlash1_Timer
		Objlevel(1) = (level/255)^0.75 : FlasherFlash1_Timer
		if level > 0 then
			Sound_Flash_Relay 1, Flasherflash1
		else 
			Sound_Flash_Relay 0, Flasherflash1
		end if
End Sub

Sub FlashSol131(level)
'		Objlevel(2) = level/255 : FlasherFlash2_Timer
		Objlevel(2) = (level/255)^0.75 : FlasherFlash2_Timer
		if level > 0 then
			Sound_Flash_Relay 1, Flasherflash2
		else 
			Sound_Flash_Relay 0, Flasherflash2
		end if
End Sub

Dim TestFlashers, TableRef, FlasherLightIntensity, FlasherFlareIntensity, FlasherBloomIntensity, FlasherOffBrightness

								' *********************************************************************
TestFlashers = 0				' *** set this to 1 to check position of flasher object 			***
Set TableRef = ACDC				' *** change this, if your table has another name       			***
FlasherLightIntensity = 0.3		' *** lower this, if the VPX lights are too bright (i.e. 0.1)		***
FlasherFlareIntensity = 0.3		' *** lower this, if the flares are too bright (i.e. 0.1)			***
FlasherBloomIntensity = 0.4		' *** lower this, if the blooms are too bright (i.e. 0.1)			***	
FlasherOffBrightness = 0.3		' *** brightness of the flasher dome when switched off (range 0-2)	***
								' *********************************************************************

Dim ObjLevel(20), objbase(20), objlit(20), objflasher(20), objbloom(20), objlight(20)
'Dim tablewidth, tableheight : tablewidth = TableRef.width : tableheight = TableRef.height
'initialise the flasher color, you can only choose from "green", "red", "purple", "blue", "white" and "yellow"

InitFlasher 1, "yellow"
InitFlasher 2, "red"

' rotate the flasher with the command below (first argument = flasher nr, second argument = angle in degrees)
RotateFlasher 1,0 : RotateFlasher 2,25

Sub InitFlasher(nr, col)
	' store all objects in an array for use in FlashFlasher subroutine
	Set objbase(nr) = Eval("Flasherbase" & nr) : Set objlit(nr) = Eval("Flasherlit" & nr)
	Set objflasher(nr) = Eval("Flasherflash" & nr) : Set objlight(nr) = Eval("Flasherlight" & nr)
	Set objbloom(nr) = Eval("Flasherbloom" & nr)
	' If the flasher is parallel to the playfield, rotate the VPX flasher object for POV and place it at the correct height
	If objbase(nr).RotY = 0 Then
'		objbase(nr).ObjRotZ =  atn( (tablewidth/2 - objbase(nr).x) / (objbase(nr).y - tableheight*1.1)) * 180 / 3.14159
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
'		Case "blue" :   objlight(nr).color = RGB(4,120,255) : objflasher(nr).color = RGB(200,255,255) : objbloom(nr).color = RGB(4,120,255) : objlight(nr).intensity = 5000
'		Case "green" :  objlight(nr).color = RGB(12,255,4) : objflasher(nr).color = RGB(12,255,4) : objbloom(nr).color = RGB(12,255,4)
		Case "red" :    objlight(nr).color = RGB(255,32,4) : objflasher(nr).color = RGB(255,32,4) : objbloom(nr).color = RGB(255,32,4)
'		Case "purple" : objlight(nr).color = RGB(230,49,255) : objflasher(nr).color = RGB(255,64,255) : objbloom(nr).color = RGB(230,49,255) 
		Case "yellow" : objlight(nr).color = RGB(255,255,5) : objflasher(nr).color = RGB(255,255,5) : objbloom(nr).color = RGB(255,255,5)
'		Case "yellow" : objlight(nr).color = RGB(200,173,25) : objflasher(nr).color = RGB(255,200,50) : objbloom(nr).color = RGB(200,173,25)
'		Case "white" :  objlight(nr).color = RGB(255,240,150) : objflasher(nr).color = RGB(100,86,59) : objbloom(nr).color = RGB(255,240,150)
'		Case "orange" :  objlight(nr).color = RGB(255,70,0) : objflasher(nr).color = RGB(255,70,0) : objbloom(nr).color = RGB(255,70,0)
	end select
	objlight(nr).colorfull = objlight(nr).color
	If TableRef.ShowDT and ObjFlasher(nr).RotX = -45 Then 
		objflasher(nr).height = objflasher(nr).height - 20 * ObjFlasher(nr).y / tableheight
		ObjFlasher(nr).y = ObjFlasher(nr).y + 10
	End If
End Sub

Sub RotateFlasher(nr, angle) : angle = ((angle + 360 - objbase(nr).ObjRotZ) mod 180)/30 : objbase(nr).showframe(angle) : objlit(nr).showframe(angle) : End Sub

Sub FlashFlasher(nr)
	If not objflasher(nr).TimerEnabled Then objflasher(nr).TimerEnabled = True : objflasher(nr).visible = 1 : objbloom(nr).visible = 1 : objlit(nr).visible = 1 : End If
	objflasher(nr).opacity = 1000 *  FlasherFlareIntensity * ObjLevel(nr)^2.5
	objbloom(nr).opacity = 100 *  FlasherBloomIntensity * ObjLevel(nr)^2.5
	objlight(nr).IntensityScale = 0.5 * FlasherLightIntensity * ObjLevel(nr)^3
	objbase(nr).BlendDisableLighting =  FlasherOffBrightness + 10 * ObjLevel(nr)^3	
	objlit(nr).BlendDisableLighting = 10 * ObjLevel(nr)^2
	UpdateMaterial "Flashermaterial" & nr,0,0,0,0,0,0,ObjLevel(nr),RGB(255,255,255),0,0,False,True,0,0,0,0 
	ObjLevel(nr) = ObjLevel(nr) * 0.9 - 0.01
	If ObjLevel(nr) < 0 Then objflasher(nr).TimerEnabled = False : objflasher(nr).visible = 0 : objbloom(nr).visible = 0 : objlit(nr).visible = 0 : End If
End Sub

Sub FlasherFlash1_Timer() : FlashFlasher(1) : End Sub
Sub FlasherFlash2_Timer() : FlashFlasher(2) : End Sub

'******************************************************
'******  END FLUPPER DOMES
'******************************************************


' *********************************************************************
' 					Ball Drop & Ramp Sounds
' *********************************************************************

'Sub ShooterStart_Hit():StopSound "fx_launchball":If ActiveBall.VelY < 0 Then PlaySoundAt "fx_launchball",Plunger:End If:End Sub	'ball is going up

Sub ShooterEnd_Hit:If ActiveBall.Z > 30  Then Me.TimerInterval=100:Me.TimerEnabled=1:End If:End Sub						'ball is flying
Sub ShooterEnd_Timer(): Me.TimerEnabled=0 : PlaySound "fx_balldrop",0,1,.2,0,0,0,0,-.8 : End Sub

Sub LREnter_Hit():If ActiveBall.VelY < 0 Then WireRampOn True:End If:End Sub			'ball is going up
Sub LREnter_UnHit():If ActiveBall.VelY > 0 Then WireRampOff :End If:End Sub		'ball is going down

Sub RREnter_Hit():If ActiveBall.VelY < 0 Then WireRampOn True:End If:End Sub			'ball is going up
Sub RREnter_UnHit():If ActiveBall.VelY > 0 Then WireRampOff :End If:End Sub		'ball is going down


Sub LRExit_Hit():ActiveBall.VelY=1: WireRampOff : RandomSoundRampStop LRExit End Sub ' Me.TimerInterval=200:Me.TimerEnabled=1:End Sub

Sub RRExit_Hit(): WireRampOff: RandomSoundRampStop RRExit :Me.TimerInterval=200: End Sub 'Me.TimerEnabled=1:End Sub

Sub Div1_Hit() : If Div1Hit=0 Then PlaySoundAtBall "fx_ramp_turn": End If: Div1Hit=1: Me.TimerInterval=3000: Me.TimerEnabled=1: End Sub
Sub Div1_Timer(): Me.TimerEnabled=0 : Div1Hit = 0 : End Sub

Sub Div3_Hit() : If Div3Hit=0 Then PlaySoundAtBall "fx_ramp_turn" : End If: Div3Hit=1: Me.TimerInterval=3000: Me.TimerEnabled=1: End Sub
Sub Div3_Timer(): Me.TimerEnabled=0 : Div3Hit = 0 : End Sub

Sub CREnter_Hit() : WireRampOff : WireRampOn False : End Sub

Sub CRExit_Hit() : WireRampOff : WireRampOn True: End Sub

'Sub Helper_hit:ActiveBall.VelX=0.9*ActiveBall.VelX:ActiveBall.VelY=0.9*ActiveBall.VelY:End Sub

' *********************************************************************
' 						Other Sound FX
' *********************************************************************

Sub LeftFlipper_Collide(parm)
	CheckLiveCatch Activeball, LeftFlipper, LFCount, parm
    LeftFlipperCollide parm
End Sub

Sub RightFlipper_Collide(parm)
	CheckLiveCatch Activeball, RightFlipper, RFCount, parm
    RightFlipperCollide parm
End Sub

Sub LeftFlipperMini_Collide(parm)
    LeftFlipperCollide parm
End Sub

Sub RightFlipperMini_Collide(parm)
    RightFlipperCollide parm
End Sub


Dim NextOrbitHit:NextOrbitHit = 0 


' *********************************************************************
' 						RealTime Updates
' *********************************************************************
'Set MotorCallback = GetRef("RealTimeUpdates")

Sub RealTimeUpdates_timer
	Cor.Update
	RollingUpdate
	If DynamicBallShadowsOn Or AmbientBallShadowOn Then DynamicBSUpdate 'update ball shadows
	DoDTAnim
	GateR2.RotX = - Spinner1.currentangle
	'GateR.RotX = - Spinner2.currentangle
	GateR.RotX = - GateRRamp.currentangle
	'GateL.RotX = - Spinner3.currentangle
	GateL.RotX = - GateLRamp.currentangle
	GateL2.RotX = - Spinner4.currentangle
	SpinnerT1.RotX = - Sw33.currentangle
	GateR1.RotX = - Spinner6.currentangle
	GateL1.RotX = - Spinner7.currentangle
	RightGate.RotY = Gate.currentangle
	LeftGate.RotX = -Gate2.currentangle
	f21r.visible = Flasherflash1.visible
	f21r.opacity = Flasherflash1.opacity
	f31r.visible = Flasherflash2.visible
	f31r.opacity = Flasherflash2.opacity
    LFLogo.RotZ = LeftFlipper.CurrentAngle
    RFlogo.RotZ = RightFlipper.CurrentAngle


End Sub

Sub LongUpdates_Timer()
	NarniaCheck
End Sub

sub NarniaCheck()
	dim b : for each b in getballs
		if b.y > 2056 then
			b.velx = 0 : b.vely = 0 : b.velz = 0
			if b.id < 999 then ' Regular Ball - drop in shooter lane
				b.x = 897
				b.y = 1650
				b.z = 65
			elseif b.id = 1000 then ' bell CageBell
				b.x = BellK.x
				b.y = BellK.y
				b.z = CageHeight + 30
			elseif b.id = 999 then	' bell ColBall
				ColBall_Kill()
			end if

		end If
	Next

End Sub


Sub InitOptions
	if CabinetMode Then
		'Armour.visible = False
	Else
		'Armour.visible = DesktopMode
	End If
'	f21b.visible = NOT DesktopMode : f21bDT.visible = DesktopMode
'	f31b.visible = NOT DesktopMode : f31bDT.visible = DesktopMode : f31bDT1.visible = DesktopMode
	f17a.visible = TrainHornsLit:f17b.visible = TrainHornsLit
	l63b.visible = DesktopMode:l63c.visible = DesktopMode
	EMReel1.visible = DesktopMode:	EMReel2.visible = DesktopMode
	If VaultEdition=0 Then
		ApronStickers.image= "ApronSticker-default"
		PinCab_Backbox.image= "Pincab_backbox"
		Pincab_DMD_Decal.visible = 1
		Pincab_DMD_Decal_VE.visible = 0
		lowpfPlate.visible=0 : LEDflashers.visible=0
		f20.ShowBulbMesh = True : f20.BulbHaloHeight = 58
		f30.ShowBulbMesh = True : f30.BulbHaloHeight = 58
	Else
		ApronStickers.image= "ApronSticker-vault"
		PinCab_Backbox.image= "Pincab_backbox_VE"
		Pincab_DMD_Decal.image= "Pincab_DMD_Decal_VE"
		Pincab_DMD_Decal.visible = 0
		Pincab_DMD_Decal_VE.visible = 1
		lowpfPlate.visible=1 : LEDflashers.visible=1
		f20.ShowBulbMesh = False: f20.BulbHaloHeight = 35
		f30.ShowBulbMesh = False: f30.BulbHaloHeight = 35
		light6.BulbHaloHeight = 1
	End If
	
	Select Case VRTopper
	Case 0
		Pincab_Topper.visible = 0
		Pincab_TTopper.visible = 0
	Case 1
		Pincab_Topper.visible = 1
		Pincab_TTopper.visible = 0
	Case 2
		Pincab_TTopper.visible = 1
		Pincab_Topper.visible = 0
	End Select

	Select Case VRDMDDecal
		Case 0
		Pincab_DMD_decal.image = "Pincab_DMD_Decal"
		Case 1
		Pincab_DMD_decal.image = "Pincab_DMD_Decal_Amp"
		Case 2
		Pincab_DMD_decal.image = "Pincab_DMD_Decal_Custom"
	End Select




	Select Case InstrCardType
		Case 0
			Cards.image= "ACDC-Card"
		Case 1
			Cards.image= "ACDC-Card_y"
		Case 2
			Cards.image= "ACDC-Luci-Card"
	End Select
	If NudeMod=0 Then
		Lower_PF.image = "low-pf_Luci"
		SpinnerT1.image = "spinner"
		Translite.image = "BackglassImage"
	Else
		Lower_PF.image = "low-pf_Luci-XXX"
		ApronStickers.image = "ApronSticker-XXX"
		Cards.image = "ACDC-Luci-Card-XXX"
		SpinnerT1.image = "spinner-XXX"
		Translite.image = "BackglassImage-XXX"
	End If
	If FlippersDecals=0 Then
		LFLogo.image = "williamsbatnoWredRubber" : RFLogo.image = "williamsbatnoWredRubber"
	Else
		LFLogo.image = "williamsbatnoWredRubber_c" : RFLogo.image = "williamsbatnoWredRubber_c"
	End If
		If MFlippersDecals=0 Then
		LeftFlipperMini.image = "LeftFlipper" : RightFlipperMini.image = "RightFlipper"
	Else
		LeftFlipperMini.image = "LeftFlipper_c" : RightFlipperMini.image = "RightFlipper_c"
	End If

	Select Case SideCabDecals
		Case 0
			Cab_LeftWall.image = "SideWalls":Cab_RightWall.image = "SideWalls"
		Case 1
			Cab_LeftWall.image = "SideWalls_FlamesNF-cwebplossless":Cab_RightWall.image = "SideWalls_FlamesNF-cwebplossless"
		Case 2
			Cab_LeftWall.image = "Pincab_Sideblade_Left":Cab_RightWall.image = "Pincab_Sideblade_Right"
	End Select

	Bell_Log.visible = BellMod
	LeftRampDecal.visible = RampsDecals
	RightRampDecal.visible = RampsDecals
	CrossOverDecal.visible = RampsDecals
	l63a.visible = FIREButtonLight

	' Disable all outlanes
	Postn6_Left_easy.visible = False
	Rubber_716_Left_easy.visible = False
	zCol_Rubber6_Left_easy.collidable = False
	Postn6_Right_easy.visible = False
	Rubber_716_Right_easy.visible = False
	zCol_Rubber6_Right_easy.collidable = False

	Postn6_Left_med.visible = False
	Rubber_716_Left_med.visible = False
	zCol_Rubber6_Left_med.collidable = False
	Postn6_Right_med.visible = False
	Rubber_716_Right_med.visible = False
	zCol_Rubber6_Right_med.collidable = False
	
	Postn6_Left_hard.visible = False
	Rubber_716_Left_hard.visible = False
	zCol_Rubber6_Left_hard.collidable = False
	Postn6_Right_hard.visible = False
	Rubber_716_Right_hard.visible = False
	zCol_Rubber6_Right_hard.collidable = False

If OutLaneDifficulty = 0 Then
	' Easy
	Postn6_Left_easy.visible = True
	Rubber_716_Left_easy.visible = True
	zCol_Rubber6_Left_easy.collidable = True
	Postn6_Right_easy.visible = True
	Rubber_716_Right_easy.visible = True
	zCol_Rubber6_Right_easy.collidable = True


	Elseif OutLaneDifficulty = 1 Then
		' Normal
		Postn6_Left_med.visible = True
		Rubber_716_Left_med.visible = True
		zCol_Rubber6_Left_med.collidable = True
		Postn6_Right_med.visible = True
		Rubber_716_Right_med.visible = True
		zCol_Rubber6_Right_med.collidable = True


	Elseif OutLaneDifficulty = 2 Then
		' Difficult
		Postn6_Left_hard.visible = True
		Rubber_716_Left_hard.visible = True
		zCol_Rubber6_Left_hard.collidable = True
		Postn6_Right_hard.visible = True
		Rubber_716_Right_hard.visible = True
		zCol_Rubber6_Right_hard.collidable = True


	Else
		' Default to Hard if set to something other than 0, 1, 2
		Postn6_Left_hard.visible = True
		Rubber_716_Left_hard.visible = True
		zCol_Rubber6_Left_hard.collidable = True
		Postn6_Right_hard.visible = True
		Rubber_716_Right_hard.visible = True
		zCol_Rubber6_Right_hard.collidable = True


	End If

End Sub


'******************************************************
' VPW TargetBouncer for targets and posts by Iaakki, Wrd1972, Apophis
'******************************************************

Const TargetBouncerEnabled = 1 		'0 = normal standup targets, 1 = bouncy targets, 2 = orig TargetBouncer
Const TargetBouncerFactor = 0.7 	'Level of bounces. Recommmended value of 0.7 when TargetBouncerEnabled=1, and 1.1 when TargetBouncerEnabled=2


sub TargetBouncer(aBall,defvalue)
    dim zMultiplier, vel, vratio
    if TargetBouncerEnabled = 1 and aball.z < 30 then
        'debug.print "velx: " & aball.velx & " vely: " & aball.vely & " velz: " & aball.velz
        vel = BallSpeed(aBall)
        if aBall.velx = 0 then vratio = 1 else vratio = aBall.vely/aBall.velx
        Select Case Int(Rnd * 6) + 1
            Case 1: zMultiplier = 0.2*defvalue
			Case 2: zMultiplier = 0.25*defvalue
            Case 3: zMultiplier = 0.3*defvalue
			Case 4: zMultiplier = 0.4*defvalue
            Case 5: zMultiplier = 0.45*defvalue
            Case 6: zMultiplier = 0.5*defvalue
        End Select
        aBall.velz = abs(vel * zMultiplier * TargetBouncerFactor)
        aBall.velx = sgn(aBall.velx) * sqr(abs((vel^2 - aBall.velz^2)/(1+vratio^2)))
        aBall.vely = aBall.velx * vratio
        'debug.print "---> velx: " & aball.velx & " vely: " & aball.vely & " velz: " & aball.velz
        'debug.print "conservation check: " & BallSpeed(aBall)/vel
    elseif TargetBouncerEnabled = 2 and aball.z < 30 then
		'debug.print "velz: " & activeball.velz
		if aball.vely > 3 then	'only hard hits
			Select Case Int(Rnd * 4) + 1
				Case 1: zMultiplier = defvalue+1.1
				Case 2: zMultiplier = defvalue+1.05
				Case 3: zMultiplier = defvalue+0.7
				Case 4: zMultiplier = defvalue+0.3
			End Select
			aBall.velz = aBall.velz * zMultiplier * TargetBouncerFactor
			'debug.print "----> velz: " & activeball.velz
			'debug.print "conservation check: " & BallSpeed(aBall)/vel
		End If
	end if
end sub

'******************************************************
' Flippers Polarity (Select appropriate sub based on era) 
'******************************************************

dim LF : Set LF = New FlipperPolarity
dim RF : Set RF = New FlipperPolarity

InitPolarity

'*******************************************
' Early 90's and after

Sub InitPolarity()
        dim x, a : a = Array(LF, RF)
        for each x in a

			x.AddPt "Ycoef", 0, RightFlipper.Y-65, 1 ' disabled
			x.AddPt "Ycoef", 1, RightFlipper.Y-11, 1
			x.enabled = True
			x.TimeDelay = 60
			x.DebugOn = False ' prints some info in debugger

			x.AddPt "Polarity", 0, 0, 0
			x.AddPt "Polarity", 1, 0.05, -5.5
			x.AddPt "Polarity", 2, 0.40, -5.5
			x.AddPt "Polarity", 3, 0.60, -5.0
			x.AddPt "Polarity", 4, 0.65, -4.5
			x.AddPt "Polarity", 5, 0.70, -4.0
			x.AddPt "Polarity", 6, 0.75, -3.5
			x.AddPt "Polarity", 7, 0.80, -3.0
			x.AddPt "Polarity", 8, 0.85, -2.5
			x.AddPt "Polarity", 9, 0.90, -2.0
			x.AddPt "Polarity", 10,0.95, -1.5
			x.AddPt "Polarity", 11,1.00, -1.0
			x.AddPt "Polarity", 12,1.05, -0.5
			x.AddPt "Polarity", 13,1.10, 0
			x.AddPt "Polarity", 14,1.30, 0

			x.AddPt "Velocity", 0, 0.000, 1
			x.AddPt "Velocity", 1, 0.160, 1.06
			x.AddPt "Velocity", 2, 0.410, 1.05
			x.AddPt "Velocity", 3, 0.530, 1 ' 0.982
			x.AddPt "Velocity", 4, 0.702, 0.968
			x.AddPt "Velocity", 5, 0.950, 0.968
			x.AddPt "Velocity", 6, 1.030, 0.945

        Next

		' SetObjects arguments: 1: name of object 2: flipper object: 3: Trigger object around flipper
		LF.SetObjects "LF", LeftFlipper, TriggerLF 
		RF.SetObjects "RF", RightFlipper, TriggerRF 

End Sub

'******************************************************
'  FLIPPER CORRECTION FUNCTIONS
'******************************************************

' modified 2023 by nFozzy
' Removed need for 'endpoint' objects
' Added 'createvents' type thing for TriggerLF / TriggerRF triggers. 
' Removed AddPt function which complicated setup imo
' made DebugOn do something (prints some stuff in debugger) 
'	Otherwise it should function exactly the same as before

Class FlipperPolarity 
	Public DebugOn, Enabled
	Private FlipAt        ' Timer variable (IE 'flip at 723,530ms...)
	Public TimeDelay        ' delay before trigger turns off and polarity is disabled
	private Flipper, FlipperStart, FlipperEnd, FlipperEndY, LR, PartialFlipCoef
	Private Balls(20), balldata(20)
	private Name

	dim PolarityIn, PolarityOut
	dim VelocityIn, VelocityOut
	dim YcoefIn, YcoefOut
	Public Sub Class_Initialize 
		redim PolarityIn(0) : redim PolarityOut(0) : redim VelocityIn(0) : redim VelocityOut(0) : redim YcoefIn(0) : redim YcoefOut(0)
		Enabled = True : TimeDelay = 50 : LR = 1:  dim x : for x = 0 to uBound(balls) : balls(x) = Empty : set Balldata(x) = new SpoofBall : next 
	End Sub

	Public Sub SetObjects(aName, aFlipper, aTrigger) 

		if typename(aName) <> "String" then msgbox "FlipperPolarity: .SetObjects error: first argument must be a string (and name of Object). Found:" & typename(aName) end if
		if typename(aFlipper) <> "Flipper" then msgbox "FlipperPolarity: .SetObjects error: second argument must be a flipper. Found:" & typename(aFlipper) end if
		if typename(aTrigger) <> "Trigger" then msgbox "FlipperPolarity: .SetObjects error: third argument must be a trigger. Found:" & typename(aTrigger) end if
		if aFlipper.EndAngle > aFlipper.StartAngle then LR = -1 Else LR = 1 End If
		Name = aName
		Set Flipper = aFlipper : FlipperStart = aFlipper.x 
		FlipperEnd = Flipper.Length * sin((Flipper.StartAngle / 57.295779513082320876798154814105)) + Flipper.X ' big floats for degree to rad conversion
		FlipperEndY = Flipper.Length * cos(Flipper.StartAngle / 57.295779513082320876798154814105)*-1 + Flipper.Y

		dim str : str = "sub " & aTrigger.name & "_Hit() : " & aName & ".AddBall ActiveBall : End Sub'" ' automatically create hit / unhit events if uncommented
		ExecuteGlobal(str)
		str = "sub " & aTrigger.name & "_UnHit() : " & aName & ".PolarityCorrect ActiveBall : End Sub'"
		ExecuteGlobal(str)	

	End Sub

	Public Property Let EndPoint(aInput) :  : End Property ' Legacy: just no op 

	Public Sub AddPt(aChooseArray, aIDX, aX, aY) ' Index #, X position, (in) y Position (out) 
		Select Case aChooseArray
			case "Polarity" : ShuffleArrays PolarityIn, PolarityOut, 1 : PolarityIn(aIDX) = aX : PolarityOut(aIDX) = aY : ShuffleArrays PolarityIn, PolarityOut, 0
			Case "Velocity" : ShuffleArrays VelocityIn, VelocityOut, 1 :VelocityIn(aIDX) = aX : VelocityOut(aIDX) = aY : ShuffleArrays VelocityIn, VelocityOut, 0
			Case "Ycoef" : ShuffleArrays YcoefIn, YcoefOut, 1 :YcoefIn(aIDX) = aX : YcoefOut(aIDX) = aY : ShuffleArrays YcoefIn, YcoefOut, 0
		End Select
	End Sub 

	Public Sub AddBall(aBall) : dim x : for x = 0 to uBound(balls) : if IsEmpty(balls(x)) then set balls(x) = aBall : exit sub :end if : Next  : End Sub

	Private Sub RemoveBall(aBall)
		dim x : for x = 0 to uBound(balls)
			if TypeName(balls(x) ) = "IBall" then 
				if aBall.ID = Balls(x).ID Then
					balls(x) = Empty
					Balldata(x).Reset
				End If
			End If
		Next
	End Sub

	Public Sub Fire() 
		Flipper.RotateToEnd
		processballs
	End Sub

	Public Property Get Pos ' returns % position a ball. For debug stuff.
		dim x : for x = 0 to uBound(balls)
			if not IsEmpty(balls(x) ) then
				pos = pSlope(Balls(x).x, FlipperStart, 0, FlipperEnd, 1)
			End If
		Next                
	End Property

	Public Sub ProcessBalls() ' save data of balls in flipper range
		FlipAt = GameTime
		dim x : for x = 0 to uBound(balls)
			if not IsEmpty(balls(x) ) then
				balldata(x).Data = balls(x)
			End If
		Next
		PartialFlipCoef = ((Flipper.StartAngle - Flipper.CurrentAngle) / (Flipper.StartAngle - Flipper.EndAngle))
		PartialFlipCoef = abs(PartialFlipCoef-1)
	End Sub
	Private Function FlipperOn() : if gameTime < FlipAt+TimeDelay then FlipperOn = True : End If : End Function        ' Timer shutoff for polaritycorrect

	Public Sub PolarityCorrect(aBall)
		if FlipperOn() then 
			dim tmp, BallPos, x, IDX, Ycoef : Ycoef = 1

			' y safety Exit
			if aBall.VelY > -8 then 'ball going down
				RemoveBall aBall
				exit Sub
			end if

			' Find balldata. BallPos = % on Flipper
			for x = 0 to uBound(Balls)
				if aBall.id = BallData(x).id AND not isempty(BallData(x).id) then 
					idx = x
					BallPos = PSlope(BallData(x).x, FlipperStart, 0, FlipperEnd, 1)
					if ballpos > 0.65 then  Ycoef = LinearEnvelope(BallData(x).Y, YcoefIn, YcoefOut)                                ' find safety coefficient 'ycoef' data
				end if
			Next

			If BallPos = 0 Then ' no ball data meaning the ball is entering and exiting pretty close to the same position, use current values.
				BallPos = PSlope(aBall.x, FlipperStart, 0, FlipperEnd, 1)
				if ballpos > 0.65 then  Ycoef = LinearEnvelope(aBall.Y, YcoefIn, YcoefOut)                                                ' find safety coefficient 'ycoef' data
			End If

			' Velocity correction
			if not IsEmpty(VelocityIn(0) ) then
				Dim VelCoef
				VelCoef = LinearEnvelope(BallPos, VelocityIn, VelocityOut)

				if partialflipcoef < 1 then VelCoef = PSlope(partialflipcoef, 0, 1, 1, VelCoef)

				if Enabled then aBall.Velx = aBall.Velx*VelCoef
				if Enabled then aBall.Vely = aBall.Vely*VelCoef
			End If

			' Polarity Correction (optional now)
			if not IsEmpty(PolarityIn(0) ) then
				dim AddX : AddX = LinearEnvelope(BallPos, PolarityIn, PolarityOut) * LR

				if Enabled then aBall.VelX = aBall.VelX + 1 * (AddX*ycoef*PartialFlipcoef)
			End If
			if DebugOn then debug.print "PolarityCorrect" & " " & Name & " @ " & gametime & " " & Round(BallPos*100) & "%" & " AddX:" & Round(AddX,2) & " Vel%:" & Round(VelCoef*100)
		End If
		RemoveBall aBall
	End Sub
End Class

'******************************************************
'  FLIPPER POLARITY AND RUBBER DAMPENER SUPPORTING FUNCTIONS 
'******************************************************

' Used for flipper correction and rubber dampeners
Sub ShuffleArray(ByRef aArray, byVal offset) 'shuffle 1d array
	dim x, aCount : aCount = 0
	redim a(uBound(aArray) )
	for x = 0 to uBound(aArray)        'Shuffle objects in a temp array
		if not IsEmpty(aArray(x) ) Then
			if IsObject(aArray(x)) then 
				Set a(aCount) = aArray(x)
			Else
				a(aCount) = aArray(x)
			End If
			aCount = aCount + 1
		End If
	Next
	if offset < 0 then offset = 0
	redim aArray(aCount-1+offset)        'Resize original array
	for x = 0 to aCount-1                'set objects back into original array
		if IsObject(a(x)) then 
			Set aArray(x) = a(x)
		Else
			aArray(x) = a(x)
		End If
	Next
End Sub

' Used for flipper correction and rubber dampeners
Sub ShuffleArrays(aArray1, aArray2, offset)
	ShuffleArray aArray1, offset
	ShuffleArray aArray2, offset
End Sub

' Used for flipper correction, rubber dampeners, and drop targets
Function BallSpeed(ball) 'Calculates the ball speed
	BallSpeed = SQR(ball.VelX^2 + ball.VelY^2 + ball.VelZ^2)
End Function

' Used for flipper correction and rubber dampeners
Function PSlope(Input, X1, Y1, X2, Y2)        'Set up line via two points, no clamping. Input X, output Y
	dim x, y, b, m : x = input : m = (Y2 - Y1) / (X2 - X1) : b = Y2 - m*X2
	Y = M*x+b
	PSlope = Y
End Function

' Used for flipper correction
Class spoofball 
	Public X, Y, Z, VelX, VelY, VelZ, ID, Mass, Radius 
	Public Property Let Data(aBall)
		With aBall
			x = .x : y = .y : z = .z : velx = .velx : vely = .vely : velz = .velz
			id = .ID : mass = .mass : radius = .radius
		end with
	End Property
	Public Sub Reset()
		x = Empty : y = Empty : z = Empty  : velx = Empty : vely = Empty : velz = Empty 
		id = Empty : mass = Empty : radius = Empty
	End Sub
End Class

' Used for flipper correction and rubber dampeners
Function LinearEnvelope(xInput, xKeyFrame, yLvl)
	dim y 'Y output
	dim L 'Line
	dim ii : for ii = 1 to uBound(xKeyFrame)        'find active line
		if xInput <= xKeyFrame(ii) then L = ii : exit for : end if
	Next
	if xInput > xKeyFrame(uBound(xKeyFrame) ) then L = uBound(xKeyFrame)        'catch line overrun
	Y = pSlope(xInput, xKeyFrame(L-1), yLvl(L-1), xKeyFrame(L), yLvl(L) )

	if xInput <= xKeyFrame(lBound(xKeyFrame) ) then Y = yLvl(lBound(xKeyFrame) )         'Clamp lower
	if xInput >= xKeyFrame(uBound(xKeyFrame) ) then Y = yLvl(uBound(xKeyFrame) )        'Clamp upper

	LinearEnvelope = Y
End Function


'******************************************************
'  FLIPPER TRICKS 
'******************************************************

RightFlipper.timerinterval=1
Rightflipper.timerenabled=True

sub RightFlipper_timer()
	FlipperTricks LeftFlipper, LFPress, LFCount, LFEndAngle, LFState
	FlipperTricks RightFlipper, RFPress, RFCount, RFEndAngle, RFState
	FlipperNudge RightFlipper, RFEndAngle, RFEOSNudge, LeftFlipper, LFEndAngle
	FlipperNudge LeftFlipper, LFEndAngle, LFEOSNudge,  RightFlipper, RFEndAngle
end sub

Dim LFEOSNudge, RFEOSNudge

Sub FlipperNudge(Flipper1, Endangle1, EOSNudge1, Flipper2, EndAngle2)
        Dim BOT, b

        If Flipper1.currentangle = Endangle1 and EOSNudge1 <> 1 Then
                EOSNudge1 = 1
                'debug.print Flipper1.currentangle &" = "& Endangle1 &"--"& Flipper2.currentangle &" = "& EndAngle2
                If Flipper2.currentangle = EndAngle2 Then 
                        BOT = GetBalls
                        For b = 0 to Ubound(BOT)
                                If FlipperTrigger(BOT(b).x, BOT(b).y, Flipper1) Then
                                        'Debug.Print "ball in flip1. exit"
                                         exit Sub
                                end If
                        Next
                        For b = 0 to Ubound(BOT)
                                If FlipperTrigger(BOT(b).x, BOT(b).y, Flipper2) Then
                                        BOT(b).velx = BOT(b).velx / 1.3
                                        BOT(b).vely = BOT(b).vely - 0.5
                                end If
                        Next
                End If
        Else 
			If Abs(Flipper1.currentangle) > Abs(EndAngle1) + 30 then 
				EOSNudge1 = 0
			end if
        End If
End Sub

'*****************
' Maths
'*****************
Dim PI: PI = 4*Atn(1)

Function dSin(degrees)
	dsin = sin(degrees * Pi/180)
End Function

Function dCos(degrees)
	dcos = cos(degrees * Pi/180)
End Function

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

'*************************************************
'  Check ball distance from Flipper for Rem
'*************************************************

Function Distance(ax,ay,bx,by)
	Distance = SQR((ax - bx)^2 + (ay - by)^2)
End Function

Function DistancePL(px,py,ax,ay,bx,by) ' Distance between a point and a line where point is px,py
	DistancePL = ABS((by - ay)*px - (bx - ax) * py + bx*ay - by*ax)/Distance(ax,ay,bx,by)
End Function

Function Radians(Degrees)
	Radians = Degrees * PI /180
End Function

Function AnglePP(ax,ay,bx,by)
	AnglePP = Atn2((by - ay),(bx - ax))*180/PI
End Function

Function DistanceFromFlipper(ballx, bally, Flipper)
	DistanceFromFlipper = DistancePL(ballx, bally, Flipper.x, Flipper.y, Cos(Radians(Flipper.currentangle+90))+Flipper.x, Sin(Radians(Flipper.currentangle+90))+Flipper.y)
End Function

Function FlipperTrigger(ballx, bally, Flipper)
	Dim DiffAngle
	DiffAngle  = ABS(Flipper.currentangle - AnglePP(Flipper.x, Flipper.y, ballx, bally) - 90)
	If DiffAngle > 180 Then DiffAngle = DiffAngle - 360

	If DistanceFromFlipper(ballx,bally,Flipper) < 48 and DiffAngle <= 90 and Distance(ballx,bally,Flipper.x,Flipper.y) < Flipper.Length Then
		FlipperTrigger = True
	Else
		FlipperTrigger = False
	End If        
End Function


'*************************************************
'  End - Check ball distance from Flipper for Rem
'*************************************************

dim LFPress, RFPress, LFCount, RFCount
dim LFState, RFState
dim EOST, EOSA,Frampup, FElasticity,FReturn
dim RFEndAngle, LFEndAngle

EOST = leftflipper.eostorque
EOSA = leftflipper.eostorqueangle
Frampup = LeftFlipper.rampup
FElasticity = LeftFlipper.elasticity
FReturn = LeftFlipper.return
'Const EOSTnew = 1 'EM's to late 80's
Const EOSTnew = 0.8 '90's and later
Const EOSAnew = 1
Const EOSRampup = 0
Dim SOSRampup

Const FlipperCoilRampupMode = 0   	'0 = fast, 1 = medium, 2 = slow (tap passes should work)

Select Case FlipperCoilRampupMode 
	Case 0:
		SOSRampup = 2.5
	Case 1:
		SOSRampup = 6
	Case 2:
		SOSRampup = 8.5
End Select

Const LiveCatch = 16
Const LiveElasticity = 0.45
Const SOSEM = 0.815
'Const EOSReturn = 0.055  'EM's
'Const EOSReturn = 0.045  'late 70's to mid 80's
Const EOSReturn = 0.035  'mid 80's to early 90's
'Const EOSReturn = 0.025  'mid 90's and later

LFEndAngle = Leftflipper.endangle
RFEndAngle = RightFlipper.endangle

Sub FlipperActivate(Flipper, FlipperPress)
	FlipperPress = 1
	Flipper.Elasticity = FElasticity

	Flipper.eostorque = EOST         
	Flipper.eostorqueangle = EOSA         
End Sub

Sub FlipperDeactivate(Flipper, FlipperPress)
	FlipperPress = 0
	Flipper.eostorqueangle = EOSA
	Flipper.eostorque = EOST*EOSReturn/FReturn


	If Abs(Flipper.currentangle) <= Abs(Flipper.endangle) + 0.1 Then
		Dim b, BOT
		BOT = GetBalls

		For b = 0 to UBound(BOT)
			If Distance(BOT(b).x, BOT(b).y, Flipper.x, Flipper.y) < 55 Then 'check for cradle
				If BOT(b).vely >= -0.4 Then BOT(b).vely = -0.4
			End If
		Next
	End If
End Sub

Sub FlipperTricks (Flipper, FlipperPress, FCount, FEndAngle, FState) 
	Dim Dir
	Dir = Flipper.startangle/Abs(Flipper.startangle)        '-1 for Right Flipper

	If Abs(Flipper.currentangle) > Abs(Flipper.startangle) - 0.05 Then
		If FState <> 1 Then
			Flipper.rampup = SOSRampup 
			Flipper.endangle = FEndAngle - 3*Dir
			Flipper.Elasticity = FElasticity * SOSEM
			FCount = 0 
			FState = 1
		End If
	ElseIf Abs(Flipper.currentangle) <= Abs(Flipper.endangle) and FlipperPress = 1 then
		if FCount = 0 Then FCount = GameTime

		If FState <> 2 Then
			Flipper.eostorqueangle = EOSAnew
			Flipper.eostorque = EOSTnew
			Flipper.rampup = EOSRampup                        
			Flipper.endangle = FEndAngle
			FState = 2
		End If
	Elseif Abs(Flipper.currentangle) > Abs(Flipper.endangle) + 0.01 and FlipperPress = 1 Then 
		If FState <> 3 Then
			Flipper.eostorque = EOST        
			Flipper.eostorqueangle = EOSA
			Flipper.rampup = Frampup
			Flipper.Elasticity = FElasticity
			FState = 3
		End If

	End If
End Sub

Const LiveDistanceMin = 30  'minimum distance in vp units from flipper base live catch dampening will occur
Const LiveDistanceMax = 114  'maximum distance in vp units from flipper base live catch dampening will occur (tip protection)

Sub CheckLiveCatch(ball, Flipper, FCount, parm) 'Experimental new live catch
    Dim Dir
    Dir = Flipper.startangle/Abs(Flipper.startangle)    '-1 for Right Flipper
    Dim LiveCatchBounce                                                                                                                        'If live catch is not perfect, it won't freeze ball totally
    Dim CatchTime : CatchTime = GameTime - FCount

    if CatchTime <= LiveCatch and parm > 6 and ABS(Flipper.x - ball.x) > LiveDistanceMin and ABS(Flipper.x - ball.x) < LiveDistanceMax Then
            if CatchTime <= LiveCatch*0.5 Then                                                'Perfect catch only when catch time happens in the beginning of the window
                    LiveCatchBounce = 0
            else
                    LiveCatchBounce = Abs((LiveCatch/2) - CatchTime)        'Partial catch when catch happens a bit late
            end If

            If LiveCatchBounce = 0 and ball.velx * Dir > 0 Then ball.velx = 0
            ball.vely = LiveCatchBounce * (32 / LiveCatch) ' Multiplier for inaccuracy bounce
            ball.angmomx= 0
            ball.angmomy= 0
            ball.angmomz= 0
    Else
        If Abs(Flipper.currentangle) <= Abs(Flipper.endangle) + 1 Then FlippersD.Dampenf Activeball, parm
    End If
End Sub


'******************************************************
'****  END FLIPPER CORRECTIONS
'******************************************************

'******************************************************
'****  PHYSICS DAMPENERS
'******************************************************
'
' These are data mined bounce curves, 
' dialed in with the in-game elasticity as much as possible to prevent angle / spin issues.
' Requires tracking ballspeed to calculate COR

Sub dPosts_Hit(idx) 
	RubbersD.dampen Activeball
	TargetBouncer Activeball, 1
End Sub

Sub dSleeves_Hit(idx) 
	SleevesD.Dampen Activeball
	TargetBouncer Activeball, 0.7
End Sub


dim RubbersD : Set RubbersD = new Dampener        'frubber
RubbersD.name = "Rubbers"
RubbersD.debugOn = False        'shows info in textbox "TBPout"
RubbersD.Print = False        'debug, reports in debugger (in vel, out cor)
'cor bounce curve (linear)
'for best results, try to match in-game velocity as closely as possible to the desired curve
'RubbersD.addpoint 0, 0, 0.935        'point# (keep sequential), ballspeed, CoR (elasticity)
RubbersD.addpoint 0, 0, 0.96        'point# (keep sequential), ballspeed, CoR (elasticity)
RubbersD.addpoint 1, 3.77, 0.96
RubbersD.addpoint 2, 5.76, 0.967        'dont take this as gospel. if you can data mine rubber elasticitiy, please help!
RubbersD.addpoint 3, 15.84, 0.874
RubbersD.addpoint 4, 56, 0.64        'there's clamping so interpolate up to 56 at least

dim SleevesD : Set SleevesD = new Dampener        'this is just rubber but cut down to 85%...
SleevesD.name = "Sleeves"
SleevesD.debugOn = False        'shows info in textbox "TBPout"
SleevesD.Print = False        'debug, reports in debugger (in vel, out cor)
SleevesD.CopyCoef RubbersD, 0.85

dim FlippersD : Set FlippersD = new Dampener
FlippersD.name = "Flippers"
FlippersD.debugOn = False
FlippersD.Print = False	
FlippersD.addpoint 0, 0, 1.1	
FlippersD.addpoint 1, 3.77, 0.99
FlippersD.addpoint 2, 6, 0.99

Class Dampener
	Public Print, debugOn 'tbpOut.text
	public name, Threshold 	'Minimum threshold. Useful for Flippers, which don't have a hit threshold.
	Public ModIn, ModOut
	Private Sub Class_Initialize : redim ModIn(0) : redim Modout(0): End Sub 

	Public Sub AddPoint(aIdx, aX, aY) 
		ShuffleArrays ModIn, ModOut, 1 : ModIn(aIDX) = aX : ModOut(aIDX) = aY : ShuffleArrays ModIn, ModOut, 0
		if gametime > 100 then Report
	End Sub

	public sub Dampen(aBall)
		if threshold then if BallSpeed(aBall) < threshold then exit sub end if end if
		dim RealCOR, DesiredCOR, str, coef
		DesiredCor = LinearEnvelope(cor.ballvel(aBall.id), ModIn, ModOut )
		RealCOR = BallSpeed(aBall) / cor.ballvel(aBall.id)
		coef = desiredcor / realcor 
		if debugOn then str = name & " in vel:" & round(cor.ballvel(aBall.id),2 ) & vbnewline & "desired cor: " & round(desiredcor,4) & vbnewline & _
		"actual cor: " & round(realCOR,4) & vbnewline & "ballspeed coef: " & round(coef, 3) & vbnewline 
		if Print then debug.print Round(cor.ballvel(aBall.id),2) & ", " & round(desiredcor,3)
		
		aBall.velx = aBall.velx * coef : aBall.vely = aBall.vely * coef
		if debugOn then TBPout.text = str
	End Sub

	public sub Dampenf(aBall, parm) 'Rubberizer is handle here
		dim RealCOR, DesiredCOR, str, coef
		DesiredCor = LinearEnvelope(cor.ballvel(aBall.id), ModIn, ModOut )
		RealCOR = BallSpeed(aBall) / (cor.ballvel(aBall.id)+0.0001)
		coef = desiredcor / realcor 
		If abs(aball.velx) < 2 and aball.vely < 0 and aball.vely > -3.75 then 
			aBall.velx = aBall.velx * coef : aBall.vely = aBall.vely * coef
		End If
	End Sub

	Public Sub CopyCoef(aObj, aCoef) 'alternative addpoints, copy with coef
		dim x : for x = 0 to uBound(aObj.ModIn)
			addpoint x, aObj.ModIn(x), aObj.ModOut(x)*aCoef
		Next
	End Sub


	Public Sub Report() 	'debug, reports all coords in tbPL.text
		if not debugOn then exit sub
		dim a1, a2 : a1 = ModIn : a2 = ModOut
		dim str, x : for x = 0 to uBound(a1) : str = str & x & ": " & round(a1(x),4) & ", " & round(a2(x),4) & vbnewline : next
		TBPout.text = str
	End Sub

End Class



'******************************************************
'  TRACK ALL BALL VELOCITIES
'  FOR RUBBER DAMPENER AND DROP TARGETS
'******************************************************

dim cor : set cor = New CoRTracker

Class CoRTracker
    public ballvel, ballvelx, ballvely, ballvelz, ballangmomx, ballangmomy, ballangmomz

    Private Sub Class_Initialize : redim ballvel(0) : redim ballvelx(0): redim ballvely(0) : redim ballvelz(0) : redim ballangmomx(0) : redim ballangmomy(0): redim ballangmomz(0): End Sub 

    Public Sub Update()    'tracks in-ball-velocity
        dim str, b, AllBalls, highestID : allBalls = getballs


        for each b in allballs
            if b.id >= HighestID then highestID = b.id
        Next

        if uBound(ballvel) < highestID then redim ballvel(highestID)    'set bounds
        if uBound(ballvelx) < highestID then redim ballvelx(highestID)    'set bounds
        if uBound(ballvely) < highestID then redim ballvely(highestID)    'set bounds
        if uBound(ballvelz) < highestID then redim ballvelz(highestID)    'set bounds
        if uBound(ballangmomx) < highestID then redim ballangmomx(highestID)    'set bounds
        if uBound(ballangmomy) < highestID then redim ballangmomy(highestID)    'set bounds
        if uBound(ballangmomz) < highestID then redim ballangmomz(highestID)    'set bounds

        for each b in allballs
            ballvel(b.id) = BallSpeed(b)
            ballvelx(b.id) = b.velx
            ballvely(b.id) = b.vely
            ballvelz(b.id) = b.velz
            ballangmomx(b.id) = b.angmomx
            ballangmomy(b.id) = b.angmomy
            ballangmomz(b.id) = b.angmomz
        Next
    End Sub
End Class



'******************************************************
'****  END PHYSICS DAMPENERS
'******************************************************

'******************************************************
'****  FLEEP MECHANICAL SOUNDS
'******************************************************

' This part in the script is an entire block that is dedicated to the physics sound system.
' Various scripts and sounds that may be pretty generic and could suit other WPC systems, but the most are tailored specifically for the TOM table

' Many of the sounds in this package can be added by creating collections and adding the appropriate objects to those collections.  
' Create the following new collections:
' 	Metals (all metal objects, metal walls, metal posts, metal wire guides)
' 	Apron (the apron walls and plunger wall)
' 	Walls (all wood or plastic walls)
' 	Rollovers (wire rollover triggers, star triggers, or button triggers)
' 	Targets (standup or drop targets, these are hit sounds only ... you will want to add separate dropping sounds for drop targets)
' 	Gates (plate gates)
' 	GatesWire (wire gates)
' 	Rubbers (all rubbers including posts, sleeves, pegs, and bands)
' When creating the collections, make sure "Fire events for this collection" is checked.  
' You'll also need to make sure "Has Hit Event" is checked for each object placed in these collections (not necessary for gates and triggers).  
' Once the collections and objects are added, the save, close, and restart VPX.
'
' Tutorial vides by Apophis
' Part 1: 	https://youtu.be/PbE2kNiam3g
' Part 2: 	https://youtu.be/B5cm1Y8wQsk
' Part 3: 	https://youtu.be/eLhWyuYOyGg

Dim BIPL : BIPL = False				'Ball in plunger lane

'///////////////////////////////  SOUNDS PARAMETERS  //////////////////////////////
Dim GlobalSoundLevel, CoinSoundLevel, PlungerReleaseSoundLevel, PlungerPullSoundLevel, NudgeLeftSoundLevel
Dim NudgeRightSoundLevel, NudgeCenterSoundLevel, StartButtonSoundLevel, RollingSoundFactor

CoinSoundLevel = 1														'volume level; range [0, 1]
NudgeLeftSoundLevel = 1													'volume level; range [0, 1]
NudgeRightSoundLevel = 1												'volume level; range [0, 1]
NudgeCenterSoundLevel = 1												'volume level; range [0, 1]
StartButtonSoundLevel = 0.1												'volume level; range [0, 1]
PlungerReleaseSoundLevel = 0.8 '1 wjr											'volume level; range [0, 1]
PlungerPullSoundLevel = 1												'volume level; range [0, 1]
RollingSoundFactor = 1.1/5		

'///////////////////////-----Solenoids, Kickers and Flash Relays-----///////////////////////
Dim FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel, FlipperUpAttackLeftSoundLevel, FlipperUpAttackRightSoundLevel
Dim FlipperUpSoundLevel, FlipperDownSoundLevel, FlipperLeftHitParm, FlipperRightHitParm
Dim SlingshotSoundLevel, BumperSoundFactor, KnockerSoundLevel

FlipperUpAttackMinimumSoundLevel = 0.010           						'volume level; range [0, 1]
FlipperUpAttackMaximumSoundLevel = 0.635								'volume level; range [0, 1]
FlipperUpSoundLevel = 1.0                        						'volume level; range [0, 1]
FlipperDownSoundLevel = 0.45                      						'volume level; range [0, 1]
FlipperLeftHitParm = FlipperUpSoundLevel								'sound helper; not configurable
FlipperRightHitParm = FlipperUpSoundLevel								'sound helper; not configurable
SlingshotSoundLevel = 0.95												'volume level; range [0, 1]
BumperSoundFactor = 4.25												'volume multiplier; must not be zero
KnockerSoundLevel = 1 													'volume level; range [0, 1]

'///////////////////////-----Ball Drops, Bumps and Collisions-----///////////////////////
Dim RubberStrongSoundFactor, RubberWeakSoundFactor, RubberFlipperSoundFactor,BallWithBallCollisionSoundFactor
Dim BallBouncePlayfieldSoftFactor, BallBouncePlayfieldHardFactor, PlasticRampDropToPlayfieldSoundLevel, WireRampDropToPlayfieldSoundLevel, DelayedBallDropOnPlayfieldSoundLevel
Dim WallImpactSoundFactor, MetalImpactSoundFactor, SubwaySoundLevel, SubwayEntrySoundLevel, ScoopEntrySoundLevel
Dim SaucerLockSoundLevel, SaucerKickSoundLevel

BallWithBallCollisionSoundFactor = 3.2									'volume multiplier; must not be zero
RubberStrongSoundFactor = 0.055/5											'volume multiplier; must not be zero
RubberWeakSoundFactor = 0.075/5											'volume multiplier; must not be zero
RubberFlipperSoundFactor = 0.075/5										'volume multiplier; must not be zero
BallBouncePlayfieldSoftFactor = 0.025									'volume multiplier; must not be zero
BallBouncePlayfieldHardFactor = 0.025									'volume multiplier; must not be zero
DelayedBallDropOnPlayfieldSoundLevel = 0.8									'volume level; range [0, 1]
WallImpactSoundFactor = 0.075											'volume multiplier; must not be zero
MetalImpactSoundFactor = 0.075/3
SaucerLockSoundLevel = 0.8
SaucerKickSoundLevel = 0.8

'///////////////////////-----Gates, Spinners, Rollovers and Targets-----///////////////////////

Dim GateSoundLevel, TargetSoundFactor, SpinnerSoundLevel, RolloverSoundLevel, DTSoundLevel

GateSoundLevel = 0.5/5													'volume level; range [0, 1]
TargetSoundFactor = 0.0025 * 10											'volume multiplier; must not be zero
DTSoundLevel = 0.25														'volume multiplier; must not be zero
RolloverSoundLevel = 0.25                              					'volume level; range [0, 1]
SpinnerSoundLevel = 0.5                              					'volume level; range [0, 1]

'///////////////////////-----Ball Release, Guides and Drain-----///////////////////////
Dim DrainSoundLevel, BallReleaseSoundLevel, BottomArchBallGuideSoundFactor, FlipperBallGuideSoundFactor 

DrainSoundLevel = 0.8														'volume level; range [0, 1]
BallReleaseSoundLevel = 1												'volume level; range [0, 1]
BottomArchBallGuideSoundFactor = 0.2									'volume multiplier; must not be zero
FlipperBallGuideSoundFactor = 0.015										'volume multiplier; must not be zero

'///////////////////////-----Loops and Lanes-----///////////////////////
Dim ArchSoundFactor
ArchSoundFactor = 0.025/5													'volume multiplier; must not be zero


'/////////////////////////////  SOUND PLAYBACK FUNCTIONS  ////////////////////////////
'/////////////////////////////  POSITIONAL SOUND PLAYBACK METHODS  ////////////////////////////
' Positional sound playback methods will play a sound, depending on the X,Y position of the table element or depending on ActiveBall object position
' These are similar subroutines that are less complicated to use (e.g. simply use standard parameters for the PlaySound call)
' For surround setup - positional sound playback functions will fade between front and rear surround channels and pan between left and right channels
' For stereo setup - positional sound playback functions will only pan between left and right channels
' For mono setup - positional sound playback functions will not pan between left and right channels and will not fade between front and rear channels

' PlaySound full syntax - PlaySound(string, int loopcount, float volume, float pan, float randompitch, int pitch, bool useexisting, bool restart, float front_rear_fade)
' Note - These functions will not work (currently) for walls/slingshots as these do not feature a simple, single X,Y position
Sub PlaySoundAtLevelStatic(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(tableobj), 0, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelExistingStatic(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(tableobj), 0, 0, 1, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelStaticLoop(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, -1, aVol * VolumeDial, AudioPan(tableobj), 0, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelStaticRandomPitch(playsoundparams, aVol, randomPitch, tableobj)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(tableobj), randomPitch, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelActiveBall(playsoundparams, aVol)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(ActiveBall), 0, 0, 0, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtLevelExistingActiveBall(playsoundparams, aVol)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(ActiveBall), 0, 0, 1, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtLeveTimerActiveBall(playsoundparams, aVol, ballvariable)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(ballvariable), 0, 0, 0, 0, AudioFade(ballvariable)
End Sub

Sub PlaySoundAtLevelTimerExistingActiveBall(playsoundparams, aVol, ballvariable)
	PlaySound playsoundparams, 0, aVol * VolumeDial, AudioPan(ballvariable), 0, 0, 1, 0, AudioFade(ballvariable)
End Sub

Sub PlaySoundAtLevelRoll(playsoundparams, aVol, pitch)
	PlaySound playsoundparams, -1, aVol * VolumeDial, AudioPan(tableobj), randomPitch, 0, 0, 0, AudioFade(tableobj)
End Sub

' Previous Positional Sound Subs

Sub PlaySoundAt(soundname, tableobj)
	PlaySound soundname, 1, 1 * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub

Sub PlaySoundAtVol(soundname, tableobj, aVol)
	PlaySound soundname, 1, aVol * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub

Sub PlaySoundAtBall(soundname)
	PlaySoundAt soundname, ActiveBall
End Sub

Sub PlaySoundAtBallVol (Soundname, aVol)
	Playsound soundname, 1,aVol * VolumeDial, AudioPan(ActiveBall), 0,0,0, 1, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtBallVolM (Soundname, aVol)
	Playsound soundname, 1,aVol * VolumeDial, AudioPan(ActiveBall), 0,0,0, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtVolLoops(sound, tableobj, Vol, Loops)
	PlaySound sound, Loops, Vol * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub


'******************************************************
'  Fleep  Supporting Ball & Sound Functions
'******************************************************

Function AudioFade(tableobj) ' Fades between front and back of the table (for surround systems or 2x2 speakers, etc), depending on the Y position on the table. "table1" is the name of the table
  Dim tmp
    tmp = tableobj.y * 2 / tableheight-1

	if tmp > 7000 Then
		tmp = 7000
	elseif tmp < -7000 Then
		tmp = -7000
	end if

    If tmp > 0 Then
		AudioFade = Csng(tmp ^10)
    Else
        AudioFade = Csng(-((- tmp) ^10) )
    End If
End Function

Function AudioPan(tableobj) ' Calculates the pan for a tableobj based on the X position on the table. "table1" is the name of the table
    Dim tmp
    tmp = tableobj.x * 2 / tablewidth-1

	if tmp > 7000 Then
		tmp = 7000
	elseif tmp < -7000 Then
		tmp = -7000
	end if

    If tmp > 0 Then
        AudioPan = Csng(tmp ^10)
    Else
        AudioPan = Csng(-((- tmp) ^10) )
    End If
End Function

Function Vol(ball) ' Calculates the volume of the sound based on the ball speed
	Vol = Csng(BallVel(ball) ^2)
End Function

Function Volz(ball) ' Calculates the volume of the sound based on the ball speed
	Volz = Csng((ball.velz) ^2)
End Function

Function Pitch(ball) ' Calculates the pitch of the sound based on the ball speed
	Pitch = BallVel(ball) * 20
End Function

Function BallVel(ball) 'Calculates the ball speed
	BallVel = INT(SQR((ball.VelX ^2) + (ball.VelY ^2) ) )
End Function

Function VolPlayfieldRoll(ball) ' Calculates the roll volume of the sound based on the ball speed
	VolPlayfieldRoll = RollingSoundFactor * 0.0005 * Csng(BallVel(ball) ^3)
End Function

Function PitchPlayfieldRoll(ball) ' Calculates the roll pitch of the sound based on the ball speed
	PitchPlayfieldRoll = BallVel(ball) ^2 * 15
End Function

Function RndInt(min, max)
	RndInt = Int(Rnd() * (max-min + 1) + min)' Sets a random number integer between min and max
End Function

Function RndNum(min, max)
	RndNum = Rnd() * (max-min) + min' Sets a random number between min and max
End Function

'/////////////////////////////  GENERAL SOUND SUBROUTINES  ////////////////////////////
Sub SoundStartButton()
	PlaySound ("Start_Button"), 0, StartButtonSoundLevel, 0, 0.25
End Sub

Sub SoundNudgeLeft()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeLeftSoundLevel * VolumeDial, -0.1, 0.25
End Sub

Sub SoundNudgeRight()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeRightSoundLevel * VolumeDial, 0.1, 0.25
End Sub

Sub SoundNudgeCenter()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeCenterSoundLevel * VolumeDial, 0, 0.25
End Sub


Sub SoundPlungerPull()
	PlaySoundAtLevelStatic ("Plunger_Pull_1"), PlungerPullSoundLevel, Plunger
End Sub

Sub SoundPlungerReleaseBall()
	PlaySoundAtLevelStatic ("Plunger_Release_Ball"), PlungerReleaseSoundLevel, Plunger	
End Sub

Sub SoundPlungerReleaseNoBall()
	PlaySoundAtLevelStatic ("Plunger_Release_No_Ball"), PlungerReleaseSoundLevel, Plunger
End Sub


'/////////////////////////////  KNOCKER SOLENOID  ////////////////////////////
Sub KnockerSolenoid()
	PlaySoundAtLevelStatic SoundFX("Knocker_1",DOFKnocker), KnockerSoundLevel, KnockerPosition
End Sub

'/////////////////////////////  DRAIN SOUNDS  ////////////////////////////
Sub RandomSoundDrain(drainswitch)
	PlaySoundAtLevelStatic ("Drain_" & Int(Rnd*11)+1), DrainSoundLevel, drainswitch
End Sub

'/////////////////////////////  TROUGH BALL RELEASE SOLENOID SOUNDS  ////////////////////////////

Sub RandomSoundBallRelease(drainswitch)
	PlaySoundAtLevelStatic SoundFX("BallRelease" & Int(Rnd*7)+1,DOFContactors), BallReleaseSoundLevel, drainswitch
End Sub

'/////////////////////////////  SLINGSHOT SOLENOID SOUNDS  ////////////////////////////
Sub RandomSoundSlingshotLeft(sling)
	PlaySoundAtLevelStatic SoundFX("Sling_L" & Int(Rnd*10)+1,DOFContactors), SlingshotSoundLevel, Sling
End Sub

Sub RandomSoundSlingshotRight(sling)
	PlaySoundAtLevelStatic SoundFX("Sling_R" & Int(Rnd*8)+1,DOFContactors), SlingshotSoundLevel, Sling
End Sub

'/////////////////////////////  BUMPER SOLENOID SOUNDS  ////////////////////////////
Sub RandomSoundBumperTop(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Top_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

Sub RandomSoundBumperMiddle(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Middle_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

Sub RandomSoundBumperBottom(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Bottom_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

'/////////////////////////////  SPINNER SOUNDS  ////////////////////////////
Sub SoundSpinner(spinnerswitch)
	PlaySoundAtLevelStatic ("Spinner"), SpinnerSoundLevel, spinnerswitch
End Sub


'/////////////////////////////  FLIPPER BATS SOUND SUBROUTINES  ////////////////////////////
'/////////////////////////////  FLIPPER BATS SOLENOID ATTACK SOUND  ////////////////////////////
Sub SoundFlipperUpAttackLeft(flipper)
	FlipperUpAttackLeftSoundLevel = RndNum(FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel)
	PlaySoundAtLevelStatic ("Flipper_Attack-L01"), FlipperUpAttackLeftSoundLevel, flipper
End Sub

Sub SoundFlipperUpAttackRight(flipper)
	FlipperUpAttackRightSoundLevel = RndNum(FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel)
	PlaySoundAtLevelStatic ("Flipper_Attack-R01"), FlipperUpAttackLeftSoundLevel, flipper
End Sub

'/////////////////////////////  FLIPPER BATS SOLENOID CORE SOUND  ////////////////////////////
Sub RandomSoundFlipperUpLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_L0" & Int(Rnd*9)+1,DOFFlippers), FlipperLeftHitParm, Flipper
End Sub

Sub RandomSoundFlipperUpRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_R0" & Int(Rnd*9)+1,DOFFlippers), FlipperRightHitParm, Flipper
End Sub

Sub RandomSoundReflipUpLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_ReFlip_L0" & Int(Rnd*3)+1,DOFFlippers), (RndNum(0.8, 1))*FlipperUpSoundLevel, Flipper
End Sub

Sub RandomSoundReflipUpRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_ReFlip_R0" & Int(Rnd*3)+1,DOFFlippers), (RndNum(0.8, 1))*FlipperUpSoundLevel, Flipper
End Sub

Sub RandomSoundFlipperDownLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_Left_Down_" & Int(Rnd*7)+1,DOFFlippers), FlipperDownSoundLevel, Flipper
End Sub

Sub RandomSoundFlipperDownRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_Right_Down_" & Int(Rnd*8)+1,DOFFlippers), FlipperDownSoundLevel, Flipper
End Sub

'/////////////////////////////  FLIPPER BATS BALL COLLIDE SOUND  ////////////////////////////

Sub LeftFlipperCollide(parm)
	FlipperLeftHitParm = parm/10
	If FlipperLeftHitParm > 1 Then
		FlipperLeftHitParm = 1
	End If
	FlipperLeftHitParm = FlipperUpSoundLevel * FlipperLeftHitParm
	RandomSoundRubberFlipper(parm)
End Sub

Sub RightFlipperCollide(parm)
	FlipperRightHitParm = parm/10
	If FlipperRightHitParm > 1 Then
		FlipperRightHitParm = 1
	End If
	FlipperRightHitParm = FlipperUpSoundLevel * FlipperRightHitParm
	RandomSoundRubberFlipper(parm)
End Sub

Sub RandomSoundRubberFlipper(parm)
	PlaySoundAtLevelActiveBall ("Flipper_Rubber_" & Int(Rnd*7)+1), parm  * RubberFlipperSoundFactor
End Sub

'/////////////////////////////  ROLLOVER SOUNDS  ////////////////////////////
Sub RandomSoundRollover()
	PlaySoundAtLevelActiveBall ("Rollover_" & Int(Rnd*4)+1), RolloverSoundLevel
End Sub

Sub Rollovers_Hit(idx)
	RandomSoundRollover
End Sub

'/////////////////////////////  VARIOUS PLAYFIELD SOUND SUBROUTINES  ////////////////////////////
'/////////////////////////////  RUBBERS AND POSTS  ////////////////////////////
'/////////////////////////////  RUBBERS - EVENTS  ////////////////////////////
Sub Rubbers_Hit(idx)
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 5 then		
		RandomSoundRubberStrong 1
	End if
	If finalspeed <= 5 then
		RandomSoundRubberWeak()
	End If	
End Sub

'/////////////////////////////  RUBBERS AND POSTS - STRONG IMPACTS  ////////////////////////////
Sub RandomSoundRubberStrong(voladj)
	Select Case Int(Rnd*10)+1
		Case 1 : PlaySoundAtLevelActiveBall ("Rubber_Strong_1"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 2 : PlaySoundAtLevelActiveBall ("Rubber_Strong_2"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 3 : PlaySoundAtLevelActiveBall ("Rubber_Strong_3"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 4 : PlaySoundAtLevelActiveBall ("Rubber_Strong_4"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 5 : PlaySoundAtLevelActiveBall ("Rubber_Strong_5"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 6 : PlaySoundAtLevelActiveBall ("Rubber_Strong_6"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 7 : PlaySoundAtLevelActiveBall ("Rubber_Strong_7"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 8 : PlaySoundAtLevelActiveBall ("Rubber_Strong_8"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 9 : PlaySoundAtLevelActiveBall ("Rubber_Strong_9"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 10 : PlaySoundAtLevelActiveBall ("Rubber_1_Hard"), Vol(ActiveBall) * RubberStrongSoundFactor * 0.6*voladj
	End Select
End Sub

'/////////////////////////////  RUBBERS AND POSTS - WEAK IMPACTS  ////////////////////////////
Sub RandomSoundRubberWeak()
	PlaySoundAtLevelActiveBall ("Rubber_" & Int(Rnd*9)+1), Vol(ActiveBall) * RubberWeakSoundFactor
End Sub

'/////////////////////////////  WALL IMPACTS  ////////////////////////////
Sub Walls_Hit(idx)
	RandomSoundWall()      
End Sub

Sub RandomSoundWall()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		Select Case Int(Rnd*5)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_1"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_2"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_5"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 4 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_7"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 5 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_9"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		Select Case Int(Rnd*4)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_3"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_4"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_6"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 4 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_8"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End If
	If finalspeed < 6 Then
		Select Case Int(Rnd*3)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_4"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_6"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_8"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End if
End Sub

'/////////////////////////////  METAL TOUCH SOUNDS  ////////////////////////////
Sub RandomSoundMetal()
	PlaySoundAtLevelActiveBall ("Metal_Touch_" & Int(Rnd*13)+1), Vol(ActiveBall) * MetalImpactSoundFactor
End Sub

'/////////////////////////////  METAL - EVENTS  ////////////////////////////

Sub Metals_Hit (idx)
	RandomSoundMetal
End Sub

Sub ShooterDiverter_collide(idx)
	RandomSoundMetal
End Sub

'/////////////////////////////  BOTTOM ARCH BALL GUIDE  ////////////////////////////
'/////////////////////////////  BOTTOM ARCH BALL GUIDE - SOFT BOUNCES  ////////////////////////////
Sub RandomSoundBottomArchBallGuide()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		PlaySoundAtLevelActiveBall ("Apron_Bounce_"& Int(Rnd*2)+1), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Bounce_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Bounce_Soft_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
		End Select
	End If
	If finalspeed < 6 Then
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Bounce_Soft_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Medium_3"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
		End Select
	End if
End Sub

'/////////////////////////////  BOTTOM ARCH BALL GUIDE - HARD HITS  ////////////////////////////
Sub RandomSoundBottomArchBallGuideHardHit()
	PlaySoundAtLevelActiveBall ("Apron_Hard_Hit_" & Int(Rnd*3)+1), BottomArchBallGuideSoundFactor * 0.25
End Sub

Sub Apron_Hit (idx)
	If Abs(cor.ballvelx(activeball.id) < 4) and cor.ballvely(activeball.id) > 7 then
		RandomSoundBottomArchBallGuideHardHit()
	Else
		RandomSoundBottomArchBallGuide
	End If
End Sub

'/////////////////////////////  FLIPPER BALL GUIDE  ////////////////////////////
Sub RandomSoundFlipperBallGuide()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Hard_1"),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Hard_2"),  Vol(ActiveBall) * 0.8 * FlipperBallGuideSoundFactor
		End Select
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		PlaySoundAtLevelActiveBall ("Apron_Medium_" & Int(Rnd*3)+1),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
	End If
	If finalspeed < 6 Then
		PlaySoundAtLevelActiveBall ("Apron_Soft_" & Int(Rnd*7)+1),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
	End If
End Sub

'/////////////////////////////  TARGET HIT SOUNDS  ////////////////////////////
Sub RandomSoundTargetHitStrong()
	PlaySoundAtLevelActiveBall SoundFX("Target_Hit_" & Int(Rnd*4)+5,DOFTargets), Vol(ActiveBall) * 0.45 * TargetSoundFactor
End Sub

Sub RandomSoundTargetHitWeak()		
	PlaySoundAtLevelActiveBall SoundFX("Target_Hit_" & Int(Rnd*4)+1,DOFTargets), Vol(ActiveBall) * TargetSoundFactor
End Sub

Sub PlayTargetSound()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 10 then
		RandomSoundTargetHitStrong()
		RandomSoundBallBouncePlayfieldSoft Activeball
	Else 
		RandomSoundTargetHitWeak()
	End If	
End Sub

Sub Targets_Hit (idx)
	PlayTargetSound
	TargetBouncer Activeball, 1
End Sub

'/////////////////////////////  BALL BOUNCE SOUNDS  ////////////////////////////
Sub RandomSoundBallBouncePlayfieldSoft(aBall)
	Select Case Int(Rnd*9)+1
		Case 1 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_1"), volz(aBall) * BallBouncePlayfieldSoftFactor, aBall
		Case 2 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_2"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.5, aBall
		Case 3 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_3"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.8, aBall
		Case 4 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_4"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.5, aBall
		Case 5 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_5"), volz(aBall) * BallBouncePlayfieldSoftFactor, aBall
		Case 6 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_1"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 7 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_2"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 8 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_5"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 9 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_7"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.3, aBall
	End Select
End Sub

Sub RandomSoundBallBouncePlayfieldHard(aBall)
	PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_" & Int(Rnd*7)+1), volz(aBall) * BallBouncePlayfieldHardFactor, aBall
End Sub

'/////////////////////////////  DELAYED DROP - TO PLAYFIELD - SOUND  ////////////////////////////
Sub RandomSoundDelayedBallDropOnPlayfield(aBall)
	Select Case Int(Rnd*5)+1
		Case 1 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_1_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 2 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_2_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 3 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_3_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 4 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_4_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 5 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_5_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
	End Select
End Sub

'/////////////////////////////  BALL GATES AND BRACKET GATES SOUNDS  ////////////////////////////

Sub SoundPlayfieldGate()			
	PlaySoundAtLevelStatic ("Gate_FastTrigger_" & Int(Rnd*2)+1), GateSoundLevel, Activeball
End Sub

Sub SoundHeavyGate()
	PlaySoundAtLevelStatic ("Gate_2"), GateSoundLevel, Activeball
End Sub

Sub Gates_hit(idx)
	SoundHeavyGate
End Sub

Sub GatesWire_hit(idx)	
	SoundPlayfieldGate	
End Sub	

'/////////////////////////////  LEFT LANE ENTRANCE - SOUNDS  ////////////////////////////

Sub RandomSoundLeftArch()
	PlaySoundAtLevelActiveBall ("Arch_L" & Int(Rnd*4)+1), Vol(ActiveBall) * ArchSoundFactor
End Sub

Sub RandomSoundRightArch()
	PlaySoundAtLevelActiveBall ("Arch_R" & Int(Rnd*4)+1), Vol(ActiveBall) * ArchSoundFactor
End Sub


Sub Arch1_hit()
	If Activeball.velx > 1 Then SoundPlayfieldGate
	StopSound "Arch_L1"
	StopSound "Arch_L2"
	StopSound "Arch_L3"
	StopSound "Arch_L4"
End Sub

Sub Arch1_unhit()
	If activeball.velx < -8 Then
		RandomSoundRightArch
	End If
End Sub

Sub Arch2_hit()
	If Activeball.velx < 1 Then SoundPlayfieldGate
	StopSound "Arch_R1"
	StopSound "Arch_R2"
	StopSound "Arch_R3"
	StopSound "Arch_R4"
End Sub

Sub Arch2_unhit()
	If activeball.velx > 10 Then
		RandomSoundLeftArch
	End If
End Sub

'/////////////////////////////  SAUCERS (KICKER HOLES)  ////////////////////////////

Sub SoundSaucerLock()
	PlaySoundAtLevelStatic ("Saucer_Enter_" & Int(Rnd*2)+1), SaucerLockSoundLevel, Activeball
End Sub

Sub SoundSaucerKick(scenario, saucer)
	Select Case scenario
		Case 0: PlaySoundAtLevelStatic SoundFX("Saucer_Empty", DOFContactors), SaucerKickSoundLevel, saucer
		Case 1: PlaySoundAtLevelStatic SoundFX("Saucer_Kick", DOFContactors), SaucerKickSoundLevel, saucer
	End Select
End Sub


'///////////////////////////  DROP TARGET HIT SOUNDS  ///////////////////////////

Sub RandomSoundDropTargetReset(obj)
	PlaySoundAtLevelStatic SoundFX("Drop_Target_Reset_" & Int(Rnd*6)+1,DOFContactors), 1, obj
End Sub

Sub SoundDropTargetDrop(obj)
	PlaySoundAtLevelStatic ("Drop_Target_Down_" & Int(Rnd*6)+1), 200, obj
End Sub

'/////////////////////////////  GI AND FLASHER RELAYS  ////////////////////////////

Const RelayFlashSoundLevel = 0.315									'volume level; range [0, 1];
Const RelayGISoundLevel = 1.05									'volume level; range [0, 1];

Sub Sound_GI_Relay(toggle, obj)
	Select Case toggle
		Case 1
			PlaySoundAtLevelStatic ("Relay_GI_On"), 0.025*RelayGISoundLevel, obj
		Case 0
			PlaySoundAtLevelStatic ("Relay_GI_Off"), 0.025*RelayGISoundLevel, obj
	End Select
End Sub

Sub Sound_Flash_Relay(toggle, obj)
	Select Case toggle
		Case 1
			PlaySoundAtLevelStatic ("Relay_Flash_On"), 0.025*RelayFlashSoundLevel, obj			
		Case 0
			PlaySoundAtLevelStatic ("Relay_Flash_Off"), 0.025*RelayFlashSoundLevel, obj		
	End Select
End Sub

Sub RandomSoundWireRampStop(obj)
	Select Case Int(rnd*6)
		Case 0: PlaySoundAtVol "wireramp_stop", obj, 0.2*volumedial
		Case 1: PlaySoundAtVol "wireramp_stop2", obj, 0.2*volumedial
		Case 2: PlaySoundAtVol "wireramp_stop3", obj, 0.2*volumedial
		Case 3: PlaySoundAtVol "wireramp_stop", obj, 0.1*volumedial
		Case 4: PlaySoundAtVol "wireramp_stop2", obj, 0.1*volumedial
		Case 5: PlaySoundAtVol "wireramp_stop3", obj, 0.1*volumedial
	End Select
End Sub

Sub RandomSoundRampStop(obj)
	Select Case Int(rnd*3)
		Case 0: PlaySoundAtLevelActiveBall ("Rubber_Strong_1"), Vol(ActiveBall) * RubberStrongSoundFactor * 0.6
		Case 1: PlaySoundAtLevelActiveBall ("Rubber_Strong_2"), Vol(ActiveBall) * RubberStrongSoundFactor * 0.6
		Case 2: PlaySoundAtLevelActiveBall ("Rubber_1_Hard"), Vol(ActiveBall) * RubberStrongSoundFactor * 0.6
	End Select
End Sub


'/////////////////////////////////////////////////////////////////
'					End Mechanical Sounds
'/////////////////////////////////////////////////////////////////

'******************************************************
'****  FLEEP MECHANICAL SOUNDS
'******************************************************


'******************************************************
'****  BALL ROLLING AND DROP SOUNDS
'******************************************************
'
' Be sure to call RollingUpdate in a timer with a 10ms interval see the GameTimer_Timer() sub

Const tnob = 6						' total number of balls : 4 (trough) + 1 (minipf trough) + 1 (Newton Ball)
Const fakeballs = 2					' number of balls created on table start (rolling sound will be skipped)
Const lob = 1

ReDim rolling(tnob)
InitRolling

Dim DropCount
ReDim DropCount(tnob)

Sub InitRolling
	Dim i
	For i = 0 to tnob
		rolling(i) = False
	Next
End Sub

Sub RollingUpdate()

'	exit sub	

	Dim BOT, b
	BOT = GetBalls

	' stop the sound of deleted balls
	For b = UBound(BOT) + 1 to tnob
'		if GetBalls(b).id < 999 then ' Bell Collision Ball ID = 999
			' Comment the next line if you are not implementing Dyanmic Ball Shadows
			If AmbientBallShadowOn = 0 Then BallShadowA(b).visible = 0
			rolling(b) = False
			StopSound("BallRoll_" & b)

'		end if 
	Next


	' exit the sub if no balls on the table
	If UBound(BOT) = fakeballs-1 Then Exit Sub

	' play the rolling sound for each ball

	For b = 0 to UBound(BOT)
		if BOT(b).id < 999 then ' Bell Collision Ball ID = 999
			If BallVel(BOT(b)) > 1 AND BOT(b).z < 30 Then
				rolling(b) = True
				PlaySound ("BallRoll_" & b), -1, VolPlayfieldRoll(BOT(b)) * BallRollVolume * VolumeDial, AudioPan(BOT(b)), 0, PitchPlayfieldRoll(BOT(b)), 1, 0, AudioFade(BOT(b))

			Else
				If rolling(b) = True Then
					StopSound("BallRoll_" & b)
					rolling(b) = False
				End If
			End If

			' Ball Drop Sounds
			If BOT(b).VelZ < -1 and BOT(b).z < 55 and BOT(b).z > 27 Then 'height adjust for ball drop sounds
				If DropCount(b) >= 5 Then
					DropCount(b) = 0
					If BOT(b).velz > -7 Then
						RandomSoundBallBouncePlayfieldSoft BOT(b)
					Else
						RandomSoundBallBouncePlayfieldHard BOT(b)
					End If				
				End If
			End If
			If DropCount(b) < 5 Then
				DropCount(b) = DropCount(b) + 1
			End If

			' "Static" Ball Shadows
			' Comment the next If block, if you are not implementing the Dyanmic Ball Shadows
			If AmbientBallShadowOn = 0 Then
				If BOT(b).Z > 30 Then
					BallShadowA(b).height=BOT(b).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping
				Else
					BallShadowA(b).height=BOT(b).z - BallSize/2 + 5
				End If
				BallShadowA(b).Y = BOT(b).Y + Ballsize/5 + fovY
				BallShadowA(b).X = BOT(b).X
				BallShadowA(b).visible = 1
			End If
		end if
	Next
End Sub


'******************************************************
'****  END BALL ROLLING AND DROP SOUNDS
'******************************************************




'******************************************************
'**** RAMP ROLLING SFX
'******************************************************

'Ball tracking ramp SFX 1.0
'   Reqirements:
'          * Import A Sound File for each ball on the table for plastic ramps.  Call It RampLoop<Ball_Number> ex: RampLoop1, RampLoop2, ...
'          * Import a Sound File for each ball on the table for wire ramps. Call it WireLoop<Ball_Number> ex: WireLoop1, WireLoop2, ...
'          * Create a Timer called RampRoll, that is enabled, with a interval of 100
'          * Set RampBAlls and RampType variable to Total Number of Balls
'	Usage:
'          * Setup hit events and call WireRampOn True or WireRampOn False (True = Plastic ramp, False = Wire Ramp)
'          * To stop tracking ball
'                 * call WireRampOff
'                 * Otherwise, the ball will auto remove if it's below 30 vp units
'

dim RampMinLoops : RampMinLoops = 4

' RampBalls
'      Setup:        Set the array length of x in RampBalls(x,2) Total Number of Balls on table + 1:  if tnob = 5, then RammBalls(6,2)
'      Description:  
dim RampBalls(6,2)
'x,0 = ball x,1 = ID,	2 = Protection against ending early (minimum amount of updates)
'0,0 is boolean on/off, 0,1 unused for now
RampBalls(0,0) = False

' RampType
'     Setup: Set this array to the number Total number of balls that can be tracked at one time + 1.  5 ball multiball then set value to 6
'     Description: Array type indexed on BallId and a values used to deterimine what type of ramp the ball is on: False = Wire Ramp, True = Plastic Ramp
dim RampType(6)	

Sub WireRampOn(input)  : Waddball ActiveBall, input : RampRollUpdate: End Sub
Sub WireRampOff() : WRemoveBall ActiveBall.ID	: End Sub


' WaddBall (Active Ball, Boolean)
'     Description: This subroutine is called from WireRampOn to Add Balls to the RampBalls Array
Sub Waddball(input, RampInput)	'Add ball
	' This will loop through the RampBalls array checking each element of the array x, position 1
	' To see if the the ball was already added to the array.
	' If the ball is found then exit the subroutine
	dim x : for x = 1 to uBound(RampBalls)	'Check, don't add balls twice
		if RampBalls(x, 1) = input.id then 
			if Not IsEmpty(RampBalls(x,1) ) then Exit Sub	'Frustating issue with BallId 0. Empty variable = 0
		End If
	Next

	' This will itterate through the RampBalls Array.
	' The first time it comes to a element in the array where the Ball Id (Slot 1) is empty.  It will add the current ball to the array
	' The RampBalls assigns the ActiveBall to element x,0 and ball id of ActiveBall to 0,1
	' The RampType(BallId) is set to RampInput
	' RampBalls in 0,0 is set to True, this will enable the timer and the timer is also turned on
	For x = 1 to uBound(RampBalls)
		if IsEmpty(RampBalls(x, 1)) then 
			Set RampBalls(x, 0) = input
			RampBalls(x, 1)	= input.ID
			RampType(x) = RampInput
			RampBalls(x, 2)	= 0
			'exit For
			RampBalls(0,0) = True
			RampRoll.Enabled = 1	 'Turn on timer
			'RampRoll.Interval = RampRoll.Interval 'reset timer
			exit Sub
		End If
		if x = uBound(RampBalls) then 	'debug
			Debug.print "WireRampOn error, ball queue is full: " & vbnewline & _
			RampBalls(0, 0) & vbnewline & _
			Typename(RampBalls(1, 0)) & " ID:" & RampBalls(1, 1) & "type:" & RampType(1) & vbnewline & _
			Typename(RampBalls(2, 0)) & " ID:" & RampBalls(2, 1) & "type:" & RampType(2) & vbnewline & _
			Typename(RampBalls(3, 0)) & " ID:" & RampBalls(3, 1) & "type:" & RampType(3) & vbnewline & _
			Typename(RampBalls(4, 0)) & " ID:" & RampBalls(4, 1) & "type:" & RampType(4) & vbnewline & _
			Typename(RampBalls(5, 0)) & " ID:" & RampBalls(5, 1) & "type:" & RampType(5) & vbnewline & _
			" "
		End If
	next
End Sub

' WRemoveBall (BallId)
'    Description: This subroutine is called from the RampRollUpdate subroutine 
'                 and is used to remove and stop the ball rolling sounds
Sub WRemoveBall(ID)		'Remove ball
	'Debug.Print "In WRemoveBall() + Remove ball from loop array"
	dim ballcount : ballcount = 0
	dim x : for x = 1 to Ubound(RampBalls)
		if ID = RampBalls(x, 1) then 'remove ball
			Set RampBalls(x, 0) = Nothing
			RampBalls(x, 1) = Empty
			RampType(x) = Empty
			StopSound("RampLoop" & x)
			StopSound("wireloop" & x)
		end If
		'if RampBalls(x,1) = Not IsEmpty(Rampballs(x,1) then ballcount = ballcount + 1
		if not IsEmpty(Rampballs(x,1)) then ballcount = ballcount + 1
	next
	if BallCount = 0 then RampBalls(0,0) = False	'if no balls in queue, disable timer update
End Sub

Sub RampRoll_Timer():RampRollUpdate:End Sub

Sub RampRollUpdate()		'Timer update
	dim x : for x = 1 to uBound(RampBalls)
		if Not IsEmpty(RampBalls(x,1) ) then 
			if BallVel(RampBalls(x,0) ) > 1 then ' if ball is moving, play rolling sound
				If RampType(x) then 
					PlaySound("RampLoop" & x), -1, VolPlayfieldRoll(RampBalls(x,0)) * RampRollVolume * VolumeDial, AudioPan(RampBalls(x,0)), 0, BallPitchV(RampBalls(x,0)), 1, 0, AudioFade(RampBalls(x,0))				
					StopSound("wireloop" & x)
				Else
					StopSound("RampLoop" & x)
					PlaySound("wireloop" & x), -1, VolPlayfieldRoll(RampBalls(x,0)) * RampRollVolume * VolumeDial, AudioPan(RampBalls(x,0)), 0, BallPitch(RampBalls(x,0)), 1, 0, AudioFade(RampBalls(x,0))
				End If
				RampBalls(x, 2)	= RampBalls(x, 2) + 1
			Else
				StopSound("RampLoop" & x)
				StopSound("wireloop" & x)
			end if
			if RampBalls(x,0).Z < 30 and RampBalls(x, 2) > RampMinLoops then	'if ball is on the PF, remove  it
				StopSound("RampLoop" & x)
				StopSound("wireloop" & x)
				Wremoveball RampBalls(x,1)
			End If
		Else
			StopSound("RampLoop" & x)
			StopSound("wireloop" & x)
		end if
	next
	if not RampBalls(0,0) then RampRoll.enabled = 0

End Sub

' This can be used to debug the Ramp Roll time.  You need to enable the tbWR timer on the TextBox
Sub tbWR_Timer()	'debug textbox
	me.text =	"on? " & RampBalls(0, 0) & " timer: " & RampRoll.Enabled & vbnewline & _
	"1 " & Typename(RampBalls(1, 0)) & " ID:" & RampBalls(1, 1) & " type:" & RampType(1) & " Loops:" & RampBalls(1, 2) & vbnewline & _
	"2 " & Typename(RampBalls(2, 0)) & " ID:" & RampBalls(2, 1) & " type:" & RampType(2) & " Loops:" & RampBalls(2, 2) & vbnewline & _
	"3 " & Typename(RampBalls(3, 0)) & " ID:" & RampBalls(3, 1) & " type:" & RampType(3) & " Loops:" & RampBalls(3, 2) & vbnewline & _
	"4 " & Typename(RampBalls(4, 0)) & " ID:" & RampBalls(4, 1) & " type:" & RampType(4) & " Loops:" & RampBalls(4, 2) & vbnewline & _
	"5 " & Typename(RampBalls(5, 0)) & " ID:" & RampBalls(5, 1) & " type:" & RampType(5) & " Loops:" & RampBalls(5, 2) & vbnewline & _
	"6 " & Typename(RampBalls(6, 0)) & " ID:" & RampBalls(6, 1) & " type:" & RampType(6) & " Loops:" & RampBalls(6, 2) & vbnewline & _
	" "
End Sub


Function BallPitch(ball) ' Calculates the pitch of the sound based on the ball speed
    BallPitch = pSlope(BallVel(ball), 1, -1000, 60, 10000)
End Function

Function BallPitchV(ball) ' Calculates the pitch of the sound based on the ball speed Variation
	BallPitchV = pSlope(BallVel(ball), 1, -4000, 60, 7000)
End Function



'******************************************************
'**** END RAMP ROLLING SFX
'******************************************************

'******************************************************
'****  DROP TARGETS by Rothbauerw
'******************************************************
' This solution improves the physics for drop targets to create more realistic behavior. It allows the ball 
' to move through the target enabling the ability to score more than one target with a well placed shot.
' It also handles full drop target animation, including deflection on hit and a slight lift when the drop 
' targets raise, switch handling, bricking, and popping the ball up if it's over the drop target when it raises.
'
' For each drop target, we'll use two wall objects for physics calculations and one primitive for visuals and   
' animation. We will not use target objects.  Place your drop target primitive the same as you would a VP drop target. 
' The primitive should have it's pivot point centered on the x and y axis and at or just below the playfield 
' level on the z axis. Orientation needs to be set using Rotz and bending deflection using Rotx. You'll find a hooded 
' target mesh in this table's example. It uses the same texture map as the VP drop targets.


'******************************************************
'  DROP TARGETS INITIALIZATION
'******************************************************

Class DropTarget
  Private m_primary, m_secondary, m_prim, m_sw, m_animate, m_isDropped

  Public Property Get Primary(): Set Primary = m_primary: End Property
  Public Property Let Primary(input): Set m_primary = input: End Property

  Public Property Get Secondary(): Set Secondary = m_secondary: End Property
  Public Property Let Secondary(input): Set m_secondary = input: End Property

  Public Property Get Prim(): Set Prim = m_prim: End Property
  Public Property Let Prim(input): Set m_prim = input: End Property

  Public Property Get Sw(): Sw = m_sw: End Property
  Public Property Let Sw(input): m_sw = input: End Property

  Public Property Get Animate(): Animate = m_animate: End Property
  Public Property Let Animate(input): m_animate = input: End Property

  Public Property Get IsDropped(): IsDropped = m_isDropped: End Property
  Public Property Let IsDropped(input): m_isDropped = input: End Property

  Public default Function init(primary, secondary, prim, sw, animate, isDropped)
    Set m_primary = primary
    Set m_secondary = secondary
    Set m_prim = prim
    m_sw = sw
    m_animate = animate
    m_isDropped = isDropped

    Set Init = Me
  End Function
End Class

'Define a variable for each drop target
Dim DT1, DT2, DT3, DT4, DT5, DT10, DT11, DT12

'Set array with drop target objects
'
'DropTargetvar = Array(primary, secondary, prim, swtich, animate)
' 	primary: 			primary target wall to determine drop
'	secondary:			wall used to simulate the ball striking a bent or offset target after the initial Hit
'	prim:				primitive target used for visuals and animation
'							IMPORTANT!!! 
'							rotz must be used for orientation
'							rotx to bend the target back
'							transz to move it up and down
'							the pivot point should be in the center of the target on the x, y and at or below the playfield (0) on z
'	switch:				ROM switch number
'	animate:			Arrary slot for handling the animation instrucitons, set to 0
'
'	Values for annimate: 1 - bend target (hit to primary), 2 - drop target (hit to secondary), 3 - brick target (high velocity hit to secondary), -1 - raise target 
'       isDropped:  Boolean which determines whether a drop target is dropped. Set to false if they are initially raised, true if initially dropped.

Set DT1 = (new DropTarget)(sw1, sw1a, sw1p, 1, 0, false)
Set DT2 = (new DropTarget)(sw2, sw2a, sw2p, 2, 0, false)
Set DT3 = (new DropTarget)(sw3, sw3a, sw3p, 3, 0, false)
Set DT4 = (new DropTarget)(sw4, sw4a, sw4p, 4, 0, false)
Set DT5 = (new DropTarget)(sw5, sw5a, sw5p, 5, 0, false)
Set DT10 = (new DropTarget)(sw10, sw10a, sw10p, 10, 0, false)
Set DT11 = (new DropTarget)(sw11, sw11a, sw11p, 11, 0, false)
Set DT12 = (new DropTarget)(sw12, sw12a, sw12p, 12, 0, false)


Dim DTArray
DTArray = Array(DT1, DT2, DT3, DT4, DT5, DT10, DT11, DT12)

'Configure the behavior of Drop Targets.
Const DTDropSpeed = 110 'in milliseconds
Const DTDropUpSpeed = 40 'in milliseconds
Const DTDropUnits = 44 'VP units primitive drops so top of at or below the playfield
Const DTDropUpUnits = 3 'VP units primitive raises above the up position on drops up
Const DTMaxBend = 8 'max degrees primitive rotates when hit
Const DTDropDelay = 20 'time in milliseconds before target drops (due to friction/impact of the ball)
Const DTRaiseDelay = 40 'time in milliseconds before target drops back to normal up position after the solenoid fires to raise the target
Const DTBrickVel = 30 'velocity at which the target will brick, set to '0' to disable brick

Const DTEnableBrick = 0 'Set to 0 to disable bricking, 1 to enable bricking
Const DTHitSound = "" 'Drop Target Hit sound
Const DTDropSound = "DropTarget_Down" 'Drop Target Drop sound
Const DTResetSound = "DropTarget_Up" 'Drop Target reset sound

Const DTMass = 0.2 'Mass of the Drop Target (between 0 and 1), higher values provide more resistance


'******************************************************
'  DROP TARGETS FUNCTIONS
'******************************************************

Sub DTHit(switch)
	Dim i
	i = DTArrayID(switch)

	PlayTargetSound
	DTArray(i).animate =  DTCheckBrick(Activeball,DTArray(i).prim)
	If DTArray(i).animate = 1 or DTArray(i).animate = 3 or DTArray(i).animate = 4 Then
		DTBallPhysics Activeball, DTArray(i).prim.rotz, DTMass
	End If
	DoDTAnim
End Sub

Sub DTRaise(switch)
	Dim i
	i = DTArrayID(switch)

	DTArray(i).animate = -1
	DoDTAnim
End Sub

Sub DTDrop(switch)
	Dim i
	i = DTArrayID(switch)

	DTArray(i).animate = 1
	DoDTAnim
End Sub

Function DTArrayID(switch)
	Dim i
	For i = 0 to uBound(DTArray) 
		If DTArray(i).sw = switch Then DTArrayID = i:Exit Function 
	Next
End Function


sub DTBallPhysics(aBall, angle, mass)
	dim rangle,bangle,calc1, calc2, calc3
	rangle = (angle - 90) * 3.1416 / 180
	bangle = atn2(cor.ballvely(aball.id),cor.ballvelx(aball.id))

	calc1 = cor.BallVel(aball.id) * cos(bangle - rangle) * (aball.mass - mass) / (aball.mass + mass)
	calc2 = cor.BallVel(aball.id) * sin(bangle - rangle) * cos(rangle + 4*Atn(1)/2)
	calc3 = cor.BallVel(aball.id) * sin(bangle - rangle) * sin(rangle + 4*Atn(1)/2)

	aBall.velx = calc1 * cos(rangle) + calc2
	aBall.vely = calc1 * sin(rangle) + calc3
End Sub


'Check if target is hit on it's face or sides and whether a 'brick' occurred
Function DTCheckBrick(aBall, dtprim) 
	dim bangle, bangleafter, rangle, rangle2, Xintersect, Yintersect, cdist, perpvel, perpvelafter, paravel, paravelafter
	rangle = (dtprim.rotz - 90) * 3.1416 / 180
	rangle2 = dtprim.rotz * 3.1416 / 180
	bangle = atn2(cor.ballvely(aball.id),cor.ballvelx(aball.id))
	bangleafter = Atn2(aBall.vely,aball.velx)

	Xintersect = (aBall.y - dtprim.y - tan(bangle) * aball.x + tan(rangle2) * dtprim.x) / (tan(rangle2) - tan(bangle))
	Yintersect = tan(rangle2) * Xintersect + (dtprim.y - tan(rangle2) * dtprim.x)

	cdist = Distance(dtprim.x, dtprim.y, Xintersect, Yintersect)

	perpvel = cor.BallVel(aball.id) * cos(bangle-rangle)
	paravel = cor.BallVel(aball.id) * sin(bangle-rangle)

	perpvelafter = BallSpeed(aBall) * cos(bangleafter - rangle) 
	paravelafter = BallSpeed(aBall) * sin(bangleafter - rangle)

	If perpvel > 0 and  perpvelafter <= 0 Then
		If DTEnableBrick = 1 and  perpvel > DTBrickVel and DTBrickVel <> 0 and cdist < 8 Then
			DTCheckBrick = 3
		Else
			DTCheckBrick = 1
		End If
	ElseIf perpvel > 0 and ((paravel > 0 and paravelafter > 0) or (paravel < 0 and paravelafter < 0)) Then
		DTCheckBrick = 4
	Else 
		DTCheckBrick = 0
	End If
End Function


Sub DoDTAnim()
	Dim i
	For i=0 to Ubound(DTArray)
		DTArray(i).animate = DTAnimate(DTArray(i).primary,DTArray(i).secondary,DTArray(i).prim,DTArray(i).sw,DTArray(i).animate)
	Next
End Sub

Function DTAnimate(primary, secondary, prim, switch,  animate)
	dim transz, switchid
	Dim animtime, rangle

	switchid = switch

	rangle = prim.rotz * PI / 180

	DTAnimate = animate

	if animate = 0  Then
		primary.uservalue = 0
		DTAnimate = 0
		Exit Function
	Elseif primary.uservalue = 0 then 
		primary.uservalue = gametime
	end if

	animtime = gametime - primary.uservalue

	If (animate = 1 or animate = 4) and animtime < DTDropDelay Then
		primary.collidable = 0
	If animate = 1 then secondary.collidable = 1 else secondary.collidable= 0
		prim.rotx = DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
		DTAnimate = animate
		Exit Function
		elseif (animate = 1 or animate = 4) and animtime > DTDropDelay Then
		primary.collidable = 0
		If animate = 1 then secondary.collidable = 1 else secondary.collidable= 0
		prim.rotx = DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
		animate = 2
		SoundDropTargetDrop prim
	End If

	if animate = 2 Then
		transz = (animtime - DTDropDelay)/DTDropSpeed *  DTDropUnits * -1
		if prim.transz > -DTDropUnits  Then
			prim.transz = transz
		end if

		prim.rotx = DTMaxBend * cos(rangle)/2
		prim.roty = DTMaxBend * sin(rangle)/2

		if prim.transz <= -DTDropUnits Then 
			prim.transz = -DTDropUnits
			secondary.collidable = 0
			controller.Switch(Switchid) = 1
			primary.uservalue = 0
			DTAnimate = 0
			Exit Function
		Else
			DTAnimate = 2
			Exit Function
		end If 
	End If

	If animate = 3 and animtime < DTDropDelay Then
		primary.collidable = 0
		secondary.collidable = 1
		prim.rotx = DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
	elseif animate = 3 and animtime > DTDropDelay Then
		primary.collidable = 1
		secondary.collidable = 0
		prim.rotx = 0
		prim.roty = 0
		primary.uservalue = 0
		DTAnimate = 0
		Exit Function
	End If

	if animate = -1 Then
		transz = (1 - (animtime)/DTDropUpSpeed) *  DTDropUnits * -1

		If prim.transz = -DTDropUnits Then
			Dim BOT, b
			BOT = GetBalls

			For b = 0 to UBound(BOT)
				If InRotRect(BOT(b).x,BOT(b).y,prim.x, prim.y, prim.rotz, -25,-10,25,-10,25,25,-25,25) and BOT(b).z < prim.z+DTDropUnits+25 Then
					BOT(b).velz = 20
				End If
			Next
		End If

		if prim.transz < 0 Then
			prim.transz = transz
		elseif transz > 0 then
			prim.transz = transz
		end if

		if prim.transz > DTDropUpUnits then 
			DTAnimate = -2
			prim.transz = DTDropUpUnits
			prim.rotx = 0
			prim.roty = 0
			primary.uservalue = gametime
		end if
		primary.collidable = 0
		secondary.collidable = 1
		controller.Switch(Switchid) = 0

	End If

	if animate = -2 and animtime > DTRaiseDelay Then
		prim.transz = (animtime - DTRaiseDelay)/DTDropSpeed *  DTDropUnits * -1 + DTDropUpUnits 
		if prim.transz < 0 then
			prim.transz = 0
			primary.uservalue = 0
			DTAnimate = 0

			primary.collidable = 1
			secondary.collidable = 0
		end If 
	End If
End Function


'******************************************************
'  DROP TARGET
'  SUPPORTING FUNCTIONS 
'******************************************************


' Used for drop targets
'*** Determines if a Points (px,py) is inside a 4 point polygon A-D in Clockwise/CCW order
Function InRect(px,py,ax,ay,bx,by,cx,cy,dx,dy)
	Dim AB, BC, CD, DA
	AB = (bx*py) - (by*px) - (ax*py) + (ay*px) + (ax*by) - (ay*bx)
	BC = (cx*py) - (cy*px) - (bx*py) + (by*px) + (bx*cy) - (by*cx)
	CD = (dx*py) - (dy*px) - (cx*py) + (cy*px) + (cx*dy) - (cy*dx)
	DA = (ax*py) - (ay*px) - (dx*py) + (dy*px) + (dx*ay) - (dy*ax)

	If (AB <= 0 AND BC <=0 AND CD <= 0 AND DA <= 0) Or (AB >= 0 AND BC >=0 AND CD >= 0 AND DA >= 0) Then
		InRect = True
	Else
		InRect = False       
	End If
End Function

Function InRotRect(ballx,bally,px,py,angle,ax,ay,bx,by,cx,cy,dx,dy)
    Dim rax,ray,rbx,rby,rcx,rcy,rdx,rdy
    Dim rotxy
    rotxy = RotPoint(ax,ay,angle)
    rax = rotxy(0)+px : ray = rotxy(1)+py
    rotxy = RotPoint(bx,by,angle)
    rbx = rotxy(0)+px : rby = rotxy(1)+py
    rotxy = RotPoint(cx,cy,angle)
    rcx = rotxy(0)+px : rcy = rotxy(1)+py
    rotxy = RotPoint(dx,dy,angle)
    rdx = rotxy(0)+px : rdy = rotxy(1)+py

    InRotRect = InRect(ballx,bally,rax,ray,rbx,rby,rcx,rcy,rdx,rdy)
End Function

Function RotPoint(x,y,angle)
    dim rx, ry
    rx = x*dCos(angle) - y*dSin(angle)
    ry = x*dSin(angle) + y*dCos(angle)
    RotPoint = Array(rx,ry)
End Function


'******************************************************
'****  END DROP TARGETS
'******************************************************



'***************************************************************
'****  VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'***************************************************************

'****** INSTRUCTIONS please read ******

'****** Part A:  Table Elements ******
'
' Import the "bsrtx7" and "ballshadow" images
' Import the shadow materials file (3 sets included) (you can also export the 3 sets from this table to create the same file)
' Copy in the BallShadowA flasher set and the sets of primitives named BallShadow#, RtxBallShadow#, and RtxBall2Shadow#
'	* with at least as many objects each as there can be balls, including locked balls
' Ensure you have a timer with a -1 interval that is always running

' Create a collection called DynamicSources that includes all light sources you want to cast ball shadows
'***These must be organized in order, so that lights that intersect on the table are adjacent in the collection***
'***If there are more than 3 lights that overlap in a playable area, exclude the less important lights***
' This is because the code will only project two shadows if they are coming from lights that are consecutive in the collection, and more than 3 will cause "jumping" between which shadows are drawn
' The easiest way to keep track of this is to start with the group on the right slingshot and move anticlockwise around the table
'	For example, if you use 6 lights: A & B on the left slingshot and C & D on the right, with E near A&B and F next to C&D, your collection would look like EBACDF
'
'G				H											^	E
'															^	B
'	A		 C												^	A
'	 B		D			your collection should look like	^	G		because E&B, B&A, etc. intersect; but B&D or E&F do not
'  E		  F												^	H
'															^	C
'															^	D
'															^	F
'		When selecting them, you'd shift+click in this order^^^^^

'****** End Part A:  Table Elements ******


'****** Part B:  Code and Functions ******

' *** Timer sub
' The "DynamicBSUpdate" sub should be called by a timer with an interval of -1 (framerate)
'Sub FrameTimer_Timer()
'	If DynamicBallShadowsOn Or AmbientBallShadowOn Then DynamicBSUpdate 'update ball shadows
'End Sub

' *** These are usually defined elsewhere (ballrolling), but activate here if necessary
'Const tnob = 10 ' total number of balls
'Const lob = 0	'locked balls on start; might need some fiddling depending on how your locked balls are done
'Dim tablewidth: tablewidth = Table1.width
'Dim tableheight: tableheight = Table1.height

' *** User Options - Uncomment here or move to top
'----- Shadow Options -----
'Const DynamicBallShadowsOn = 1		'0 = no dynamic ball shadow ("triangles" near slings and such), 1 = enable dynamic ball shadow
'Const AmbientBallShadowOn = 1		'0 = Static shadow under ball ("flasher" image, like JP's)
'									'1 = Moving ball shadow ("primitive" object, like ninuzzu's) - This is the only one that shows up on the pf when in ramps and fades when close to lights!
'									'2 = flasher image shadow, but it moves like ninuzzu's

Const fovY					= 0		'Offset y position under ball to account for layback or inclination (more pronounced need further back)
Const DynamicBSFactor 		= 0.95	'0 to 1, higher is darker
Const AmbientBSFactor 		= 0.7	'0 to 1, higher is darker
Const AmbientMovement		= 2		'1 to 4, higher means more movement as the ball moves left and right
Const Wideness				= 20	'Sets how wide the dynamic ball shadows can get (20 +5 thinness should be most realistic for a 50 unit ball)
Const Thinness				= 5		'Sets minimum as ball moves away from source


' *** This segment goes within the RollingUpdate sub, so that if Ambient...=0 and Dynamic...=0 the entire DynamicBSUpdate sub can be skipped for max performance
'	' stop the sound of deleted balls
'	For b = UBound(BOT) + 1 to tnob
'		If AmbientBallShadowOn = 0 Then BallShadowA(b).visible = 0
'		...rolling(b) = False
'		...StopSound("BallRoll_" & b)
'	Next
'
'...rolling and drop sounds...

'		If DropCount(b) < 5 Then
'			DropCount(b) = DropCount(b) + 1
'		End If
'
'		' "Static" Ball Shadows
'		If AmbientBallShadowOn = 0 Then
'			If BOT(b).Z > 30 Then
'				BallShadowA(b).height=BOT(b).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping
'			Else
'				BallShadowA(b).height=BOT(b).z - BallSize/2 + 5
'			End If
'			BallShadowA(b).Y = BOT(b).Y + Ballsize/5 + fovY
'			BallShadowA(b).X = BOT(b).X
'			BallShadowA(b).visible = 1
'		End If

' *** Required Functions, enable these if they are not already present elswhere in your table
Function DistanceFast(x, y)
	dim ratio, ax, ay
	ax = abs(x)					'Get absolute value of each vector
	ay = abs(y)
	ratio = 1 / max(ax, ay)		'Create a ratio
	ratio = ratio * (1.29289 - (ax + ay) * ratio * 0.29289)
	if ratio > 0 then			'Quickly determine if it's worth using
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


'****** End Part B:  Code and Functions ******


'****** Part C:  The Magic ******
Dim sourcenames, currentShadowCount, DSSources(30), numberofsources, numberofsources_hold
sourcenames = Array ("","","","","","","","","","","","")
currentShadowCount = Array (0,0,0,0,0,0,0,0,0,0,0,0)

' *** Trim or extend these to match the number of balls/primitives/flashers on the table!
dim objrtx1(12), objrtx2(12)
dim objBallShadow(12)
Dim BallShadowA
BallShadowA = Array (BallShadowA0,BallShadowA1,BallShadowA2,BallShadowA3,BallShadowA4,BallShadowA5,BallShadowA6,BallShadowA7,BallShadowA8,BallShadowA9,BallShadowA10,BallShadowA11)

DynamicBSInit

sub DynamicBSInit()
	Dim iii, source

	for iii = 0 to tnob									'Prepares the shadow objects before play begins
		Set objrtx1(iii) = Eval("RtxBallShadow" & iii)
		objrtx1(iii).material = "RtxBallShadow" & iii
		objrtx1(iii).z = iii/1000 + 0.01
		objrtx1(iii).visible = 0

		Set objrtx2(iii) = Eval("RtxBall2Shadow" & iii)
		objrtx2(iii).material = "RtxBallShadow2_" & iii
		objrtx2(iii).z = (iii)/1000 + 0.02
		objrtx2(iii).visible = 0

		currentShadowCount(iii) = 0

		Set objBallShadow(iii) = Eval("BallShadow" & iii)
		objBallShadow(iii).material = "BallShadow" & iii
		UpdateMaterial objBallShadow(iii).material,1,0,0,0,0,0,AmbientBSFactor,RGB(0,0,0),0,0,False,True,0,0,0,0
		objBallShadow(iii).Z = iii/1000 + 0.04
		objBallShadow(iii).visible = 0

		BallShadowA(iii).Opacity = 100*AmbientBSFactor
		BallShadowA(iii).visible = 0
	Next

	iii = 0

	For Each Source in DynamicSources
		DSSources(iii) = Array(Source.x, Source.y)
		iii = iii + 1
	Next
	numberofsources = iii
	numberofsources_hold = iii
end sub

dim gilvl:gilvl = 1

Sub DynamicBSUpdate
	Dim falloff:	falloff = 150			'Max distance to light sources, can be changed if you have a reason
	Dim ShadowOpacity, ShadowOpacity2 
	Dim s, Source, LSd, currentMat, AnotherSource, BOT, iii
	BOT = GetBalls

	'Hide shadow of deleted balls
	For s = UBound(BOT) + 1 to tnob
		objrtx1(s).visible = 0
		objrtx2(s).visible = 0
		objBallShadow(s).visible = 0
		BallShadowA(s).visible = 0
	Next

	If UBound(BOT) < lob Then Exit Sub		'No balls in play, exit

'The Magic happens now
	For s = lob to UBound(BOT)

' *** Normal "ambient light" ball shadow
	'Layered from top to bottom. If you had an upper pf at for example 80 and ramps even above that, your segments would be z>110; z<=110 And z>100; z<=100 And z>30; z<=30 And z>20; Else invisible

		If AmbientBallShadowOn = 1 Then			'Primitive shadow on playfield, flasher shadow in ramps
			If BOT(s).Z > 30 Then							'The flasher follows the ball up ramps while the primitive is on the pf
				If BOT(s).X < tablewidth/2 Then
					objBallShadow(s).X = ((BOT(s).X) - (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + 5
				Else
					objBallShadow(s).X = ((BOT(s).X) + (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) - 5
				End If
				objBallShadow(s).Y = BOT(s).Y + BallSize/10 + fovY
				objBallShadow(s).visible = 1

				BallShadowA(s).X = BOT(s).X
				BallShadowA(s).Y = BOT(s).Y + BallSize/5 + fovY
				BallShadowA(s).height=BOT(s).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping
				BallShadowA(s).visible = 1
			Elseif BOT(s).Z <= 30 And BOT(s).Z > 20 Then	'On pf, primitive only
				objBallShadow(s).visible = 1
				If BOT(s).X < tablewidth/2 Then
					objBallShadow(s).X = ((BOT(s).X) - (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + 5
				Else
					objBallShadow(s).X = ((BOT(s).X) + (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) - 5
				End If
				objBallShadow(s).Y = BOT(s).Y + fovY
				BallShadowA(s).visible = 0
			Else											'Under pf, no shadows
				objBallShadow(s).visible = 0
				BallShadowA(s).visible = 0
			end if

		Elseif AmbientBallShadowOn = 2 Then		'Flasher shadow everywhere
			If BOT(s).Z > 30 Then							'In a ramp
				BallShadowA(s).X = BOT(s).X
				BallShadowA(s).Y = BOT(s).Y + BallSize/5 + fovY
				BallShadowA(s).height=BOT(s).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping
				BallShadowA(s).visible = 1
			Elseif BOT(s).Z <= 30 And BOT(s).Z > 20 Then	'On pf
				BallShadowA(s).visible = 1
				If BOT(s).X < tablewidth/2 Then
					BallShadowA(s).X = ((BOT(s).X) - (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + 5
				Else
					BallShadowA(s).X = ((BOT(s).X) + (Ballsize/10) + ((BOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) - 5
				End If
				BallShadowA(s).Y = BOT(s).Y + Ballsize/10 + fovY
				BallShadowA(s).height=BOT(s).z - BallSize/2 + 5
			Else											'Under pf
				BallShadowA(s).visible = 0
			End If
		End If

' *** Dynamic shadows
		If DynamicBallShadowsOn Then
			If BOT(s).Z < 30 Then 'And BOT(s).Y < (TableHeight - 200) Then 'Or BOT(s).Z > 105 Then		'Defining when and where (on the table) you can have dynamic shadows
				For iii = 0 to numberofsources - 1 
					LSd=DistanceFast((BOT(s).x-DSSources(iii)(0)),(BOT(s).y-DSSources(iii)(1)))	'Calculating the Linear distance to the Source
					If LSd < falloff And gilvl > 0 Then						    'If the ball is within the falloff range of a light and light is on (we will set numberofsources to 0 when GI is off)
						currentShadowCount(s) = currentShadowCount(s) + 1		'Within range of 1 or 2
						if currentShadowCount(s) = 1 Then						'1 dynamic shadow source
							sourcenames(s) = iii
							currentMat = objrtx1(s).material
							objrtx2(s).visible = 0 : objrtx1(s).visible = 1 : objrtx1(s).X = BOT(s).X : objrtx1(s).Y = BOT(s).Y + fovY
	'						objrtx1(s).Z = BOT(s).Z - 25 + s/1000 + 0.01						'Uncomment if you want to add shadows to an upper/lower pf
							objrtx1(s).rotz = AnglePP(DSSources(iii)(0), DSSources(iii)(1), BOT(s).X, BOT(s).Y) + 90
							ShadowOpacity = (falloff-LSd)/falloff									'Sets opacity/darkness of shadow by distance to light
							objrtx1(s).size_y = Wideness*ShadowOpacity+Thinness						'Scales shape of shadow with distance/opacity
							UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity*DynamicBSFactor^2,RGB(0,0,0),0,0,False,True,0,0,0,0
							If AmbientBallShadowOn = 1 Then
								currentMat = objBallShadow(s).material									'Brightens the ambient primitive when it's close to a light
								UpdateMaterial currentMat,1,0,0,0,0,0,AmbientBSFactor*(1-ShadowOpacity),RGB(0,0,0),0,0,False,True,0,0,0,0
							Else
								BallShadowA(s).Opacity = 100*AmbientBSFactor*(1-ShadowOpacity)
							End If

						Elseif currentShadowCount(s) = 2 Then
																	'Same logic as 1 shadow, but twice
							currentMat = objrtx1(s).material
							AnotherSource = sourcenames(s)
							objrtx1(s).visible = 1 : objrtx1(s).X = BOT(s).X : objrtx1(s).Y = BOT(s).Y + fovY
	'						objrtx1(s).Z = BOT(s).Z - 25 + s/1000 + 0.01							'Uncomment if you want to add shadows to an upper/lower pf
							objrtx1(s).rotz = AnglePP(DSSources(AnotherSource)(0),DSSources(AnotherSource)(1), BOT(s).X, BOT(s).Y) + 90
							ShadowOpacity = (falloff-DistanceFast((BOT(s).x-DSSources(AnotherSource)(0)),(BOT(s).y-DSSources(AnotherSource)(1))))/falloff
							objrtx1(s).size_y = Wideness*ShadowOpacity+Thinness
							UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0

							currentMat = objrtx2(s).material
							objrtx2(s).visible = 1 : objrtx2(s).X = BOT(s).X : objrtx2(s).Y = BOT(s).Y + fovY
	'						objrtx2(s).Z = BOT(s).Z - 25 + s/1000 + 0.02							'Uncomment if you want to add shadows to an upper/lower pf
							objrtx2(s).rotz = AnglePP(DSSources(iii)(0), DSSources(iii)(1), BOT(s).X, BOT(s).Y) + 90
							ShadowOpacity2 = (falloff-LSd)/falloff
							objrtx2(s).size_y = Wideness*ShadowOpacity2+Thinness
							UpdateMaterial currentMat,1,0,0,0,0,0,ShadowOpacity2*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0
							If AmbientBallShadowOn = 1 Then
								currentMat = objBallShadow(s).material									'Brightens the ambient primitive when it's close to a light
								UpdateMaterial currentMat,1,0,0,0,0,0,AmbientBSFactor*(1-max(ShadowOpacity,ShadowOpacity2)),RGB(0,0,0),0,0,False,True,0,0,0,0
							Else
								BallShadowA(s).Opacity = 100*AmbientBSFactor*(1-max(ShadowOpacity,ShadowOpacity2))
							End If
						end if
					Else
						currentShadowCount(s) = 0
						BallShadowA(s).Opacity = 100*AmbientBSFactor
					End If
				Next
			Else									'Hide dynamic shadows everywhere else
				objrtx2(s).visible = 0 : objrtx1(s).visible = 0
			End If
		End If
	Next
End Sub
'****************************************************************
'****  END VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'****************************************************************

'******************************************************
'****  LAMPZ by nFozzy
'******************************************************
' 
' Lampz is a utility designed to manage and fade the lights and light-related objects on a table that is being driven by a ROM.
' To set up Lampz, one must populate the Lampz.MassAssign array with VPX Light objects, where the index of the MassAssign array
' corrisponds to the ROM index of the associated light. More that one Light object can be associated with a single MassAssign index (not shown in this example)
' Optionally, callbacks can be assigned for each index using the Lampz.Callback array. This is very useful for allowing 3D Insert primitives
' to be controlled by the ROM. Note, the aLvl parameter (i.e. the fading level that ranges between 0 and 1) is appended to the callback call.
'
' NOTE: The below timer is for flashing the inserts as a demonstration of Lampz. Should be replaced by actual lamp states.
'       In other words, delete this sub (InsertFlicker_timer) and associated timer if you are going to use Lampz with a ROM.
'dim flickerX, FlickerState : FlickerState = 0
'Sub InsertFlicker_timer
'	'msgbox Lampz.Obj(1).name
'	'	for flickerX = 0 to 140 
'	'		lampz.state(flickerX)
'	'lampz.state(flickerX)
'	if FlickerState = 0 then
'		for flickerX = 0 to 23 : lampz.state(flickerX)=false : next
'		FlickerState = 1
'	Else
'		for flickerX = 0 to 23 : lampz.state(flickerX)=true : next
'		FlickerState = 0
'	end if
'End Sub

Dim bulb
Dim LampState(200), FadingLevel(200)
Dim FlashSpeedUp(200), FlashSpeedDown(200), FlashMin(200), FlashMax(200), FlashLevel(200), ModulationLevel(200)

Dim NullFader : set NullFader = new NullFadingObject
Dim Lampz : Set Lampz = New LampFader

InitLampsNF              	' Setup lamp assignments
LampTimer.Interval = 16		' Using fixed value so the fading speed is same for every fps
LampTimer.Enabled = 1

Sub LampTimer_Timer()
	dim x, chglamp, num, chg, ii
	chglamp = Controller.ChangedLamps
	If Not IsEmpty(chglamp) Then
		For x = 0 To UBound(chglamp) 			'nmbr = chglamp(x, 0), state = chglamp(x, 1)
			If ChgLamp(ii, 0) = 130 Then 
				'Debug.print "chgLamp = 130"
				'Debug.print "LampState(130) = " & LampState(130)
				'Debug.print "ChgLamp(ii,1) = " & ChgLamp(ii,1)
				If (Lampz.state(130) = 0) And (ChgLamp(x,1) > 0) Then
					Sound_GI_Relay 1, Bumper3
					gilvl = 1
				End If
				If (Lampz.state(130) > 0) And (ChgLamp(x,1) = 0) Then
					Sound_GI_Relay 0, Bumper3
					gilvl = 0
				End If
			End If
			If ChgLamp(x, 0) = 132 Then 
				If (Lampz.state(132) = 0) And (ChgLamp(x,1) > 0) Then
					Sound_GI_Relay 1, Bumper3
					gilvl = 1
				End If
				If (Lampz.state(132) > 0) And (ChgLamp(x,1) = 0) Then
					Sound_GI_Relay 0, Bumper3
					gilvl = 0
				End If
			End If
			If ChgLamp(x, 0) = 136 Then 
				If (Lampz.state(136) = 0) And (ChgLamp(x,1) > 0) Then
					Sound_GI_Relay 1, Bumper3
					gilvl = 1
				End If
				If (Lampz.state(136) > 0) And (ChgLamp(x,1) = 0) Then
					Sound_GI_Relay 0, Bumper3
					gilvl = 0
				End If
			End If
			Lampz.state(chglamp(x, 0)) = chglamp(x, 1)
            FadingLevel(chgLamp(x, 0) ) = chgLamp(x, 1) + 4 'actual fading step
		next
	End If

''VPM returns an 0-255 range value
'	LampzMod 177, f17		'Train
'	LampzMod 177, f17a		'Train
'	LampzMod 177, f17b		'Train
'	LampzMod 177, f17c		'Train
'	LampzMod 177, f17r		'Train
'	LampzMod 179, f19		'Bottom Arch
'	LampzMod 179, f19a		'Bottom Arch
'	LampzMod 180, f20		'Left Ramp
''	LampMod 181, f21		'Yellow Dome
''	LampMod 181, f21a		'Yellow Dome
''	LampMod 181, f21c		'Yellow Dome
''	LampMod 181, f21b		'Yellow Dome
''	LampMod 181, f21bDT		'Yellow Dome
''	LampMod 181, f21r		'Yellow Dome
'	LampzMod 182, f22 		'Backbox
'	LampzMod 182, f22b 		'Backbox
'	LampzMod 182, f22c 		'Backbox
'	LampzMod 182, f22r 		'Backbox
'	LampzMod 183, f23 		'Top Eject
'	LampzMod 183, f23a 		'Top Eject
'	LampzMod 185, f25a 		'Bumper Flash
'	LampzMod 185, f25 		'Bumper Flash
'	LampzMod 186, f26 		'Bell Arrow
'	LampzMod 187, f27 		'Thunder Left
'	LampzMod 187, f27a		'Thunder Left
'	LampzMod 187, f27b		'Thunder Left
'	LampzMod 187, f27c		'Thunder Left
'	LampzMod 188, f28 		'Thunder Center
'	LampzMod 188, f28a		'Thunder Center
'	LampzMod 188, f28b		'Thunder Center
'	LampzMod 188, f28c		'Thunder Center
'	LampzMod 189, f29 		'Thunder Right
'	LampzMod 189, f29a		'Thunder Right
'	LampzMod 189, f29b		'Thunder Right
'	LampzMod 189, f29c		'Thunder Right
'	LampzMod 190, f30		'Right Ramp
''	LampMod 191, f31 		'Red Dome
''	LampMod 191, f31a		'Red Dome
''	LampMod 191, f31b		'Red Dome
''	LampMod 191, f31c		'Red Dome
''	LampMod 191, f31bDT		'Red Dome
''	LampMod 191, f31bDT1	'Red Dome
''	LampMod 191, f31d		'Red Dome
''	LampMod 191, f31r		'Red Dome

	'UpdateGIs
	'Lampz.Update	'update (fading logic only)
End Sub

dim FrameTime, InitFrameTime : InitFrameTime = 0
LampTimer2.Interval = -1
LampTimer2.Enabled = True
Sub LampTimer2_Timer()
	FrameTime = gametime - InitFrameTime : InitFrameTime = gametime	'Count frametime. Unused atm?

'FIRE button
	l63.colorfull = RGB(255*Lampz.state(59),255*Lampz.state(60),255*Lampz.state(61))
	l63a.colorfull = RGB(255*Lampz.state(59),255*Lampz.state(60),255*Lampz.state(61))
	l63b.colorfull = RGB(255*Lampz.state(59),255*Lampz.state(60),255*Lampz.state(61))
	l63c.colorfull = RGB(255*Lampz.state(59),255*Lampz.state(60),255*Lampz.state(61))
	If Lampz.state(59) OR Lampz.state(60) OR Lampz.state(61) Then l63.state=1:l63a.state=1:l63b.state=1:l63c.state=1:Else l63.state=0:l63a.state=0:l63b.state=0:l63c.state=0:End If

'LED RGB Inserts
'VPM returns an 0-100 range value


	RGBLED l37a, Lampz.state(101), Lampz.state(100), Lampz.state(99)		'left top lane (metal reflection)
	RGBLED l38a, Lampz.state(89), Lampz.state(88), Lampz.state(87)	        'center top lane (metal reflection)
	RGBLED l40a, Lampz.state(92), Lampz.state(91), Lampz.state(90)			'tunes n stuff (metal reflection)
	RGBLED l20,	 Lampz.state(125), Lampz.state(124), Lampz.state(123)		'left ramp arrow
'	RGBLEDTEST l20,	 Lampz.state(125), Lampz.state(124), Lampz.state(123)		'left ramp arrow
	RGBLED l39a, Lampz.state(128), Lampz.state(127), Lampz.state(126)		'right top lane (metal reflection)

	RGBLED_Prim l17, p17, Lampz.state(83), Lampz.state(82), Lampz.state(81)			'face mouth
	RGBLED_Prim l15, p15, Lampz.state(119), Lampz.state(118), Lampz.state(117)		'face right eye
	RGBLED_Prim l14, p14, Lampz.state(122), Lampz.state(121), Lampz.state(120)		'face left eye
	RGBLED_Prim l40, p40, Lampz.state(92), Lampz.state(91), Lampz.state(90)	'tunes n stuff
	RGBLED_Prim l38, p38, Lampz.state(89), Lampz.state(88), Lampz.state(87)			'center top lane
	RGBLED_Prim l35, p35, Lampz.state(86), Lampz.state(85), Lampz.state(84)			'bell arrow (top)
	RGBLED_Prim l28, p28, Lampz.state(95), Lampz.state(94), Lampz.state(93)			'right loop arrow (mid)
	RGBLED_Prim l36, p36, Lampz.state(98), Lampz.state(97), Lampz.state(96)			'bell arrow (bot)
	RGBLED_Prim l37, p37, Lampz.state(101), Lampz.state(100), Lampz.state(99)		'left top lane
	RGBLED_Prim l26, p26, Lampz.state(104), Lampz.state(103), Lampz.state(102)		'right ramp arrow
	RGBLED_Prim l18, p18, Lampz.state(107), Lampz.state(106), Lampz.state(105)		'left loop arrow (bot)
	RGBLED_Prim l29, p29, Lampz.state(110), Lampz.state(109), Lampz.state(108)		'right loop arrow (bot)
	RGBLED_Prim l52, p52, Lampz.state(113), Lampz.state(112), Lampz.state(111)		'left loop arrow (top)
	RGBLED_Prim l39, p39, Lampz.state(128), Lampz.state(127), Lampz.state(126)		'right top lane


'Tracks
    Flash 65, T_YouShookMe				'YouShookMeAllNightLong
    Flash 66, T_HighwaytoHell			'HighwayToHell
    Flash 67, T_RockNRollTrain			'RockNRollTrain
    Flash 68, T_WholeLottaRosie			'WholeLottaRosie
    Flash 69, T_HellsBells				'HellsBells
    Flash 70, T_ThunderStruck			'ThunderStruck
    Flash 76, T_BackInBlack				'BackInBlack
    Flash 75, T_WarMachine				'WarMachine
    Flash 74, T_ForThoseAbout			'ForThoseAboutToRock
    Flash 73, T_TNT						'TNT
    Flash 72, T_HellAintBad				'HellAintBadPlaceToBe
    Flash 71, T_LetThereBeRock			'LetThereBeRock

'hornet left
	NFadeObjm 53, l57p, "Horns_on", "Horns_off"
	p53.BlendDisableLighting = 10 * lampz.state(53)
'	Flashm 53, f53a		'Train Horn
	Flashm 53, l57
	Flash 53, l57a
'hornet right
	NFadeObjm 54, l58p, "Horns_on", "Horns_off"
	p54.BlendDisableLighting = 10 * lampz.state(54)
'	Flashm 54, f53b		'Train Horn
	Flashm 54, l58		
	Flash 54, l58a

'LED Flames Tunnel
    LampModTunnel 151, l151
    LampModTunnel 152, l152
    LampModTunnel 153, l153
    LampModTunnel 154, l154
    LampModTunnel 155, l155
    LampModTunnel 156, l156
    LampModTunnel 157, l157
    LampModTunnel 158, l158

	'Flashers
'VPM returns an 0-255 range value
	LampzMod 177, f17		'Train
	LampzMod 177, f17a		'Train
	LampzMod 177, f17b		'Train
	LampzMod 177, f17c		'Train
	LampzMod 177, f17r		'Train
	LampzMod 179, f19		'Bottom Arch
	LampzMod 179, f19a		'Bottom Arch
	LampzMod 180, f20		'Left Ramp
'	LampMod 181, f21		'Yellow Dome
'	LampMod 181, f21a		'Yellow Dome
'	LampMod 181, f21c		'Yellow Dome
'	LampMod 181, f21b		'Yellow Dome
'	LampMod 181, f21bDT		'Yellow Dome
'	LampMod 181, f21r		'Yellow Dome
	LampzMod 182, f22 		'Backbox
	LampzMod 182, f22b 		'Backbox
	LampzMod 182, f22c 		'Backbox
	LampzMod 182, f22r 		'Backbox
	LampzMod 183, f23 		'Top Eject
	LampzMod 183, f23a 		'Top Eject
	LampzMod 185, f25a 		'Bumper Flash
	LampzMod 185, f25 		'Bumper Flash
	LampzMod 186, f26 		'Bell Arrow
	LampzMod 187, f27 		'Thunder Left
	LampzMod 187, f27a		'Thunder Left
	LampzMod 187, f27b		'Thunder Left
	LampzMod 187, f27c		'Thunder Left
	LampzMod 188, f28 		'Thunder Center
	LampzMod 188, f28a		'Thunder Center
	LampzMod 188, f28b		'Thunder Center
	LampzMod 188, f28c		'Thunder Center
	LampzMod 189, f29 		'Thunder Right
	LampzMod 189, f29a		'Thunder Right
	LampzMod 189, f29b		'Thunder Right
	LampzMod 189, f29c		'Thunder Right
	LampzMod 190, f30		'Right Ramp
'	LampMod 191, f31 		'Red Dome
'	LampMod 191, f31a		'Red Dome
'	LampMod 191, f31b		'Red Dome
'	LampMod 191, f31c		'Red Dome
'	LampMod 191, f31bDT		'Red Dome
'	LampMod 191, f31bDT1	'Red Dome
'	LampMod 191, f31d		'Red Dome
'	LampMod 191, f31r		'Red Dome

	UpdateGIs

	Lampz.Update2 'updates on frametime (Object updates only)

	' NF Animations
	aLeftSlingArm.Update
	aRightSlingArm.Update
	aLeftSling.Update
	aRightSling.Update
	aCannon.Update
	aAutoPlunger.Update
	aDiverterL.update
	aDiverterR.update

End Sub

Function FlashLevelToIndex(Input, MaxSize)
	FlashLevelToIndex = cInt(MaxSize * Input)
End Function

'***Material Swap***
'Fade material for green, red, yellow colored Bulb prims
Sub FadeMaterialColoredBulb(pri, group, ByVal aLvl)	'cp's script
	'	if Lampz.UseFunction then aLvl = LampFilter(aLvl)	'Callbacks don't get this filter automatically
	if Lampz.UseFunction then aLvl = Lampz.FilterOut(aLvl)	'Callbacks don't get this filter automatically
	Select case FlashLevelToIndex(aLvl, 3)
		Case 0:pri.Material = group(0) 'Off
		Case 1:pri.Material = group(1) 'Fading...
		Case 2:pri.Material = group(2) 'Fading...
		Case 3:pri.Material = group(3) 'Full
	End Select
	'if tb.text <> pri.image then tb.text = pri.image : 'debug.print pri.image end If	'debug
	pri.blenddisablelighting = aLvl * 1 'Intensity Adjustment
End Sub


'Fade material for red, yellow colored bulb Filiment prims
Sub FadeMaterialColoredFiliment(pri, group, ByVal aLvl)	'cp's script
	'	if Lampz.UseFunction then aLvl = LampFilter(aLvl)	'Callbacks don't get this filter automatically
	if Lampz.UseFunction then aLvl = Lampz.FilterOut(aLvl)	'Callbacks don't get this filter automatically
	Select case FlashLevelToIndex(aLvl, 3)
		Case 0:pri.Material = group(0) 'Off
		Case 1:pri.Material = group(1) 'Fading...
		Case 2:pri.Material = group(2) 'Fading...
		Case 3:pri.Material = group(3) 'Full
	End Select
	'if tb.text <> pri.image then tb.text = pri.image : 'debug.print pri.image end If	'debug
	pri.blenddisablelighting = aLvl * 50  'Intensity Adjustment
End Sub


Sub DisableLighting(pri, DLintensity, ByVal aLvl)	'cp's script  DLintensity = disabled lighting intesity
	if Lampz.UseFunction then aLvl = Lampz.FilterOut(aLvl)	'Callbacks don't get this filter automatically
	pri.blenddisablelighting = aLvl * DLintensity
End Sub



Sub InitLampsNF()

	'Filtering (comment out to disable)
	Lampz.Filter = "LampFilter"	'Puts all lamp intensityscale output (no callbacks) through this function before updating

	'Adjust fading speeds (1 / full MS fading time)
	dim x
	for x = 0 to 200
		Lampz.FadeSpeedUp(x) = 1/5 
		Lampz.FadeSpeedDown(x) = 1/40
		LampState(x) = 0         ' current light state, independent of the fading level. 0 is off and 1 is on
		FadingLevel(x) = 4       ' used to track the fading state
		FlashSpeedUp(x) = 0.5    ' faster speed when turning on the flasher
		FlashSpeedDown(x) = 0.35 ' slower speed when turning off the flasher
		FlashMax(x) = 1          ' the maximum value when on, usually 1
		FlashMin(x) = 0          ' the minimum value when off, usually 0
		FlashLevel(x) = 0        ' the intensity of the flashers, usually from 0 to 1
		ModulationLevel(x) = 0	 ' the starting modulation level, from 0 to 255
	next

	'Lampz Assignments
	'  In a ROM based table, the lamp ID is used to set the state of the Lampz objects

	'MassAssign is an optional way to do assignments. It'll create arrays automatically / append objects to existing arrays
	Lampz.MassAssign(1) = l41 ' Jam Multiball
	Lampz.Callback(1) = "DisableLighting p41, 50,"
	Lampz.MassAssign(2) = l42 ' Super Targets
	Lampz.Callback(2) = "DisableLighting p42, 50,"
	Lampz.MassAssign(3) = l43 ' Super Lanes
	Lampz.Callback(3) = "DisableLighting p43, 50,"
	Lampz.MassAssign(4) = l44 ' Album Multiball
	Lampz.Callback(4) = "DisableLighting p44, 50,"
	Lampz.MassAssign(5) = l45 ' Cannon Fodder
	Lampz.Callback(5) = "DisableLighting p45, 50,"
	Lampz.MassAssign(6) = l46 ' Cannon Volley
	Lampz.Callback(6) = "DisableLighting p46, 50,"
	Lampz.MassAssign(7) = l47 ' Cannon Chaos
	Lampz.Callback(7) = "DisableLighting p47, 50,"
	Lampz.MassAssign(8) = l48 ' Rock Again
	Lampz.Callback(8) = "DisableLighting p48, 50,"
	Lampz.MassAssign(9) = l51 ' Super Loops
	Lampz.Callback(9) = "DisableLighting p51, 50,"
	Lampz.MassAssign(10) = l50 ' Super Combos
	Lampz.Callback(10) = "DisableLighting p50, 50,"
    Lampz.MassAssign(11) =  l49 ' Tour Multiball
	Lampz.Callback(11) = "DisableLighting p49, 50,"
    Lampz.MassAssign(12) =  l3 ' F in FIRE
	Lampz.Callback(12) = "DisableLighting p3, 50,"
    Lampz.MassAssign(13) =  l4 ' I in FIRE
	Lampz.Callback(13) = "DisableLighting p4, 50,"
    Lampz.MassAssign(14) =  l5 ' 2x
	Lampz.Callback(14) = "DisableLighting p5, 50,"

    Lampz.MassAssign(17) =  l9  ' AC/DC Last C
	Lampz.Callback(17) = "DisableLighting p9, 50,"
    Lampz.MassAssign(18) =  l10 ' AC/DC  D
	Lampz.Callback(18) = "DisableLighting p10, 50,"
    Lampz.MassAssign(19) =  l11 ' AC/DC  /
	Lampz.Callback(19) = "DisableLighting p11, 50,"
    Lampz.MassAssign(20) =  l12 ' AC/DC First C
	Lampz.Callback(20) = "DisableLighting p12, 50,"
    Lampz.MassAssign(21) =  l13 ' AC/DC A
	Lampz.Callback(21) = "DisableLighting p13, 50,"
    Lampz.MassAssign(22) =  l19 ' Left Lightning Bolt
	Lampz.Callback(22) = "DisableLighting p19, 50,"
    Lampz.MassAssign(23) =  l21 ' Middle Lightning Bolt
	Lampz.Callback(23) = "DisableLighting p21, 50,"
    Lampz.MassAssign(24) =  l25
	Lampz.Callback(24) = "DisableLighting p25, 50,"
    Lampz.MassAssign(25) =  l1
	Lampz.Callback(25) = "DisableLighting p1, 50,"
	
    'TrainFrontLight.BlendDisableLighting = 10 * LampState(32)
    Lampz.MassAssign(32) = f32
	Lampz.Callback(32) = "DisableLighting TrainFrontLight, 200,"
    Lampz.MassAssign(33) = l33 ' K in ROCK
	Lampz.Callback(33) = "DisableLighting p33, 50,"
    Lampz.MassAssign(34) = l32 ' C in ROCK
	Lampz.Callback(34) = "DisableLighting p32, 50,"
    Lampz.MassAssign(35) = l31 ' O in ROCK
	Lampz.Callback(35) = "DisableLighting p31, 50,"
    Lampz.MassAssign(36) = l30 ' R in ROCK
	Lampz.Callback(36) = "DisableLighting p30, 50,"
    Lampz.MassAssign(37) = l2
	Lampz.Callback(37) = "DisableLighting p2, 250,"
    Lampz.MassAssign(38) = l34 ' Special
	Lampz.Callback(38) = "DisableLighting p34, 50,"

 
    Lampz.MassAssign(40) = l27 ' Extra Ball
	Lampz.Callback(40) = "DisableLighting p27, 50,"
    Lampz.MassAssign(41) = l64 ' Right Lighting Bolt
	Lampz.Callback(41) = "DisableLighting p64, 50,"
    Lampz.MassAssign(42) = l6 ' 3X
	Lampz.Callback(42) = "DisableLighting p6, 50,"
    Lampz.MassAssign(43) = l7 ' R in FIRE
	Lampz.Callback(43) = "DisableLighting p7, 50,"
    Lampz.MassAssign(44) = l8 ' E in FIRE
	Lampz.Callback(44) = "DisableLighting p8, 50,"

    Lampz.MassAssign(49) = l22 ' T
	Lampz.Callback(49) = "DisableLighting p22, 50,"
    Lampz.MassAssign(50) = l23 ' N
	Lampz.Callback(50) = "DisableLighting p23, 50,"
    Lampz.MassAssign(51) = l24 ' T
	Lampz.Callback(51) = "DisableLighting p24, 50,"

'hornet left
'	Lampz.MassAssign(53) = l57a
'	Lampz.MassAssign(53) = l57
'	Lampz.Callback(53) = "DisableLighting p53, 200,"
'	Lampz.Callback(53) = "DisableLighting l57p, 200,"

'hornet right
'	Lampz.MassAssign(54) = l58a
'	Lampz.MassAssign(54) = l58
'	Lampz.Callback(54) = "DisableLighting p54, 200,"
'	Lampz.Callback(54) = "DisableLighting l58p, 200,"

'Start Button
	Lampz.MassAssign(57)= l100
	Lampz.Callback(57) = "DisableLighting PinCab_Start_Button_Inner_Ring, 5,"
	'Lampz.Callback(57) = "DisableLightingMinMax PinCab_Start_Button_Inner_Ring, 157, 5,"

'Tournament Button
	Lampz.MassAssign(58)= l101
	Lampz.Callback(58) = "DisableLighting PinCab_Tournament_Button, 5,"

'Bumpers
    Lampz.MassAssign(62) = l60
    Lampz.MassAssign(62) = l60a
    Lampz.MassAssign(62) = l60b
	Lampz.Callback(62) = "DisableLighting p60, 50,"
    Lampz.MassAssign(63) = l61
    Lampz.MassAssign(63) = l61a
    Lampz.MassAssign(63) = l61b
	Lampz.Callback(63) = "DisableLighting p61, 50,"
    Lampz.MassAssign(64) = l62
    Lampz.MassAssign(64) = l62a
    Lampz.MassAssign(64) = l62b
	Lampz.Callback(64) = "DisableLighting p62, 50,"

''Tracks
'    Lampz.MassAssign(65) = T_YouShookMe				'YouShookMeAllNightLong
'    Lampz.MassAssign(66) = T_HighwaytoHell			'HighwayToHell
'    Lampz.MassAssign(67) = T_RockNRollTrain			'RockNRollTrain
'    Lampz.MassAssign(68) = T_WholeLottaRosie			'WholeLottaRosie
'    Lampz.MassAssign(69) = T_HellsBells				'HellsBells
'    Lampz.MassAssign(70) = T_ThunderStruck			'ThunderStruck
'    Lampz.MassAssign(76) = T_BackInBlack				'BackInBlack
'    Lampz.MassAssign(75) = T_WarMachine				'WarMachine
'    Lampz.MassAssign(74) = T_ForThoseAbout			'ForThoseAboutToRock
'    Lampz.MassAssign(73) = T_TNT						'TNT
'    Lampz.MassAssign(72) = T_HellAintBad				'HellAintBadPlaceToBe
'    Lampz.MassAssign(71) = T_LetThereBeRock			'LetThereBeRock

'LED Flames Tunnel
'    Lampz.MassAssign(151) = l151
'    Lampz.MassAssign(152) = l152
'    Lampz.MassAssign(153) = l153
'    Lampz.MassAssign(154) = l154
'    Lampz.MassAssign(155) = l155
'    Lampz.MassAssign(156) = l156
'    Lampz.MassAssign(157) = l157
'    Lampz.MassAssign(158) = l158

'	Lampz.MassAssign(1)= l1
'	Lampz.Callback(1) = "DisableLighting p1, 200,"
'	Lampz.MassAssign(2)= l2
'	Lampz.Callback(2) = "DisableLighting p2, 200,"
'	Lampz.MassAssign(3)= l3
'	Lampz.Callback(3) = "DisableLighting p3, 200,"
'	Lampz.MassAssign(6)= l6
'	Lampz.Callback(6) = "DisableLighting p6, 200,"
'	Lampz.MassAssign(7)= l7
'	Lampz.Callback(7) = "DisableLighting p7, 200,"
'	Lampz.MassAssign(8)= l8
'	Lampz.Callback(8) = "DisableLighting p8, 200,"
'	Lampz.MassAssign(9)= l9
'	Lampz.Callback(9) = "DisableLighting p9, 200,"
'	Lampz.MassAssign(11)= l11
'	Lampz.Callback(11) = "DisableLighting p11, 200,"
'	Lampz.MassAssign(12)= l12
'	Lampz.Callback(12) = "DisableLighting p12, 130,"
'	Lampz.MassAssign(13)= l13
'	Lampz.Callback(13) = "DisableLighting p13, 50,"
'	Lampz.MassAssign(14)= l14
'	Lampz.Callback(14) = "DisableLighting p14, 200,"
'	Lampz.MassAssign(15)= l15
'	Lampz.Callback(15) = "DisableLighting p15, 200,"
'	Lampz.MassAssign(16)= l16
'	Lampz.Callback(16) = "DisableLighting p16, 200,"
'	Lampz.MassAssign(17)= l17
'	Lampz.Callback(17) = "DisableLighting p17, 50,"
'	Lampz.MassAssign(18)= l18
'	Lampz.Callback(18) = "DisableLighting p18, 50,"
'	Lampz.MassAssign(19)= l19
'	Lampz.Callback(19) = "DisableLighting p19, 200,"
'	Lampz.MassAssign(20)= l20
'	Lampz.Callback(20) = "DisableLighting p20, 50,"
'	Lampz.MassAssign(21)= l21
'	Lampz.Callback(21) = "DisableLighting p21, 60,"
'	Lampz.MassAssign(22)= l22
'	Lampz.Callback(22) = "DisableLighting p22, 60,"
'	Lampz.MassAssign(23)= l23
'	Lampz.Callback(23) = "DisableLighting p23, 200,"


	'Turn off all lamps on startup
	Lampz.Init	'This just turns state of any lamps to 1

	'Immediate update to turn on GI, turn off lamps
	Lampz.Update

End Sub


'====================
'Class jungle nf
'====================

'No-op object instead of adding more conditionals to the main loop
'It also prevents errors if empty lamp numbers are called, and it's only one object
'should be g2g?

Class NullFadingObject : Public Property Let IntensityScale(input) : : End Property : End Class

'version 0.11 - Mass Assign, Changed modulate style
'version 0.12 - Update2 (single -1 timer update) update method for core.vbs
'Version 0.12a - Filter can now be accessed via 'FilterOut'
'Version 0.12b - Changed MassAssign from a sub to an indexed property (new syntax: lampfader.MassAssign(15) = Light1 )
'Version 0.13 - No longer requires setlocale. Callback() can be assigned multiple times per index
' Note: if using multiple 'LampFader' objects, set the 'name' variable to avoid conflicts with callbacks

Class LampFader
	Public FadeSpeedDown(200), FadeSpeedUp(200)
	Private Lock(200), Loaded(200), OnOff(200)
	Public UseFunction
	Private cFilter
	Public UseCallback(200), cCallback(200)
	Public Lvl(200), Obj(200)
	Private Mult(200)
	Public FrameTime
	Private InitFrame
	Public Name

	Sub Class_Initialize()
		InitFrame = 0
		dim x : for x = 0 to uBound(OnOff) 	'Set up fade speeds
			FadeSpeedDown(x) = 1/100	'fade speed down
			FadeSpeedUp(x) = 1/80		'Fade speed up
			UseFunction = False
			lvl(x) = 0
			OnOff(x) = False
			Lock(x) = True : Loaded(x) = False
			Mult(x) = 1
		Next
		Name = "LampFaderNF" 'NEEDS TO BE CHANGED IF THERE'S MULTIPLE OF THESE OBJECTS, OTHERWISE CALLBACKS WILL INTERFERE WITH EACH OTHER!!
		for x = 0 to uBound(OnOff) 		'clear out empty obj
			if IsEmpty(obj(x) ) then Set Obj(x) = NullFader' : Loaded(x) = True
		Next
	End Sub

	Public Property Get Locked(idx) : Locked = Lock(idx) : End Property		''debug.print Lampz.Locked(100)	'debug
	Public Property Get state(idx) : state = OnOff(idx) : end Property
	Public Property Let Filter(String) : Set cFilter = GetRef(String) : UseFunction = True : End Property
	Public Function FilterOut(aInput) : if UseFunction Then FilterOut = cFilter(aInput) Else FilterOut = aInput End If : End Function
	'Public Property Let Callback(idx, String) : cCallback(idx) = String : UseCallBack(idx) = True : End Property
	Public Property Let Callback(idx, String)
		UseCallBack(idx) = True
		'cCallback(idx) = String 'old execute method
		'New method: build wrapper subs using ExecuteGlobal, then call them
		cCallback(idx) = cCallback(idx) & "___" & String	'multiple strings dilineated by 3x _

		dim tmp : tmp = Split(cCallback(idx), "___")

		dim str, x : for x = 0 to uBound(tmp)	'build proc contents
			'If Not tmp(x)="" then str = str & "	" & tmp(x) & " aLVL" & "	'" & x & vbnewline	'more verbose
			If Not tmp(x)="" then str = str & tmp(x) & " aLVL:"
		Next
		'msgbox "Sub " & name & idx & "(aLvl):" & str & "End Sub"
		dim out : out = "Sub " & name & idx & "(aLvl):" & str & "End Sub"
		'if idx = 132 then msgbox out	'debug
		ExecuteGlobal Out

	End Property

	Public Property Let state(ByVal idx, input) 'Major update path
		if Input <> OnOff(idx) then  'discard redundant updates
			OnOff(idx) = input
			Lock(idx) = False
			Loaded(idx) = False
		End If
	End Property

	'Mass assign, Builds arrays where necessary
	'Sub MassAssign(aIdx, aInput)
	Public Property Let MassAssign(aIdx, aInput)
		If typename(obj(aIdx)) = "NullFadingObject" Then 'if empty, use Set
			if IsArray(aInput) then
				obj(aIdx) = aInput
			Else
				Set obj(aIdx) = aInput
			end if
		Else
			Obj(aIdx) = AppendArray(obj(aIdx), aInput)
		end if
	end Property

	Sub SetLamp(aIdx, aOn) : state(aIdx) = aOn : End Sub	'Solenoid Handler

	Public Sub TurnOnStates()	'If obj contains any light objects, set their states to 1 (Fading is our job!)
		dim debugstr
		dim idx : for idx = 0 to uBound(obj)
			if IsArray(obj(idx)) then
				'debugstr = debugstr & "array found at " & idx & "..."
				dim x, tmp : tmp = obj(idx) 'set tmp to array in order to access it
				for x = 0 to uBound(tmp)
					if typename(tmp(x)) = "Light" then DisableState tmp(x)' : debugstr = debugstr & tmp(x).name & " state'd" & vbnewline
					tmp(x).intensityscale = 0.001 ' this can prevent init stuttering
				Next
			Else
				if typename(obj(idx)) = "Light" then DisableState obj(idx)' : debugstr = debugstr & obj(idx).name & " state'd (not array)" & vbnewline
				obj(idx).intensityscale = 0.001 ' this can prevent init stuttering
			end if
		Next
		''debug.print debugstr
	End Sub
	Private Sub DisableState(ByRef aObj) : aObj.FadeSpeedUp = 1000 : aObj.State = 1 : End Sub	'turn state to 1

	Public Sub Init()	'Just runs TurnOnStates right now
		TurnOnStates
	End Sub

	Public Property Let Modulate(aIdx, aCoef) : Mult(aIdx) = aCoef : Lock(aIdx) = False : Loaded(aIdx) = False: End Property
	Public Property Get Modulate(aIdx) : Modulate = Mult(aIdx) : End Property

	Public Sub Update1()	 'Handle all boolean numeric fading. If done fading, Lock(x) = True. Update on a '1' interval Timer!
		dim x : for x = 0 to uBound(OnOff)
			if not Lock(x) then 'and not Loaded(x) then
				if OnOff(x) then 'Fade Up
					Lvl(x) = Lvl(x) + FadeSpeedUp(x)
					if Lvl(x) >= 1 then Lvl(x) = 1 : Lock(x) = True
				elseif Not OnOff(x) then 'fade down
					Lvl(x) = Lvl(x) - FadeSpeedDown(x)
					if Lvl(x) <= 0 then Lvl(x) = 0 : Lock(x) = True
				end if
			end if
		Next
	End Sub

	Public Sub Update2()	 'Both updates on -1 timer (Lowest latency, but less accurate fading at 60fps vsync)
		FrameTime = gametime - InitFrame : InitFrame = GameTime	'Calculate frametime
		dim x : for x = 0 to uBound(OnOff)
			if not Lock(x) then 'and not Loaded(x) then
				if OnOff(x) then 'Fade Up
					Lvl(x) = Lvl(x) + FadeSpeedUp(x) * FrameTime
					if Lvl(x) >= 1 then Lvl(x) = 1 : Lock(x) = True
				elseif Not OnOff(x) then 'fade down
					Lvl(x) = Lvl(x) - FadeSpeedDown(x) * FrameTime
					if Lvl(x) <= 0 then Lvl(x) = 0 : Lock(x) = True
				end if
			end if
		Next
		Update
	End Sub

	Public Sub Update()	'Handle object updates. Update on a -1 Timer! If done fading, loaded(x) = True
		dim x,xx : for x = 0 to uBound(OnOff)
			if not Loaded(x) then
				if IsArray(obj(x) ) Then	'if array
					If UseFunction then
						for each xx in obj(x) : xx.IntensityScale = cFilter(Lvl(x)*Mult(x)) : Next
					Else
						for each xx in obj(x) : xx.IntensityScale = Lvl(x)*Mult(x) : Next
					End If
				else						'if single lamp or flasher
					If UseFunction then
						obj(x).Intensityscale = cFilter(Lvl(x)*Mult(x))
					Else
						obj(x).Intensityscale = Lvl(x)
					End If
				end if
				if TypeName(lvl(x)) <> "Double" and typename(lvl(x)) <> "Integer" then msgbox "uhh " & 2 & " = " & lvl(x)
				'If UseCallBack(x) then execute cCallback(x) & " " & (Lvl(x))	'Callback
				If UseCallBack(x) then Proc name & x,Lvl(x)*mult(x)	'Proc
				If Lock(x) Then
					if Lvl(x) = 1 or Lvl(x) = 0 then Loaded(x) = True	'finished fading
				end if
			end if
		Next
	End Sub
End Class


'Lamp Filter
Function LampFilter(aLvl)
	LampFilter = aLvl^1.6	'exponential curve?
End Function


'Helper functions
Sub Proc(string, Callback)	'proc using a string and one argument
	'On Error Resume Next
	dim p : Set P = GetRef(String)
	P Callback
	If err.number = 13 then  msgbox "Proc error! No such procedure: " & vbnewline & string
	if err.number = 424 then msgbox "Proc error! No such Object"
End Sub

Function AppendArray(ByVal aArray, aInput)	'append one value, object, or Array onto the end of a 1 dimensional array
	if IsArray(aInput) then 'Input is an array...
		dim tmp : tmp = aArray
		If not IsArray(aArray) Then	'if not array, create an array
			tmp = aInput
		Else						'Append existing array with aInput array
			Redim Preserve tmp(uBound(aArray) + uBound(aInput)+1)	'If existing array, increase bounds by uBound of incoming array
			dim x : for x = 0 to uBound(aInput)
				if isObject(aInput(x)) then
					Set tmp(x+uBound(aArray)+1 ) = aInput(x)
				Else
					tmp(x+uBound(aArray)+1 ) = aInput(x)
				End If
			Next
			AppendArray = tmp	 'return new array
		End If
	Else 'Input is NOT an array...
		If not IsArray(aArray) Then	'if not array, create an array
			aArray = Array(aArray, aInput)
		Else
			Redim Preserve aArray(uBound(aArray)+1)	'If array, increase bounds by 1
			if isObject(aInput) then
				Set aArray(uBound(aArray)) = aInput
			Else
				aArray(uBound(aArray)) = aInput
			End If
		End If
		AppendArray = aArray 'return new array
	End If
End Function


dim RGBSaturation	' Amount of desaturation applied to the RGB inserts. Adjust to taste.
dim BlueCoef 		' dirty hue shift to make blues more green
dim BlueIntensityMult  ' overall intensity of blue color

RGBSaturation = 0.1
BlueCoef = 0.12
BlueIntensityMult = 1.5

Sub RGBLED (object,byval red,byval green, byval blue) ' test 
	dim intensity : intensity = 1
	if (red + green + blue) > 0 then 
		Desat3 red,green,blue, intensity ' NF desat ' out intensity
	end if
	If TypeName(object) = "Light" Then
		object.color = RGB(0,0,0)
		object.colorfull = RGB(2.5*red,2.5*green,2.5*blue)
		object.state=1
		object.IntensityScale = 1 * intensity
	ElseIf TypeName(object) = "Flasher" Then
		object.color = RGB(2.5*red,2.5*green,2.5*blue)
		object.IntensityScale = 1 * intensity
	End If
End Sub

Sub RGBLED_Prim (object, prim1, byval red,byval green, byval blue)
	dim lumincoef
	dim intensity : intensity = 1
	if (red + green + blue) > 0 then 
		Desat3 red,green,blue, intensity ' NF desat ' out intensity
	end if
	If TypeName(object) = "Light" Then
		object.color = RGB(0,0,0)
		object.colorfull = RGB(2.5*red,2.5*green,2.5*blue)
		object.state=1
		object.IntensityScale = 1 * intensity
		'DisableLighting prim1, 200, 50
		prim1.color = RGB(2.5*red,2.5*green,2.5*blue)
		prim1.blenddisablelighting=1 * intensity
	ElseIf TypeName(object) = "Flasher" Then
		object.color = RGB(2.5*red,2.5*green,2.5*blue)
		object.IntensityScale = 1 * intensity
	End If
End Sub

function DeSat3(r,g,b,ByRef intensity)	'simple desaturation function NF with extra blue intensity
	dim f, L, new_r, new_g, new_b
	L = 0.3*r + 0.59*g + 0.11*b
	new_r = r + RGBSaturation * (L - r)
	new_g = g + RGBSaturation * (L - g) + b*BlueCoef
	new_b = b + RGBSaturation * (L - b)
	if new_r > 100 then new_r = 100
	if new_g > 100 then new_g = 100
	if new_b > 100 then new_b = 100
	r = new_r : g = new_g : b = new_b

	dim bl : bl = (b - g*0.99 - r*0.96)/100 : if bl < 0 then bl = 0

	intensity = 1 + (bl * BlueIntensityMult)

'	tb.text=" bl=" & round(bl,2) & " intensity:" & Round(intensity,2)

End Function

function DeSat(r,g,b)	'simple desaturation function NF
	dim f, L, new_r, new_g, new_b
	f = RGBSaturation
	L = 0.3*r + 0.59*g + 0.11*b
	new_r = r + f * (L - r)
	new_g = g + f * (L - g) + b*BlueCoef
	new_b = b + f * (L - b)
	if new_r > 100 then new_r = 100
	if new_g > 100 then new_g = 100
	if new_b > 100 then new_b = 100
	r = new_r : g = new_g : b = new_b
End Function



Sub LampzMod(nr, object)
	Object.IntensityScale = ModulationLevel(nr)/128
	'Debug.print "ModulationLevel(" & nr & ") = " & ModulationLevel(nr)/128
	'Debug.print "Lampz.state(" & nr & ") = " & Lampz.state(nr)
	If TypeName(object) = "Light" Then
		Object.State = Lampz.state(nr)
	End If
	If TypeName(object) = "Flasher" Then
		Object.visible = Lampz.state(nr)
	End If
End Sub

' Flasher objects

Sub Flash(nr, object)
    Select Case FadingLevel(nr)
        Case 4 'off
            FlashLevel(nr) = FlashLevel(nr) - FlashSpeedDown(nr)
            If FlashLevel(nr) < FlashMin(nr) Then
                FlashLevel(nr) = FlashMin(nr)
                FadingLevel(nr) = 0 'completely off
            End if
            Object.IntensityScale = FlashLevel(nr)
        Case 5 ' on
            FlashLevel(nr) = FlashLevel(nr) + FlashSpeedUp(nr)
            If FlashLevel(nr) > FlashMax(nr) Then
                FlashLevel(nr) = FlashMax(nr)
                FadingLevel(nr) = 1 'completely on
            End if
            Object.IntensityScale = FlashLevel(nr)
    End Select
End Sub

Sub Flashm(nr, object) 'multiple flashers, it just sets the flashlevel
    Object.IntensityScale = FlashLevel(nr)
End Sub


' Modulated Flasher and Lights objects

Sub SetLampMod(nr, value)
    If value > 0 Then
		Lampz.state(nr) = 1
	Else
		Lampz.state(nr) = 0
	End If
	ModulationLevel(nr) = value
End Sub

Sub NFadeObjm(nr, object, a, b)
    Select Case FadingLevel(nr)
        Case 4:object.image = b
        Case 5:object.image = a
    End Select
End Sub

Sub LampModTunnel(nr, object)    ' FadingLevel is 4 or 259 (0+4, 254+5?)
    if FadingLevel(nr) = 4 Then
        FadingLevel(nr) = 0 ' off
        object.visible = False
    elseif FadingLevel(nr) > 255 then
        FadingLevel(nr) = 1 ' on
        object.visible = True
    end If
End Sub

'******************************************************
'****  END LAMPZ
'******************************************************

Dim gi_red_intensity, gi_lpf_intensity

If DesktopMode Then
	gi_red_intensity = 1.5
	gi_lpf_intensity = 1.5
Else
	gi_red_intensity = 0.25
	gi_lpf_intensity = 0.6
End If

Sub UpdateGIs
	'VPM returns an 0-50 range value
	'130 gi red
	For each bulb in GI_Red: bulb.Intensity = Lampz.state(130)*gi_red_intensity: Next
	For Each bulb in BLRLights: bulb.IntensityScale=Lampz.state(130)/50:Next
	bulb2.BlendDisableLighting = 8*Lampz.state(130)/50
	bulb4.BlendDisableLighting = 8*Lampz.state(130)/50
	bulb6.BlendDisableLighting = 8*Lampz.state(130)/50
	MaterialColor "TrainRed", RGB(255*Lampz.state(130)/50,255*Lampz.state(130)/50, 255*Lampz.state(130)/50)
	'132 gi blue
	For each bulb in GI_Blue: bulb.Intensity = Lampz.state(132)*1.5: Next
	For Each bulb in BLBLights: bulb.IntensityScale=Lampz.state(132)/50:Next
	bulb1.BlendDisableLighting = 8*Lampz.state(132)/50
	bulb3.BlendDisableLighting = 8*Lampz.state(132)/50
	bulb5.BlendDisableLighting = 8*Lampz.state(132)/50
	bulb7.BlendDisableLighting = 8*Lampz.state(132)/50
	MaterialColor "TrainBlue", RGB(255*Lampz.state(132)/50,255*Lampz.state(132)/50, 255*Lampz.state(132)/50)
	'134 gi low pf
	light16.intensityScale = Lampz.state(134)/50
	light19.intensityScale = Lampz.state(134)/50
	light44.intensityScale = Lampz.state(134)/50
	light45.intensityScale = Lampz.state(134)/50
	For each bulb in GI_LowPF: bulb.Intensity = Lampz.state(134)*gi_lpf_intensity: Next
	'136 gi white
	For each bulb in GI_White: bulb.IntensityScale = Lampz.state(136)/50: Next
	'change colorgrade when gi is off
	If Lampz.state(130) = 0 AND Lampz.state(132) = 0 AND Lampz.state(136) = 0 Then
'		ACDC.ColorGradeImage="ColorGrade_off":Translite.Blenddisablelighting=0.2:For Each bulb in BandMembersPoster: bulb.IntensityScale=0 :Next
		ACDC.ColorGradeImage="ColorGrade_off":LM_Translite.intensityscale=0:For Each bulb in BandMembersPoster: bulb.IntensityScale=0 :Next
	ElseIf Lampz.state(130) > 0 AND Lampz.state(132) = 0 AND Lampz.state(134) > 0  AND Lampz.state(136) = 0 Then ACDC.ColorGradeImage="ColorGrade_red"
	ElseIf Lampz.state(130) = 0 AND Lampz.state(132) > 0 AND Lampz.state(134) = 0  AND Lampz.state(136) = 0 Then ACDC.ColorGradeImage="ColorGrade_blue"
	Else
'		ACDC.ColorGradeImage="ColorGrade_on":Translite.Blenddisablelighting=4:For Each bulb in BandMembersPoster: bulb.IntensityScale=1:Next
		ACDC.ColorGradeImage="ColorGrade_on":LM_Translite.intensityscale=1:For Each bulb in BandMembersPoster: bulb.IntensityScale=1:Next
	End If
End Sub

'******************************************************
'  SLINGSHOT CORRECTION FUNCTIONS
'******************************************************
' To add these slingshot corrections:
' 	- On the table, add the endpoint primitives that define the two ends of the Slingshot
'	- Initialize the SlingshotCorrection objects in InitSlingCorrection
' 	- Call the .VelocityCorrect methods from the respective _Slingshot event sub


dim LS : Set LS = New SlingshotCorrection
dim RS : Set RS = New SlingshotCorrection

InitSlingCorrection

Sub InitSlingCorrection

	LS.Object = LeftSlingshot
	LS.EndPoint1 = EndPoint1LS
	LS.EndPoint2 = EndPoint2LS

	RS.Object = RightSlingshot
	RS.EndPoint1 = EndPoint1RS
	RS.EndPoint2 = EndPoint2RS

	'Slingshot angle corrections (pt, BallPos in %, Angle in deg)
	' These values are best guesses. Retune them if needed based on specific table research.
	AddSlingsPt 0, 0.00,	-4
	AddSlingsPt 1, 0.45,	-7
	AddSlingsPt 2, 0.48,	0
	AddSlingsPt 3, 0.52,	0
	AddSlingsPt 4, 0.55,	7
	AddSlingsPt 5, 1.00,	4

End Sub


Sub AddSlingsPt(idx, aX, aY)        'debugger wrapper for adjusting flipper script in-game
	dim a : a = Array(LS, RS)
	dim x : for each x in a
		x.addpoint idx, aX, aY
	Next
End Sub

'' The following sub are needed, however they may exist somewhere else in the script. Uncomment below if needed
'Dim PI: PI = 4*Atn(1)
'Function dSin(degrees)
'	dsin = sin(degrees * Pi/180)
'End Function
'Function dCos(degrees)
'	dcos = cos(degrees * Pi/180)
'End Function
'
'Function RotPoint(x,y,angle)
'    dim rx, ry
'    rx = x*dCos(angle) - y*dSin(angle)
'    ry = x*dSin(angle) + y*dCos(angle)
'    RotPoint = Array(rx,ry)
'End Function

Class SlingshotCorrection
	Public DebugOn, Enabled
	private Slingshot, SlingX1, SlingX2, SlingY1, SlingY2

	Public ModIn, ModOut
	Private Sub Class_Initialize : redim ModIn(0) : redim Modout(0): Enabled = True : End Sub 

	Public Property let Object(aInput) : Set Slingshot = aInput : End Property
	Public Property Let EndPoint1(aInput) : SlingX1 = aInput.x: SlingY1 = aInput.y: End Property
	Public Property Let EndPoint2(aInput) : SlingX2 = aInput.x: SlingY2 = aInput.y: End Property

	Public Sub AddPoint(aIdx, aX, aY) 
		ShuffleArrays ModIn, ModOut, 1 : ModIn(aIDX) = aX : ModOut(aIDX) = aY : ShuffleArrays ModIn, ModOut, 0
		If gametime > 100 then Report
	End Sub

	Public Sub Report()         'debug, reports all coords in tbPL.text
		If not debugOn then exit sub
		dim a1, a2 : a1 = ModIn : a2 = ModOut
		dim str, x : for x = 0 to uBound(a1) : str = str & x & ": " & round(a1(x),4) & ", " & round(a2(x),4) & vbnewline : next
		TBPout.text = str
	End Sub


	Public Sub VelocityCorrect(aBall)
		dim BallPos, XL, XR, YL, YR
		
		'Assign right and left end points
		If SlingX1 < SlingX2 Then 
			XL = SlingX1 : YL = SlingY1 : XR = SlingX2 : YR = SlingY2
		Else
			XL = SlingX2 : YL = SlingY2 : XR = SlingX1 : YR = SlingY1
		End If

		'Find BallPos = % on Slingshot
		If Not IsEmpty(aBall.id) Then 
			If ABS(XR-XL) > ABS(YR-YL) Then 
				BallPos = PSlope(aBall.x, XL, 0, XR, 1)
			Else
				BallPos = PSlope(aBall.y, YL, 0, YR, 1)
			End If
			If BallPos < 0 Then BallPos = 0
			If BallPos > 1 Then BallPos = 1
		End If

		'Velocity angle correction
		If not IsEmpty(ModIn(0) ) then
			Dim Angle, RotVxVy
			Angle = LinearEnvelope(BallPos, ModIn, ModOut)
			'debug.print " BallPos=" & BallPos &" Angle=" & Angle 
			'debug.print " BEFORE: aBall.Velx=" & aBall.Velx &" aBall.Vely" & aBall.Vely 
			RotVxVy = RotPoint(aBall.Velx,aBall.Vely,Angle)
			If Enabled then aBall.Velx = RotVxVy(0)
			If Enabled then aBall.Vely = RotVxVy(1)
			'debug.print " AFTER: aBall.Velx=" & aBall.Velx &" aBall.Vely" & aBall.Vely 
			'debug.print " " 
		End If
	End Sub

End Class






sub MiniPFBallReflectionMask_Hit() : activeball.ReflectionEnabled=false : end Sub
sub MiniPFBallReflectionMask_UnHit() : activeball.ReflectionEnabled=true : end Sub



' Keyframe Animation ver 2 by NFOZZY   ver0.00002
' Interpolation math adapted from "Smooth interpolation of irregularly spaced keyframes" by Jon Langridge http://archive.gamedev.net/archive/reference/articles/article1497.html 

' Prerequisites: 
'   FRAMETIME global variable. Calculated like this: FrameTime = gametime - InitFrame : InitFrame = GameTime

' SETUP:
'   .Update()                  - Updating on a timer is Required. For best results use the same timer that does the frametime calculation
'   .AddPoint keyframe number, Total Time in MS, Value          - defines a keyframe. Keyframe numbers must start at 0 and must be defined in order!
'   .AddPoint2 keyframe number, Time this frame lingers, Value  - alternative version of the above where keyframe time reflects how long the current frame is (experimental, keep position 0 at x=0)
'   .CallBack(string)           - Defines the subroutine to be called. Called with one value, this will have to be plugged into whatever you're animating. Must be in quotes (ex: .CallBack("animSlingshot") ) 
'   .InterpolationType = [number between 0-2]      - define interpolation type. 0 = linear, 1 = Zero-Gradient Cubic (default), 2 = Catmull-Rom Spline Interpolation

' USAGE: 
'   .Play()                 - Play Once
'   .PlayImmediate()        - Play Once, resetting animation if necessary 
'   .PlayLoop()             - Play Forever. End with .Play() .PlayImmediate() or .Stop()
'   .Pause()                - Pause animation in place
'   .ResumeAnim()           - Resumes a paused animation. Alternatively use .Play() or .PlayLoop()
'   .StopAnim()             - Stop animation and reset to first keyframe
' ... multiple animations ...
'   .PlayFrom [ms integer]  - Play Once, starting at this millisecond
'   .PlayTo [ms integer]    - Play Once, ending at this millisecond
'   .PlayFromTo [start], [end] - Play Once, starting at [start millisecond] and ending at [end millisecond]. If end is 0 it'll work the same as PlayFrom
' ... info (read only) ...
'   .State                  - (property) returns true or false. True means animation is currently running
'   .Pos                    - (property) returns timecode in milliseconds. If not running, it will be 0

' DEBUG: 
'   .timescale = [float number] - multiplies time (default 1). Ex: setting to 0.5 will play at half speed
'   .TEST()                     - Debug window command, will print X and Y data in debugger 

' NOTE:
' Catmull-Rom Spline Interpolation (.InterpolationType=2) is very "wiggly". Make sure the target has room to overtravel!
'  - checking output with .TEST() is hightly recommended when using Spline interpolation!! Copy the values into a plot such as https://www.desmos.com/calculator

class cAnimation2

    private KeyX, KeyY
    private lock, ms, endMS, UpdateSub, UpdateSubRef

    private LoopAnim

    public timescale
    public InterpolationType ' 0 = linear, 1 = Zero-Gradient Cubic (default), 2 = Catmull-Rom Spline

	Private Sub Class_Initialize 
        redim KeyX(0) : redim KeyY(0) : Lock = True : ms = 0 : endMS = 0 : LoopAnim=False : timescale = 1 : InterpolationType = 1
    End Sub

	Public Property Get State : State = not Lock : End Property
	Public Property Get Pos : Pos = ms : End Property
	Public Property Let CallBack(String) : UpdateSub = String : Set UpdateSubRef = GetRef(UpdateSub): End Property

	public Sub AddPoint(aKey, aX, aY)
        redim preserve KeyX(aKey+2) : redim preserve KeyY(aKey+2) ' +2 because the Resamplers are going to need a duplicate index at start and end
        redim tmparrayX(aKey+2)  : redim tmparrayY(aKey+2)

        if aKey = 0 then tmparrayX(0) = aX : tmparrayY(0) = aY ' buffer start for resampler
        aKey = aKey + 1 ' all points are to be offset by +1 interally

        tmparrayX(aKey) = aX : tmparrayY(aKey) = aY
        tmparrayX(aKey+1) = aX : tmparrayY(aKey+1) = aY

        dim i : for i = 0 to uBound(KeyX)
            if not IsEmpty(tmparrayX(i)) then 
                KeyX(i) = tmparrayX(i)
                KeyY(i) = tmparrayY(i)
            end if
        next
        'TestArrays ' debug
	End Sub

    public sub AddPoint2(aKey, aX, aY) ' aX is duration of current frame. Makes adjustments easier
        if aKey = 0 then AddPoint aKey, aX, aY : exit sub : end if
        dim aX2
        aX2 = KeyX(aKey-0) + aX 
        if aX2 < 0 then msgbox "AddPoint2 Error at keyframe " & aKey & ": ms is less than 0! input ms: " & aX & " previous ms:" & KeyX(aKey) : exit sub : end if
        AddPoint aKey, aX2, aY
    end sub

    Public Sub Play() : endMS=0: Lock=False : LoopAnim=False : end sub
    Public Sub PlayFrom(aMS) : endMS=0 : ms=aMS : Lock=False : LoopAnim=False : end sub
    Public Sub PlayTo(aEndMS) : endMS=aMS : Lock=False : LoopAnim=False : end sub
    Public Sub PlayFromTo(aMS, aEndMS) : ms=aMS : endMS=aEndMS : Lock=False : LoopAnim=False : end sub
    Public Sub PlayImmediate() : endMS=0 : Lock=False : ms=0 : LoopAnim=False : end sub ' Play + Reset animation if it's currently playing
    Public Sub PlayLoop() : endMS=0 : Lock=False : LoopAnim=True : end sub
    Public Sub Pause() : Lock=True : end sub
    Public Sub ResumeAnim() : Lock=False : end sub
    Public Sub StopAnim() ' immediate stop and reset back to frame 1
        ms = 0 : endMS=0 : Lock=True
        UpdateSubRef KeyY(0)
    End Sub

    private function LinearInterp(ByRef t, KeyX, KeyY) ' OUTS TIME
        dim u
        dim deltaX ' a subtraction
        dim i ' find current keyframe position, should this be kept in memory?
		if t >= KeyX(uBound(KeyX)) then LinearInterp = KeyY(uBound(KeyY) ) : t = 0 : Lock = Not LoopAnim : exit function end if
        do while t > keyX(i + 1)
            i = i + 1 
        loop
        if i = 0 then i = 1 ' skip the redundant position 1

        deltaX = KeyX(i+1) - KeyX(i)
        if deltaX <> 0 then 
            u = (t - KeyX(i)) / deltaX
        else 
            u = 0
        end if

        if i >= uBound(KeyX)-1 then t = 0 : Lock = Not LoopAnim ' animation is done, reset time to 0

        LinearInterp = KeyY(i) + u * (KeyY(i+1) - KeyY(i))

    end function

    private function CubicInterp(ByRef t, KeyX, KeyY) ' OUTS TIME
        dim u ' keyframe interp, 0-1
        dim deltaX ' a subtraction

		if t >= KeyX(uBound(KeyX)) then CubicInterp = KeyY(uBound(KeyY) ) : t = 0 : Lock = Not LoopAnim : exit function end if

        dim i ' find current keyframe position, should this be kept in memory?
        do while t > keyX(i + 1)
            i = i + 1 
        loop
        if i = 0 then i = 1 ' skip the redundant position 1


        deltaX = KeyX(i+1) - KeyX(i)

        if deltaX <> 0 then 
            u = (t - KeyX(i)) / deltaX
        else 
            u = 0
        end if

        if i >= uBound(KeyX)-1 then t = 0 : Lock = Not LoopAnim ' animation is done, reset time to 0

        CubicInterp = KeyY(i) * (2*u^3 - 3*u^2+1) + KeyY(i+1) * (3*u^2 - 2*u^3) ' cubic
 
    end function

    private function SplineInterp(ByRef t, KeyX, KeyY) ' Catmull-Rom spline interpolation. OUTS TIME
        dim keygrad1, keygrad2 ' spline gradients
        dim z1, z2 ' variables checked to prevent divide-by-zero errors
        dim deltaX ' a subtraction that is done three times
        dim u ' keyframe interp, 0-1
		if t >= KeyX(uBound(KeyX)) then SplineInterp = KeyY(uBound(KeyY) ) : t = 0 : Lock = Not LoopAnim : exit function end if

        dim i ' find current keyframe position, should this be kept in memory?
        do while t > keyX(i + 1)
            i = i + 1 
        loop
        if i = 0 then i = 1 ' skip the redundant position 1

        deltaX = KeyX(i+1) - KeyX(i)

        if deltaX <> 0 then 
            u = (t - KeyX(i)) / deltaX
        else
            u = 0 
        end if

        z1 = (KeyX(i) - KeyX(i-1)) : z2 = (KeyX(i) - KeyX(i-1) )
        if z1 <> 0 and z2 <> 0 then ' check div0
            Keygrad1 = 0.5 * (KeyY(i) - KeyY(i-1)) / z1 + 0.5 * (KeyY(i+1) - KeyY(i) ) / z2
        else 
            keygrad1 = 0 
        end if

        z1 = (KeyX(i+1) - KeyX(i)) : z2 = (KeyX(i+1) - KeyX(i) )
        if z1 <> 0 and z2 <> 0 then 
            Keygrad2 = 0.5 * (KeyY(i+1) - KeyY(i)) / z1 + 0.5 * (KeyY(i+2) - KeyY(i+1) ) / z2
        else 
            keygrad2 = 0 
        end if

        if i >= uBound(KeyX)-1 then t = 0 : Lock = Not LoopAnim ' animation is done, reset time to 0

        SplineInterp = KeyY(i) * (2*u^3 - 3*u^2 + 1) +_
                KeyY(i+1) * (3*u^2 - 2 * u^3) +_
                keygrad1 * deltaX * (u^3 - 2*u^2+u) +_
                keygrad2 * deltaX * (u^3 - u^2)

    end function

	Public Sub Update()
		if not lock then
            ms = ms + FrameTime * timescale
            dim lvl
            Select Case InterpolationType
                case 1 : lvl = CubicInterp(ms, KeyX, KeyY) ' these out MS
                case 2 : lvl = SplineInterp(ms, KeyX, KeyY)
                case else : lvl = LinearInterp(ms, KeyX, KeyY)
            end Select
            if endMS > 0 then : if MS >= endMS then lock=true end if : end if
            UpdateSubRef lvl
		end if
		
	End Sub

    public sub TEST()
        dim str
        Select Case InterpolationType
            case 1 : str = "Cubic"
            case 2 : str = "Spline"
            case else : str="Linear"
        end Select
        debug.print str
        dim lvl, i, t : for i = 0 to KeyX(uBound(KeyX))
			t = i ' note these out seconds so 'i' here will infinite loop
            Select Case InterpolationType
                case 1 : lvl = CubicInterp(t, KeyX, KeyY) ' these out t
                case 2 : lvl = SplineInterp(t, KeyX, KeyY)
                case else : lvl = LinearInterp(t, KeyX, KeyY)
            end Select
            debug.print i & ", " & Round(lvl,5) ' print X and Y axis
            ' debug.print Round(lvl,5) ' print just Y axis
        next

    end sub

end class


