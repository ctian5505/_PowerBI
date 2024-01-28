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

// Calculate the percentage by recommend
Recommendation% = 
VAR _TrueValue = CALCULATE(COUNT(recommendations[review_id]), recommendations[is_recommended] = True,CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))
VAR _AllValue = CALCULATE(COUNT(recommendations[review_id]), ALL(recommendations[is_recommended]), CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))

RETURN
        IF(DIVIDE(_TrueValue,_AllValue, 0) = 0, 0, DIVIDE(_TrueValue,_AllValue, 0))

// Calculate the Rating = Positive
PositiveRating = 
CALCULATE(
        SUM(games[positive_ratings]),
        CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))

// Calculate the total sum of positive and negating ratings
MaxValue = 
CALCULATE(SUM(games[positive_ratings]), CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres]))) + 
CALCULATE(SUM(games[negative_ratings]), CONTAINSSTRING(games[genres], SELECTEDVALUE(Genres[Genres])))

// Find the genre Using Containstring to filter the table
ConditionGenre = 
VAR _SeelctedValue = SELECTEDVALUE(Genres[Genres])
VAR _Condition = CALCULATE(COUNT(games[genres]),CONTAINSSTRING(games[genres],_SeelctedValue))

RETURN
        _Condition
