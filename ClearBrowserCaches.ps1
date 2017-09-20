Clear-Host
Write-Host -ForegroundColor Yellow "*******************************************************"
""
Write-Host -ForegroundColor Yellow "Очистка кеша браузеров, RecycleBin, Temp (PowerShell)"
Write-Host -ForegroundColor Yellow "(c) AnSt. Март 2017"
Write-Host -ForegroundColor Yellow "Версия: 0.10 (Сентябрь 2017)"
""
Write-Host -ForegroundColor Yellow "*******************************************************"
""
Write-Host -ForegroundColor Green "Изменения:
v0.10(Сентябрь 2017):	Добавление меню режимов очистки
v0.9(Июль 2017):	Добавление удаления файла со списком пользователей
v0.8(Июль 2017):	Переделана функция по очистке Корзины
v0.7(Июнь 2017):	Добавлена очистка Яндекс.Браузер, Opera
v0.6:	Предупреждение о закрытие браузеров
v0.5:	Использование функций
v0.4:	Очистка Корзины на старых системах
v0.3:	Ожидание нажатия пользователя
v0.2:	Очистка временных файлов пользователя
v0.1(Март 2017):	Создание скрипта"
""
Write-Host -ForegroundColor Yellow "*******************************************************"
""
#*******************************************************

#########################
# Функции #
#########################

# Mozilla Firefox

Function Clear_Mozilla ($a) {
    Import-CSV -Path $a -Header Name | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Google Chrome

Function Clear_Chrome ($a) {
    Import-CSV -Path $a -Header Name | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Chromium

Function Clear_Chromium ($a) {
    Import-CSV -Path $a -Header Name | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Yandex
Function Clear_Yandex ($a) {
	Import-CSV -Path $a -Header Name | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Opera
Function Clear_Opera ($a) {
	Import-CSV -Path $a -Header Name | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Opera Software\Opera Stable\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Internet Explorer

Function Clear_IE ($a) {
    Import-CSV -Path $a | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WebCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
}
###

# Clear RecileBin & Temp

Function Clear_Temp ($a) {
    Clear-RecycleBin -Force
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
    Import-Csv -Path $a | Foreach {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\AppCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
    }
}

#########################

# ClearBrowser

Function ClearBrowser {
	""
	Write-Host -ForegroundColor Green "Создание списка пользователей"
	Write-Host -ForegroundColor Green "---------------------------------------"

	Write-Host -ForegroundColor Magenta "Сохранение списка пользователей в c:\users\%username%\users.csv"
	$Path = "C:\users\$env:USERNAME\users.csv"

	Dir C:\Users | Select Name | Export-Csv -Path $Path -NoTypeInformation
	$list = Test-Path $Path
	""
	#*******************************************************
	""
	Write-Host -ForegroundColor Green "Выполняется скрипт..."
	Write-Host -ForegroundColor Green "---------------------"
	If ($list) {
    	""
    	# Mozilla Firefox
    	Write-Host -ForegroundColor Green "Очистка кэша Mozilla Firefox"
    	Write-Host -ForegroundColor Green "--------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Mozilla ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Chrome ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Chromium ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
	
		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Yandex ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
	
		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Opera ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "----------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_IE ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
		
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей
		
	} Else {
		Write-Host -ForegroundColor Yellow "Ошибка!"
		Exit
    }
}

###

# ClearRecileBinTemp

Function ClearRecycleBinTemp {
	""
	Write-Host -ForegroundColor Green "Создание списка пользователей"
	Write-Host -ForegroundColor Green "---------------------------------------"

	Write-Host -ForegroundColor Magenta "Сохранение списка пользователей в c:\users\%username%\users.csv"
	$Path = "C:\users\$env:USERNAME\users.csv"

	Dir C:\Users | Select Name | Export-Csv -Path $Path -NoTypeInformation
	$list = Test-Path $Path
	""
	#*******************************************************
	""
	Write-Host -ForegroundColor Green "Выполняется скрипт..."
	Write-Host -ForegroundColor Green "---------------------"
	If ($list) {
		# RecileBin & Temp
    	Write-Host -ForegroundColor Green "Очистка Корзины и удаление временных файлов"
    	Write-Host -ForegroundColor Green "-----------------------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Очистка RecycleBin & Temp..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Temp ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей
    	Write-Host -ForegroundColor Magenta "Очистка завершена!"
    	""
    } Else {
		Write-Host -ForegroundColor Yellow "Ошибка!"
		Exit
    }
}

###

# ClearFull

Function ClearFull {
		""
	Write-Host -ForegroundColor Green "Создание списка пользователей"
	Write-Host -ForegroundColor Green "---------------------------------------"

	Write-Host -ForegroundColor Magenta "Сохранение списка пользователей в c:\users\%username%\users.csv"
	$Path = "C:\users\$env:USERNAME\users.csv"

	Dir C:\Users | Select Name | Export-Csv -Path $Path -NoTypeInformation
	$list = Test-Path $Path
	""
	#*******************************************************
	""
	Write-Host -ForegroundColor Green "Выполняется скрипт..."
	Write-Host -ForegroundColor Green "---------------------"
	If ($list) {
    	""
    	# Mozilla Firefox
    	Write-Host -ForegroundColor Green "Очистка кэша Mozilla Firefox"
    	Write-Host -ForegroundColor Green "--------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Mozilla ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Chrome ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Chromium ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Yandex ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "-------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Opera ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "----------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
    	Write-Host -ForegroundColor Cyan
    	Clear_IE ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""

		# RecileBin & Temp
    	Write-Host -ForegroundColor Green "Очистка Корзины и удаление временных файлов"
    	Write-Host -ForegroundColor Green "-----------------------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Очистка RecycleBin & Temp..."
    	Write-Host -ForegroundColor Cyan
    	Clear_Temp ($Path)    	
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей
    	Write-Host -ForegroundColor Magenta "Очистка завершена!"
    	""		
	} Else {
		Write-Host -ForegroundColor Yellow "Ошибка!"
		Exit
    }
}

#########################

Write-Host -ForegroundColor Magenta "Закройте все браузеры!"
Write-Host -ForegroundColor Gray "*******************************************************"
""
Write-Host -ForegroundColor Yellow "Выберите режим очистки:"
Write-Host -ForegroundColor Yellow "1. Очистить только кэши браузеров"
Write-Host -ForegroundColor Yellow "2. Очитстить только Корзину и временные файлы (RecycleBin & Temp)"
Write-Host -ForegroundColor Yellow "3. Очитстить кэши браузеров и Корзину с временными файлами (RecycleBin & Temp)"
Write-Host -ForegroundColor Yellow "4. Выход"
""
Write-Host -ForegroundColor Gray "*******************************************************"
""
$Choice = Read-Host "Для продолжения введите номер режима очистки"

#########################

Switch ($Choice) {
    1{ClearBrowser}
    2{ClearRecycleBinTemp}
	3{ClearFull}
    4{Write-Host -ForegroundColor Red "Выход..."; Exit}
    Default {Write-Host -ForegroundColor Red "Не правильно выбран режим"}
}

#########################

#*******************************************************
""
Write-Host -ForegroundColor Red "*******************************************************"
""
Write-Host -ForegroundColor Red "Все задачи выполнены!"
""
Write-Host -ForegroundColor Red "*******************************************************"
""

Read-Host "Для выхода нажмите Enter"