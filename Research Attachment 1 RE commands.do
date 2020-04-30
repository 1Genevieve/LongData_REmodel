use "\\stfdata06\home\CM\Cmp16gd\ManW7\Desktop\waves3-6long.dta"
Declare dataset as panel data
- for random effects logistic regression
xtset idauniq time, yearly

Declare dataset as time-series data
tsset idauniq time, yearly

gen female=1 if dhsex1==1
replace female=0 if female==.

Generate dummy variables
tabulate dhsex1, generate (dum)
tabulate indager1, generate(dum)
tabulate palevel1, generate(dum)
tabulate fiveaday, generate(dum)
tabulate heska1, generate(dum)
tabulate scal7b1, generate(dum)
tabulate psceda1, generate (dum)

Set the base value (dummy variable=0)
fvset base first dhsex1 indager1 palevel1 fiveaday scal7b1 psceda1

Binary logistic regression, random effects
xtlogit heska1 dhsex palevel1 fiveaday scako1 psceda1, re
xtlogit heska1 dhsex palevel1 fiveaday scal7a1 psceda1, re
xtlogit heska1 i.dhsex1 i.indager1 i.palevel1 i.fiveaday i.scal7b1 i.psceda1, re

Binary logistic regression, random effects with interactions
xtlogit heska1 i.dhsex1 i.indager1 i.palevel1 i.fiveaday i.scal7b1 i.psceda1 dhsex1#indager1 scal7b1#psceda1 fiveaday#psceda1, re
xtlogit heska1 i.dhsex1 i.indager1 i.palevel1 i.fiveaday i.scal7b1 i.psceda1 dhsex1#indager1 dhsex1#psceda1 indager1#psceda1 indager1#fiveaday, re
xtlogit heska1 i.dhsex1 i.indager1 i.palevel1 i.fiveaday i.scal7b1 i.psceda1 dhsex1#indager1 dhsex1#psceda1 indager1#psceda1 indager1#fiveaday, re or

With time series effect (difference1, lag1)
xtlogit LD.heska1 i.dhsex1 i.indager1 LD.palevel1 LD.fiveaday LD.scal7b1 LD.psceda1, re
