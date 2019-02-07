select 
LTRIM(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE(
lower(' '+Receiver)
,N' а',N' А')
,N' б',N' Б')
,N' в',N' В')
,N' г',N' Г')
,N' д',N' Д')
,N' е',N' У')
,N' є',N' Е')
,N' ж',N' Ж')
,N' з',N' З')
,N' и',N' И')
,N' і',N' І')
,N' ї',N' Ї')
,N' й',N' Й')
,N' к',N' К')
,N' л',N' Л')
,N' м',N' М')
,N' н',N' Н')
,N' о',N' О')
,N' п',N' П')
,N' р', N' Р')
,N' с', N' С') 
,N' т', N' Т') 
,N' у', N' У') 
,N' ф', N' Ф') 
,N' х', N' Х') 
,N' ц', N' Ц') 
,N' ч', N' Ч') 
,N' ш', N' Ш') 
,N' щ', N' Щ') 
,N' ь', N' Ь') 
,N' ю', N' Ю') 
,N' я', N' Я')) 
as p
 from TestTask_170518