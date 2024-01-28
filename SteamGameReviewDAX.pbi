// Createing Calendar Table

// Adding Date Column
Date = 
CALENDAR(
        MIN(games[release_date]),
        MAX(games[release_date])
)

// Adding Year Column
Year = 
YEAR(
        'Date'[Date]
)

// Adding Month Column
Month = 
FORMAT(
        'Date'[Date],
        "mmm"
)

// Adding MonthNo Column (It will be used to sort the month column.)
MonthNo = 
MONTH(
        'Date'[Date]
)


// Calculate the total Games
TotalGames = 
CALCULATE(
    COUNT(games[app_id]), 
    CONTAINSSTRING(
        games[genres], 
        SELECTEDVALUE(Genres[Genres])
        )
)

// Calculate the total review
TotalReview = 
VAR _TotalReview =CALCULATE(COUNT(recommendations[review_id]), CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))
VAR _ZeroCondition = IF(_TotalReview = 0, 0 , _TotalReview)

RETURN
        _ZeroCondition

// Calculate the total Recommend
Recommend = 
VAR _Recommend = CALCULATE(COUNT(recommendations[user_id]), recommendations[is_recommended] = True, CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))
VAR _ZeroCondition = IF(_Recommend = 0, 0, _Recommend)

RETURN
        _ZeroCondition
