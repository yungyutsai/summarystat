{smcl}
{title:Title}

{p 4 8}{cmd:summarystat} {hline 2} Command for creating summary statistics table.{p_end}

{title:Description}

{p 4 8}This command is still under test. Users must double check the results. Please contact with the {help summarystat##author:author} to report any issues.{p_end}

{title:Syntax}

{p 4 8}{cmd: summarystat } [{help svy}:] {help summarystat##varlist:varlist} {ifin} [{help summarystat##weight:weight}]
[{cmd:,} 
{cmd:by(}{help summarystat##by:varlist}{cmd:)} {opt all} {opt lw} {opt cw}
{cmd:{opt st:ats}(}{help summarystat##stats:stats}{cmd:)} 
{cmd:{opt obs}(}{help summarystat##obs:obs_options}{cmd:)} 
{opt long} {opt wide}
{cmd:{opt f:ormat}(}{help format:%fmt}{cmd:)} 
{cmd:{opt dec}(}{it:#}{cmd:)} 
{cmd:{opt lab:el}(}{help summarystat##label:label_options}{cmd:)} {opt nol:abel}
{cmd:{opt par:en}(}{it:stats}{cmd:)} {opt nopa:ren}
{cmd:{opt br:acket}(}{it:stats}{cmd:)} {opt nobr:acket}
{cmd:{opt ti:tle}(}{help summarystat##title:titleinfo}{cmd:)}
{cmd:{opt pan:el}(}{help summarystat##panel:panelinfo}{cmd:)}
{cmd:{opt note}(}{help summarystat##note:noteinfo}{cmd:)} {opt non:ote}
{cmd:{opt save}(}{help filename}{cmd:)} {opt replace}
{cmd:{opt sheet}(}{it:sheetname}{cmd:)} {opt sheetrep:lace} {cmd:sep(}{help summarystat##sep:sep_options}{cmd:)}
{opt see:out} {opt nores:tore} {opt gc:ollapse}]{p_end}

{marker options}{...}
{title:Options}

{marker varlist}{...}
{dlgtab:Variables List}

{p 4 8}Specifies the variables for which summary statistics are calculated for.{p_end}
{p 8 8}Allows for {help fvvarlist:factor variables} (must specified as {bf:i.}{it:varname}) and string variables. String variables are treated as factor variables.{p_end}
{p 8 8}Allows for {help varlist:variables list}, including the *, ~, ?, and - characters. See {help varlist} for more information.{p_end}
{p 8 8}Allows for panel grouping specified with parentheses. {it:e.g.} ({it:var1 var2 var3}) ({it:var4 var5 var6}). Use {help summarystat##panel:panel()} option to specifies panel title.{p_end}

{marker weight}{...}
{dlgtab:Weights and Prefix Options}

{p 4 8}{bf:fweight}s, {bf:pweight}s, {bf:aweight}s, and {bf:iweight}s are allowed; see {help weight}.{p_end}
{p 8 8}{bf:pweight}s, {bf:aweight}s, and {bf:iweight}s are not allowed with {bf:sebinomial} and {bf:sepoisson} {it:stats} options.{p_end}

{p 4 8}{cmd: svy:} specifies using {help svy:survey prefix command} to calculate the statistics. Not allowed with {bf:sebinomial} and {bf:sepoisson} {it:stats} options.{p_end}

{p 4 8}The weights and svy prefix options only applies on mean, sd, semean, n (count/obs), and sum. The percentile and iqr are not calculated with weights. 

{marker sample}{...}
{dlgtab:Sample Options}

{marker by}{...}
{p 4 8}{cmd:by({help varlist})} groups over which {it:stats} are to be calculated.{p_end}
{p 8 8}Allows for multiple grouping variables and interaction (maximum one interaction).{p_end}
{p 8 8}{cmd:by(}{it:var1 var2}{cmd:)} calculates {it:stats} grouped by {it:var1} and {it:var2} separately.{p_end}
{p 8 8}{cmd:by(}{it:var1}{bf:#}{it:var2}{cmd:)} calculates {it:stats} grouped by the interaction between {it:var1} and {it:var2}. {bf:##} is synonym for {bf:#} in this program.{p_end}

{p 4 8}{cmd:all} specifies for reporting {it:stats} of whole sample in addition to each groups.{p_end}

{p 4 8}{cmd:lw} specifies for using {help listwise} deletion to handle missing values. By default, the program uses all available observations to calculate each statistics without regard to whether other variables in the {help summarystat##varlist:varlist} are missing.

{p 4 8}{cmd:cw} specifies for using case wise deletion, synonym for {cmd:lw}

{marker stats}{...}
{dlgtab:Statistics}

{p 4 8}{opt st:ats}{cmd:()} specifies the statistics to be calculated. The allowed statistics are:{p_end}

{p2colset 9 22 24 2}{...}
{p2col :{opt mean}}means (default){p_end}
{p2col :{opt median}}medians (same as {opt p50}){p_end}
{p2col :{opt p1}}1st percentile{p_end}
{p2col :{opt p2}}2nd percentile{p_end}
{p2col :{it:...}}3rd{hline 1}49th percentiles{p_end}
{p2col :{opt p50}}50th percentile (same as {cmd:median}){p_end}
{p2col :{it:...}}51st{hline 1}97th percentiles{p_end}
{p2col :{opt p98}}98th percentile{p_end}
{p2col :{opt p99}}99th percentile{p_end}
{p2col :{opt sd}}standard deviation{p_end}
{p2col :{opt se:mean}}standard error of the mean ({cmd:sd/sqrt(n)}){p_end}
{p2col :{opt seb:inomial}}standard error of the mean, binomial ({cmd:sqrt(p(1-p)/n)}) (missing if source not 0, 1){p_end}
{p2col :{opt sep:oisson}}standard error of the mean, Poisson ({cmd:sqrt(mean / n)}) (result rounded to nearest integer){p_end}
{p2col :{opt sum}}sums{p_end}
{p2col :{opt rawsum}}sums, ignoring optionally specified weights ({bf:note}: zero-weighted obs are still excluded){p_end}
{p2col :{opt count}}number of nonmissing observations{p_end}
{p2col :{opt n}}same as {cmd:count}{p_end}
{p2col :{opt obs}}same as {cmd:count}{p_end}
{p2col :{opt percent}}percentage of nonmissing observations{p_end}
{p2col :{opt max}}maximums{p_end}
{p2col :{opt min}}minimums{p_end}
{p2col :{opt iqr}}interquartile range{p_end}
{p2col :{opt first}}first value{p_end}
{p2col :{opt last}}last value{p_end}
{p2col :{opt firstnm}}first nonmissing value{p_end}
{p2col :{opt lastnm}}last nonmissing value{p_end}

{p 4 8}If {it:stats} is not specified, {bf:mean} and {bf:sd} are assumed.{p_end}


{marker obs}{...}
{dlgtab:Observation Options}

{p 4 8}{cmd:obs()} reports number of observations.{p_end}
{p 8 8}By default, both the number of observations and number of population (the weighted sample size) are reported. Refer to {opt nopop} or {opt noraw} options to suppress any of which.{p_end}
{p 8 8}Allowed options are:{p_end}

{p2colset 9 22 24 2}{...}
{p2col :{opt top}}reports number of observations at the top of the table.{p_end}
{p2col :{opt bottom}}reports number of observations at the bottom of the table.{p_end}
{p2col :{opt title}}reports number of observations in the title of the table. Only allowed when {cmd:title()} is specified.{p_end}
{p2col :{opt note}}reports number of observations in the note of the table. Not allowed when {cmd:nonote} is specified.{p_end}
{p2col :{opt nopop}}not reports number of population when {bf:svy} prefix, {bf:fweight}, {bf:pweight}, or {bf:iweight} is specified.{p_end}
{p2col :{opt noraw}}not reports for raw number of observations.{p_end}

{marker display}{...}
{dlgtab:Display Options}

{p 4 8}{cmd:long} and {cmd:wide} The format which multiple {it:stats} are displayed. {p_end}
{p 8 8}{cmd:long} option displays one statistics below another.{p_end}
{p 8 8}{cmd:wide} option displays one statistics next to another.{p_end}
{p 8 8}The default is {cmd:wide} when {cmd:by()} is not specified and {cmd:long} when {cmd:by()} is specified.{p_end}

{p 4 8}{cmd:format(}{help format:%fmt}{cmd:)} specifies the format which {it:stats} are displayed as.{p_end}
{p 8 8}Only allows for {bf:g}, {bf:f}, {bf:c}, and {bf:e}. See {help format:format} for more information.{p_end}
{p 8 8}The default is {bf:%9.3f}.{p_end}

{p 4 8}{cmd:dec(}{it:#}{cmd:)} specifies the decimals which {it:stats} are displayed as.{p_end}
{p 8 8}The default is {cmd:dec(}3{cmd:)}.{p_end}

{marker label}{...}
{p 4 8}{opt lab:el()} and {opt nol:abel} specifies the usage of variables {help label:labels} and value {help label:labels}.{p_end}
{p 8 8}The allowed options in {cmd:label()} are: {opt var:iable}, {opt val:ue}, {cmd:on}, and {cmd:off}.{p_end}
{p 8 8}The default is using both variables labels and values labels (for factor variables and grouping variables). Specifies {cmd:label(}{it:off}{cmd:)} or {opt nol:abel} to suppress the default.{p_end}
{p 8 8}If only one of {cmd:label(}{it:variable}{cmd:)} and {cmd:label(}{it:value}{cmd:)} is specified, the program will use labels for the specified one and raw values for non specified one.{p_end}
{p 8 8}The program will use the variable name instead when a given variable have no label.{p_end}
{p 8 8}The program will use "Missing" as the label for {help missing:system missing value} and "Missing ({it:.a, .b, ...})" for {help missing:extended missing values}.{p_end}

{p 4 8}{opt par:en}{cmd:()} specifies the {it:stats} be included in parentheses.{p_end}
{p 8 8}The default is not using parenthesis when the display format is {cmd:wide} and using parenthesis for the {it:second} statistics when the display format is {cmd:long}. Use option {opt nopa:ren} to suppress the default.{p_end}

{p 4 8}{opt br:acket}{cmd:()} specifies the {it:stats} be included in squared brackets.{p_end}
{p 8 8}The default is not using squared brackets when the display format is {cmd:wide} and using squared brackets for the {it:third} statistics when the display format is {cmd:long}. Use option {opt nobr:acket} to suppress the default.{p_end}

{marker titles_and_notes}{...}
{dlgtab:Titles and Notes}

{marker title}
{p 4 8}{opt ti:tle}{cmd:(}{it:title_text}{cmd:)} specifies title of the table.{p_end}

{marker panel}
{p 4 8}{opt pan:el}{cmd:(}{it:"panel title 1"[, "panel title 2"...][, {opt alp:habet}|{opt num:ber}|{opt noalp:habet}]}{cmd:)}{p_end}
{p 8 8}Specifies titles of each panel.{p_end}
{p 8 8}Use spaces to separate the tiles of each panel. {it:e.g.,} {cmd:panel(}{it:"Panel A: Dependent Variables" "Panel B: Independent Variables" "Panel C: Control Variables"}{cmd:)}{p_end}
{p 8 8}If the panel title does not contain space(s), quotation marks are not required. {it: e.g.,} {cmd:panel(}{it:DV IV Covariates, alphabet}{cmd:)}{p_end}
{p 8 8}{opt alp:habet} adds {it:"Panel A:", "Panel B:",...} prefix for each panel title. By default, the program uses {it:"Panel A", "Panel B:",...} as panel title(s) when panel setting is used but panel title(s) is not specified. Use {opt noalp:habet} to surpassed the default.{p_end}
{p 8 8}{opt num:ber}} adds {it:"Panel 1:", "Panel 2:",...} prefix for each panel title.{p_end}
{p 8 8}{opt noalp:habet} not to use {it:"Panel A", "Panel B:",...} as panel title(s) when panel title(s) is not specified.{p_end}

{marker note}
{p 4 8}{opt note}{cmd:(}{it:"notes"} {cmd:[, add|{opt pre:fix}|{opt rep:lace}]}{cmd:)}{p_end}
{p 8 8}Specifies user customized note of the table.{p_end}
{p 8 8}If the text in {cmd:note()} does not contain parentheses or commas, quotation marks are not required.{p_end}
{p 8 8}By default, the program adds note(s) explaining the statistics reported in parentheses and squared brackets (if {cmd:obs(}{it:note}{cmd:)} is specified). Use {opt non:ote} to suppress the default.{p_end}
{p 8 8}{cmd:add} puts the user customized note after the default note.{p_end}
{p 8 8}{opt pre:fix} puts the user customized note before the default note.{p_end}
{p 8 8}{opt rep:lace} uses the user customized note to suppress the default note.{p_end}


{marker output}{...}
{dlgtab:Output Files}

{p 4 8}{cmd:save(}{help filename}{cmd:)} specifies the path and filename of the output file.{p_end}
{p 8 8}Use extension in the filename to specify the file type. If the extension is not specified, the program saves the output file as .csv as the default. The allowed output file formats are as follows:{p_end}

{p2colset 9 36 38 2}{...}
{p2col :{opt Microsoft Excel File}}.xls or .xlsx{p_end}
{p2col :{opt Delimited Text file File}}.csv or .txt{p_end}
{p2col :{opt Stata File}}.dta{p_end}

{p 4 8}{cmd:replace} overwrites the existing file.{p_end}

{p 4 8}{cmd:sheet(}{it:sheetname}[, {opt rep:lace}|{opt mod:ify}]{cmd:)} save to Excel worksheet.{p_end}
{p 8 8}{opt rep:lace} or {opt mod:ify} overwrites the existing worksheet.{p_end}

{p 4 8}{opt sheetrep:lace} overwrites the existing Excel worksheet.{p_end}

{p 4 8}{opt see:out} temporally displays the output file in the browser.{p_end}

{p 4 8}{opt nores:tore} replaces the original dataset with the output file. {bf:Notice}: make sure you have saved the original dataset before specifying this option.{p_end}

{marker sep}{...}
{p 4 8}{cmd:sep(}{it:"char"}|{cmd:tab)} specifies using {it:"char"} or tab as delimiter for csv or txt file. The default delimiter is comma.{p_end}


{marker estimation}{...}
{dlgtab:Estimation Approach}

{p 4 8}{opt gc:ollapse} uses {help gcollapse} instead of {help collapse} to perform calculation. Required install {help gcollapse}. Might increase the estimation speeds.{p_end}

{hline}

{title:Example 1. Basic Summary Statistics Table}

{p 4 8} {stata cd} "...working directory..." /* set up the working directory */ {p_end}
{p 4 8} {stata sysuse auto, clear}{p_end}

{p 4 8} /* default as wide when by() is not specified */ {p_end}
{p 4 8} {stata summarystat price mpg i.rep78 headroom trunk weight length turn i.foreign, stat(mean sd min max n) obs(title note) title(Table 1. Summary Statistics) save(auto_summary.xlsx) sheet(format 1) sheetreplace} {p_end}

{p 4 8} /* use "-" to indicate a series of sequence variables. forced to use long format; when stats() not specified, mean and se are assumed */{p_end}
{p 4 8} {stata summarystat price mpg i.rep78 headroom-turn i.foreign, obs(top) title(Table 1. Summary Statistics) save(auto_summary.xlsx) sheet(format 2) sheetreplace long} {p_end}

{p 4 8} /* use panel option for factor variables; adjust format */{p_end}
{p 4 8} {stata summarystat price mpg (i.rep78) headroom trunk weight length turn (i.foreign), stat(mean sd min max n) title(Table 1. Summary Statistics) save(auto_summary.xlsx) sheet(format 3) sheetrep pan("Repair Record 1978" "Car type") dec(2)} {p_end}

{p 4 8} /* Use listwise option to delete observations with any missing values */{p_end}
{p 4 8} {stata summarystat price mpg (i.rep78) headroom trunk weight length turn (i.foreign), stat(mean sd min max n) title(Table 1. Summary Statistics) save(auto_summary.xlsx) sheet(format 4) sheetreplace pan("Repair Record 1978" "Car type") lw} {p_end}

{title:Example 2. Summary Statistics by Grouping Variables}

{p 4 8} {stata cd} "...working directory..." /* set up the working directory */ {p_end}
{p 4 8} {stata sysuse census, clear}{p_end}

{p 4 8} /* default as long when by() is specified */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce, by(region) obs(bottom note) format(%15.1fc) save(census_summary.xlsx) sheet(format 1, replace)} {p_end}

{p 4 8} /* Include additional column for all samples */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce, by(region) all st(mean sd se) obs(bottom note) format(%15.1fc) save(census_summary.xlsx) sheet(format 2, replace)} {p_end}

{p 4 8} /* Grouping by both regions and population */ {p_end}
{p 4 8} {stata gen pop1M = pop >= 1000000} {p_end}
{p 4 8} {stata lab de pop1M 0 "Population below 1M" 1 "Population above 1M"} {p_end}
{p 4 8} {stata lab val pop1M pop1M} {p_end}
{p 4 8} {stata summarystat medage death marriage divorce, by(region pop1M) all st(mean sd se) obs(bottom note) format(%15.1fc) save(census_summary.xlsx) sheet(format 3, replace)} {p_end}

{p 4 8} /* Grouping by both regions by population interaction */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce, by(region#pop1M) all st(mean sd se) obs(bottom note) format(%15.1fc) save(census_summary.xlsx) sheet(format 4, replace)} {p_end}

{p 4 8} /* Put SD in squared brackets and SE in parentheses. */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce, by(region) all st(mean sd se) bra(sd) par(se) obs(bottom note) format(%15.1fc) save(census_summary.xlsx) sheet(format 5, replace)} {p_end}

{title:Example 3. Weights and svy Prefix}

{p 4 8} {stata cd} "...working directory..." /* set up the working directory */ {p_end}
{p 4 8} {stata sysuse census, clear}{p_end}

{p 4 8} /* use population as analytic weights (aweight) */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce [aweight=pop], by(region) all st(mean sd se) obs(top) format(%15.2fc) save(census_summary_weighted.xlsx) sheet(format 1, replace)} {p_end}

{p 4 8} /* use sampling weights (pweight) instead; notice that the program reports both number of observations and population */ {p_end}
{p 4 8} {stata summarystat medage death marriage divorce [pweight=pop], by(region) all st(mean sd se) obs(top) format(%15.2fc) save(census_summary_weighted.xlsx) sheet(format 2, replace)} {p_end}

{p 4 8} /* use svy prefix */ {p_end}
{p 4 8} {stata svyset state [pweight=pop], strata(region)} {p_end}
{p 4 8} {stata "summarystat svy: medage death marriage divorce, by(region) all st(mean sd se) obs(top) format(%15.2fc) save(census_summary_weighted.xlsx) sheet(format 3, replace)"} {p_end}
{p 4 8} /* The calculation is based on "svy: mean" and "estat sd"  */ {p_end}
{p 4 8} {stata "svy: mean medage death marriage divorce"} {p_end}
{p 4 8} {stata "estat sd"} {p_end}
{p 4 8} /* Notice: when lw (cw) is not specified, the program calculates each variable separately to include all possible values. */ {p_end}

{p 4 8} /* specify a different standard error estimation approach */ {p_end}
{p 4 8} {stata svyset state [pweight=pop], strata(region) vce(jackknife)} {p_end}
{p 4 8} {stata "summarystat svy: medage death marriage divorce, by(region) all st(mean sd se) obs(top) format(%15.2fc) save(census_summary_weighted.xlsx) sheet(format 4, replace)"} {p_end}
{p 4 8} /* The calculation is based on "svy: mean" and "estat sd" */ {p_end}
{p 4 8} {stata "svy: mean medage death marriage divorce"} {p_end}
{p 4 8} {stata "estat sd"} {p_end}

{title:Example 4. Various Output Files Options}

{p 4 8} {stata cd} "...working directory..." /* set up the working directory */ {p_end}
{p 4 8} {stata sysuse sp500, clear}{p_end}

{p 4 8} /* save as csv file and use semicolon to separate values */ {p_end}
{p 4 8} {stata summarystat open high low close volume change, st(mean min p10 p25 p50 p75 p90 max iqr) save(sp500_summary.csv) replace sep(";")} {p_end}

{p 4 8} /* save as txt file and use tab to separate values and use seeout option  */ {p_end}
{p 4 8} {stata summarystat open high low close volume change, st(mean min p10 p25 p50 p75 p90 max iqr) save(sp500_summary.txt) replace sep(tab) seeout} {p_end}
{p 4 8} {stata break: press enter to return} {p_end}

{p 4 8} /* save as dta file and use norestore option */ {p_end}
{p 4 8} {stata summarystat open high low close volume change, st(mean min p10 p25 p50 p75 p90 max iqr) save(sp500_summary.dta) replace norestore} {p_end}
{p 4 8} /* Notice that the original dataset would not be preserved when norestore option is specified. */ {p_end}


{hline}

{marker author}{...}
{title:Author}

{p 4 8}Yung-Yu Tsai, University of Missouri, Columbia, MO. ytsai@mail.missouri.edu{p_end}

