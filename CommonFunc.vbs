
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

'''<Summary>验证QTP对象是否存在</Summary>
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

