// get max without using built in max function
myMax:{(|/)x}

// test myMax
myMax 3 6 2 9
myMax -4 -8 -10 4

// get min without using built in  min function
myMin:{(&/)x}

// test myMin
myMin 3 6 2 9
myMin -4 -8 -10 4

// get count without using build in count function
myCount:{1+last where x in -1#x}

// test myCount
myCount 1 2 3 4
myCount "hi there"

// get unique values without using built in distinct function
myDistinct:{key group x}

// test myDistinct
myDistinct 4 2 2 3 3 1
myDistinct "ajjasss"
