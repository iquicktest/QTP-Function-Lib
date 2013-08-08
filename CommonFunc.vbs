'''<Summary>切换回放模式：鼠标模式/事件模式</Summary>
'''<author>Xubin</author>
'''<example>
'''SwitchMouseReplay True
'''</example>
Sub SwitchMouseReplay(bType)
	Select Case bType
		Case True
			Setting.WebPackage("ReplayType") = 2
		Case False
			Setting.WebPackage("ReplayType") = 1
	End Select
End Sub

'''<Summary>验证QTP对象存在与否</Summary>
'''<author>Xubin</author>
'''<example>
'''AssertExist Browser("logon")
'''</example>
Sub AssertExist(qObj)
	If qObj.Exist then
		reporter.ReportEvent micPass,"对象存在","对象名：<<" & qObj.GetTOProperty("testObjName") &">>"
	else
		reporter.ReportEvent micFail,"对象不存在","对象名：<<" & qObj.GetTOProperty("testObjName") &">>"
	end if
End Sub

'''<Summary>验证值是否为真</Summary>
'''<author>Xubin</author>
'''<example>
'''AssertTrue bTrue
'''</example>
Sub AssertTrue(bBool)
	If bBool Then
		reporter.ReportEvent micPass,Cstr(bBool),"结果为真"
	else
		reporter.ReportEvent micFail,Cstr(bBool),"结果为假"
	End If
End Sub

'Function Name: CaptureRegion
'Argument 1: strPath- File path where you want to store the captured image.
'Argument 2: inX- X co-ordinate
'Argument 3: inY- Y co-ordinate
'Argument 4: inHeight- Image Height
'Argument 5: inWidth- Image Width
Function CaptureRegion(ByVal strPath,ByVal inX,ByVal inY,ByVal inHeight,ByVal inWidth)

	'Declaring all the required Local variables
	Dim oBitmap,oPixelFormat,oGraphic,oPoint,oSize
	
	'Creating Pixel Format object
	Set oPixelFormat=DotNetFactory.CreateInstance("System.Drawing.Imaging.PixelFormat","System.Drawing")
	
	'Point structure to specify x and y to capture a region
	Set oPoint=DotNetFactory.CreateInstance("System.Drawing.Point","System.Drawing",inX,inY)
	
	'Size structure for new image
	Set oSize=DotNetFactory.CreateInstance("System.Drawing.Size","System.Drawing",inWidth,inHeight)
	
	'Creating Bitmap object with Height, Width and Format32bppArgb pixel format
	Set oBitmap=DotNetFactory.CreateInstance("System.Drawing.Bitmap","System.Drawing",inWidth,inHeight,oPixelFormat.Format32bppArgb)
	
	'Graphic object
	Set oGraphic=DotNetFactory.CreateInstance("System.Drawing.Graphics","System.Drawing")
	
	'Mapping Bitmap object with Graphic object
	Set oGraphic=oGraphic.FromImage(oBitmap)
	
	'Capturing the screen region using CopyFromScreen method
	oGraphic.CopyFromScreen oPoint,oPoint,oSize
	
	'Saving the file
	oBitmap.Save(strPath)
	
	Set oPixelFormat=Nothing
	Set oPoint=Nothing
	Set oSize=Nothing
	Set oBitmap=Nothing
	Set oGraphic=Nothing
End Function

