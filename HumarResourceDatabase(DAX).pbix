// Import the data from SQL SERVER
// Transform the Data
// Create Relationship
// Add Calendar Table
// Create Date Hierarchy

// Adding Column Queries
		Calendar = 
		    CALENDAR(
		        MIN(DimEmployee[DateofHire]),
		        MAX(DimEmployee[DateofHire])
		    )
		// Creating Calendar based on Date  of Hire
	-- Add Year Column
		Year = 
		    YEAR(
		        'Calendar'[Date]
		    )
		// Creating Year Column
	-- Add Quarter Column
		Quarter = 
		    QUARTER(
		        'Calendar'[Date]
		    )
		// Creating Quarter Column
	-- Add Month Column
		Month = 
		    FORMAT(
		        'Calendar'[Date],
		        "mmm"
		    )
		// Creating Month Column
	-- Add Day Column
		Day = 
		    DAY(
		        'Calendar'[Date]
		    )
		// Creating Day Column
	-- Add Month Number Column
		MonthNo = 
		    MONTH(
		        'Calendar'[Date]
		    )
		// Creating a Month Number Column because this will be used to sort the month name column
