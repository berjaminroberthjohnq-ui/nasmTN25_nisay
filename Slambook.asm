section .data

    star db "*"
    newLine db 10

    welcome db 10
            db "              .------------------------------.", 10
            db "              |      MY ASCII SLAMBOOK       |", 10
            db "              |       Tell me about you!     |", 10
            db "              '------------------------------'", 10
            db "                       (^_^)", 10, 10
    welcomeLen equ $ - welcome

    aboutQuestions db "--- ABOUT ME ------------------------------------------------", 10
    aboutQuestionsLen equ $ - aboutQuestions

    firstQuestions db 10, "--- MY FIRSTS -----------------------------------------------", 10
    firstQuestionsLen equ $ - firstQuestions

    favoriteQuestions db 10, "--- MY FAVORITES <3 -----------------------------------------", 10
    favoriteQuestionsLen equ $ - favoriteQuestions

    moreQuestions db 10, "--- MORE ABOUT ME -------------------------------------------", 10
    moreQuestionsLen equ $ - moreQuestions

    ; Questions

    qName db "Name: "
    qNameLen equ $ - qName
    qEmail db "Email: "
    qEmailLen equ $ - qEmail
    qWebsite db "Website or social media: "
    qWebsiteLen equ $ - qWebsite
    qAchievement db "First big achievement: "
    qAchievementLen equ $ - qAchievement
    qRisk db "First risk you ever took: "
    qRiskLen equ $ - qRisk
    qHappy db "First time you felt completely happy: "
    qHappyLen equ $ - qHappy
    qColor db "Favorite color: "
    qColorLen equ $ - qColor
    qPerfume db "Favorite perfume or cologne: "
    qPerfumeLen equ $ - qPerfume
    qMusic db "Favorite music or genre: "
    qMusicLen equ $ - qMusic
    qSinger db "Favorite singer or artist: "
    qSingerLen equ $ - qSinger
    qSong db "Favorite song: "
    qSongLen equ $ - qSong
    qFood db "Favorite food: "
    qFoodLen equ $ - qFood
    qWeekend db "Weekend activity: "
    qWeekendLen equ $ - qWeekend
    qHobbies db "Hobbies: "
    qHobbiesLen equ $ - qHobbies
    qTV db "Favorite TV show: "
    qTVLen equ $ - qTV
    qMovie db "Favorite movie: "
    qMovieLen equ $ - qMovie
    qBook db "Favorite book: "
    qBookLen equ $ - qBook
    qCelebrity db "Favorite celebrity: "
    qCelebrityLen equ $ - qCelebrity
    qRoleModel db "Role model: "
    qRoleModelLen equ $ - qRoleModel
    qAmbition db "Ambition: "
    qAmbitionLen equ $ - qAmbition
    qMotto db "Motto: "
    qMottoLen equ $ - qMotto

    ; Paper-style final output.
    paperTitle db 10
        db "+============================================================================+", 10
        db "| o   o   o   o   o   o   o   o   o   o   o   o   o   o   o   o   o   o  |", 10
        db "|                                                                            |", 10
        db "|                 * * *  M Y   A S C I I   S L A M B O O K  * * *           |", 10
        db "|               A digitial paper filled with memories!                       |", 10
        db "|                                                                            |", 10
        db "|       .--------------------.                 +--------------------+        |", 10
        db "|      /  HELLO, FRIEND! :)   \                |       PHOTO        |        |", 10
        db "|      \______________________/                |       .----.       |        |", 10
        db "|                 \                            |      / ^  ^ \      |        |", 10
        db "|                  \  (^_^)                    |      |  <>  |      |        |", 10
        db "|                                               |       \ -- /      |        |", 10
        db "|                                               |        '---'      |        |", 10
        db "|                                              +--------------------+        |", 10
        db "|---------------------------[ ABOUT ME ]-------------------------------------|", 10
    paperTitleLen equ $ - paperTitle

    firstPaper db "|----------------------------------------------------------------------------|", 10
        db "|                            [ MY FIRSTS ]                                   |", 10
        db "|       .-~~~~-.      Every first becomes a memory!      .-~~~~-.            |", 10
        db "|----------------------------------------------------------------------------|", 10
    firstPaperLen equ $ - firstPaper

    favoritePaper db "|----------------------------------------------------------------------------|", 10
        db "|                         [ MY FAVORITES <3 ]                                |", 10
        db "|          <3    MUSIC  *  COLORS  *  FOOD  *  DREAMS    <3                 |", 10
        db "|                   o/~     o/~     o/~                                     |", 10
        db "|----------------------------------------------------------------------------|", 10
    favoritePaperLen equ $ - favoritePaper

    morePaper db "|----------------------------------------------------------------------------|", 10
        db "|                          [ MORE ABOUT ME ]                                 |", 10
        db "|             [BOOK]     [MOVIE]     [HOBBIES]     [DREAMS]                 |", 10
        db "|----------------------------------------------------------------------------|", 10
    morePaperLen equ $ - morePaper

    paperEnd db "|                                                                            |", 10
        db "|       .-.          KEEP SMILING AND KEEP DREAMING!          .-.            |", 10
        db "|      (o o)              <3   *   <3   *   <3              (o o)           |", 10
        db "|      | O \        Signature: ____________________          / O |           |", 10
        db "|       \   \           Date: ____________________          /   /            |", 10
        db "|        `~~~'            Thanks for sharing!              `~~~'             |", 10
        db "+============================================================================+", 10
    paperEndLen equ $ - paperEnd

    ; Labels printed beside the user's answers.
    oName db "|  Name: "
    oNameLen equ $ - oName
    oEmail db "|  Email: "
    oEmailLen equ $ - oEmail
    oWebsite db "|  Website/Social: "
    oWebsiteLen equ $ - oWebsite
    oAchievement db "|  First big achievement: "
    oAchievementLen equ $ - oAchievement
    oRisk db "|  First risk: "
    oRiskLen equ $ - oRisk
    oHappy db "|  First completely happy moment: "
    oHappyLen equ $ - oHappy
    oColor db "|  Color: "
    oColorLen equ $ - oColor
    oPerfume db "|  Perfume/Cologne: "
    oPerfumeLen equ $ - oPerfume
    oMusic db "|  Music/Genre: "
    oMusicLen equ $ - oMusic
    oSinger db "|  Singer/Artist: "
    oSingerLen equ $ - oSinger
    oSong db "|  Song: "
    oSongLen equ $ - oSong
    oFood db "|  Food: "
    oFoodLen equ $ - oFood
    oWeekend db "|  Weekend activity: "
    oWeekendLen equ $ - oWeekend
    oHobbies db "|  Hobbies: "
    oHobbiesLen equ $ - oHobbies
    oTV db "|  TV show: "
    oTVLen equ $ - oTV
    oMovie db "|  Movie: "
    oMovieLen equ $ - oMovie
    oBook db "|  Book: "
    oBookLen equ $ - oBook
    oCelebrity db "|  Celebrity: "
    oCelebrityLen equ $ - oCelebrity
    oRoleModel db "|  Role model: "
    oRoleModelLen equ $ - oRoleModel
    oAmbition db "|  Ambition: "
    oAmbitionLen equ $ - oAmbition
    oMotto db "|  Motto: "
    oMottoLen equ $ - oMotto

