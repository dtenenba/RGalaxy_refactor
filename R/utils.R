
.msg <-
    function(fmt, ..., width=getOption("width"))
    ## Use this helper to format all error / warning / message text
{
    txt <- strwrap(sprintf(fmt, ...), width=width, exdent=2)
    paste(txt, collapse="\n")
}

gmessage <-
    function(..., appendLF=TRUE)
{
    message(.msg(...), appendLF=appendLF)
}

gstop <-
    function(..., call.=FALSE)
{
    stop(.msg(...), call.=call.)
}

gwarning <-
    function(..., call.=FALSE, immediate.=FALSE)
{
    warning(.msg(...), call.=call., immediate.=immediate.)
}

.printf <- function(...) cat(noquote(sprintf(...)))
