import sys
from hijri_converter import Hijri, Gregorian

# Convert a Gregorian date to Hijri
h = Gregorian.today().to_hijri()  

day = h.dmyformat()[:2] 
month_name = h.month_name()

arrg = sys.argv[1]  # Get the first argument
if arrg == "day":
    print(day)
else:
    print(month_name)