section .bss

    ; Each buffer stores one answer.
    name resb 80
    email resb 80
    website resb 80
    achievement resb 80
    risk resb 80
    happy resb 80
    color resb 80
    perfume resb 80
    music resb 80
    singer resb 80
    song resb 80
    food resb 80
    weekend resb 80
    hobbies resb 80
    tvShow resb 80
    movie resb 80
    book resb 80
    celebrity resb 80
    roleModel resb 80
    ambition resb 80
    motto resb 80

    ; These variables remember the length of every answer.
    nameLen resd 1
    emailLen resd 1
    websiteLen resd 1
    achievementLen resd 1
    riskLen resd 1
    happyLen resd 1
    colorLen resd 1
    perfumeLen resd 1
    musicLen resd 1
    singerLen resd 1
    songLen resd 1
    foodLen resd 1
    weekendLen resd 1
    hobbiesLen resd 1
    tvLen resd 1
    movieLen resd 1
    bookLen resd 1
    celebrityLen resd 1
    roleModelLen resd 1
    ambitionLen resd 1
    mottoLen resd 1

section .text
    global _start

_start:

    ; Print 60 stars using one simple loop.
    mov edi, 60

starLoop:
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80

    dec edi
    cmp edi, 0
    jne starLoop

    mov ecx, welcome
    mov edx, welcomeLen
    call printText

    ;  ABOUT ME INPUT 
    mov ecx, aboutQuestions
    mov edx, aboutQuestionsLen
    call printText

    mov ecx, qName
    mov edx, qNameLen
    call printText
    mov ecx, name
    mov edx, 80
    call readAnswer
    mov [nameLen], eax

    mov ecx, qEmail
    mov edx, qEmailLen
    call printText
    mov ecx, email
    mov edx, 80
    call readAnswer
    mov [emailLen], eax

    mov ecx, qWebsite
    mov edx, qWebsiteLen
    call printText
    mov ecx, website
    mov edx, 80
    call readAnswer
    mov [websiteLen], eax

    ;  MY FIRSTS INPUT 
    mov ecx, firstQuestions
    mov edx, firstQuestionsLen
    call printText

    mov ecx, qAchievement
    mov edx, qAchievementLen
    call printText
    mov ecx, achievement
    mov edx, 80
    call readAnswer
    mov [achievementLen], eax

    mov ecx, qRisk
    mov edx, qRiskLen
    call printText
    mov ecx, risk
    mov edx, 80
    call readAnswer
    mov [riskLen], eax

    mov ecx, qHappy
    mov edx, qHappyLen
    call printText
    mov ecx, happy
    mov edx, 80
    call readAnswer
    mov [happyLen], eax

    ;  FAVORITES INPUT 
    mov ecx, favoriteQuestions
    mov edx, favoriteQuestionsLen
    call printText

    mov ecx, qColor
    mov edx, qColorLen
    call printText
    mov ecx, color
    mov edx, 80
    call readAnswer
    mov [colorLen], eax

    mov ecx, qPerfume
    mov edx, qPerfumeLen
    call printText
    mov ecx, perfume
    mov edx, 80
    call readAnswer
    mov [perfumeLen], eax

    mov ecx, qMusic
    mov edx, qMusicLen
    call printText
    mov ecx, music
    mov edx, 80
    call readAnswer
    mov [musicLen], eax

    mov ecx, qSinger
    mov edx, qSingerLen
    call printText
    mov ecx, singer
    mov edx, 80
    call readAnswer
    mov [singerLen], eax

    mov ecx, qSong
    mov edx, qSongLen
    call printText
    mov ecx, song
    mov edx, 80
    call readAnswer
    mov [songLen], eax

    mov ecx, qFood
    mov edx, qFoodLen
    call printText
    mov ecx, food
    mov edx, 80
    call readAnswer
    mov [foodLen], eax

    ;  MORE INFORMATION 
    mov ecx, moreQuestions
    mov edx, moreQuestionsLen
    call printText

    mov ecx, qWeekend
    mov edx, qWeekendLen
    call printText
    mov ecx, weekend
    mov edx, 80
    call readAnswer
    mov [weekendLen], eax

    mov ecx, qHobbies
    mov edx, qHobbiesLen
    call printText
    mov ecx, hobbies
    mov edx, 80
    call readAnswer
    mov [hobbiesLen], eax

    mov ecx, qTV
    mov edx, qTVLen
    call printText
    mov ecx, tvShow
    mov edx, 80
    call readAnswer
    mov [tvLen], eax

    mov ecx, qMovie
    mov edx, qMovieLen
    call printText
    mov ecx, movie
    mov edx, 80
    call readAnswer
    mov [movieLen], eax

    mov ecx, qBook
    mov edx, qBookLen
    call printText
    mov ecx, book
    mov edx, 80
    call readAnswer
    mov [bookLen], eax

    mov ecx, qCelebrity
    mov edx, qCelebrityLen
    call printText
    mov ecx, celebrity
    mov edx, 80
    call readAnswer
    mov [celebrityLen], eax

    mov ecx, qRoleModel
    mov edx, qRoleModelLen
    call printText
    mov ecx, roleModel
    mov edx, 80
    call readAnswer
    mov [roleModelLen], eax

    mov ecx, qAmbition
    mov edx, qAmbitionLen
    call printText
    mov ecx, ambition
    mov edx, 80
    call readAnswer
    mov [ambitionLen], eax

    mov ecx, qMotto
    mov edx, qMottoLen
    call printText
    mov ecx, motto
    mov edx, 80
    call readAnswer
    mov [mottoLen], eax

    ;  FINAL PAPER OUTPUT 
    mov ecx, paperTitle
    mov edx, paperTitleLen
    call printText

    mov ecx, oName
    mov edx, oNameLen
    call printText
    mov ecx, name
    mov edx, [nameLen]
    call printText
    call printNewLine

    mov ecx, oEmail
    mov edx, oEmailLen
    call printText
    mov ecx, email
    mov edx, [emailLen]
    call printText
    call printNewLine

    mov ecx, oWebsite
    mov edx, oWebsiteLen
    call printText
    mov ecx, website
    mov edx, [websiteLen]
    call printText
    call printNewLine

    mov ecx, firstPaper
    mov edx, firstPaperLen
    call printText

    mov ecx, oAchievement
    mov edx, oAchievementLen
    call printText
    mov ecx, achievement
    mov edx, [achievementLen]
    call printText
    call printNewLine

    mov ecx, oRisk
    mov edx, oRiskLen
    call printText
    mov ecx, risk
    mov edx, [riskLen]
    call printText
    call printNewLine

    mov ecx, oHappy
    mov edx, oHappyLen
    call printText
    mov ecx, happy
    mov edx, [happyLen]
    call printText
    call printNewLine

    mov ecx, favoritePaper
    mov edx, favoritePaperLen
    call printText

    mov ecx, oColor
    mov edx, oColorLen
    call printText
    mov ecx, color
    mov edx, [colorLen]
    call printText
    call printNewLine

    mov ecx, oPerfume
    mov edx, oPerfumeLen
    call printText
    mov ecx, perfume
    mov edx, [perfumeLen]
    call printText
    call printNewLine

    mov ecx, oMusic
    mov edx, oMusicLen
    call printText
    mov ecx, music
    mov edx, [musicLen]
    call printText
    call printNewLine

    mov ecx, oSinger
    mov edx, oSingerLen
    call printText
    mov ecx, singer
    mov edx, [singerLen]
    call printText
    call printNewLine

    mov ecx, oSong
    mov edx, oSongLen
    call printText
    mov ecx, song
    mov edx, [songLen]
    call printText
    call printNewLine

    mov ecx, oFood
    mov edx, oFoodLen
    call printText
    mov ecx, food
    mov edx, [foodLen]
    call printText
    call printNewLine

    mov ecx, morePaper
    mov edx, morePaperLen
    call printText

    mov ecx, oWeekend
    mov edx, oWeekendLen
    call printText
    mov ecx, weekend
    mov edx, [weekendLen]
    call printText
    call printNewLine

    mov ecx, oHobbies
    mov edx, oHobbiesLen
    call printText
    mov ecx, hobbies
    mov edx, [hobbiesLen]
    call printText
    call printNewLine

    mov ecx, oTV
    mov edx, oTVLen
    call printText
    mov ecx, tvShow
    mov edx, [tvLen]
    call printText
    call printNewLine

    mov ecx, oMovie
    mov edx, oMovieLen
    call printText
    mov ecx, movie
    mov edx, [movieLen]
    call printText
    call printNewLine

    mov ecx, oBook
    mov edx, oBookLen
    call printText
    mov ecx, book
    mov edx, [bookLen]
    call printText
    call printNewLine

    mov ecx, oCelebrity
    mov edx, oCelebrityLen
    call printText
    mov ecx, celebrity
    mov edx, [celebrityLen]
    call printText
    call printNewLine

    mov ecx, oRoleModel
    mov edx, oRoleModelLen
    call printText
    mov ecx, roleModel
    mov edx, [roleModelLen]
    call printText
    call printNewLine

    mov ecx, oAmbition
    mov edx, oAmbitionLen
    call printText
    mov ecx, ambition
    mov edx, [ambitionLen]
    call printText
    call printNewLine

    mov ecx, oMotto
    mov edx, oMottoLen
    call printText
    mov ecx, motto
    mov edx, [mottoLen]
    call printText
    call printNewLine

    mov ecx, paperEnd
    mov edx, paperEndLen
    call printText

    ; End the program.
    mov eax, 1
    mov ebx, 0
    int 0x80


; printText
; ECX contains the text address.
; EDX contains the number of characters.

printText:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret


; readAnswer
; ECX contains the buffer address.
; EDX contains the buffer size.
; EAX returns the length of the answer without the Enter character.

readAnswer:
    mov eax, 3
    mov ebx, 0
    int 0x80

    cmp eax, 0
    jle emptyAnswer

    ; Remove the Enter character from the end of the answer.
    cmp byte [ecx + eax - 1], 10
    jne answerDone
    dec eax
    mov byte [ecx + eax], 0

answerDone:
    ret

emptyAnswer:
    mov eax, 0
    ret


; Print one blank line after an answer.

printNewLine:
    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, 1
    int 0x80
    ret
