
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
