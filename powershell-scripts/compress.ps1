$date = Get-Date -Format "yyyyMMdd_HHmm"

Compress-Archive C:\Users\Desktop\Derren\books\* "books_$date.zip"
