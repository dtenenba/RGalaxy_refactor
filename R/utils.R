
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

getPackage <- function(func)
{
    funcName <- deparse(substitute(func))
    env <- NULL
    tryCatch(env <- environment(func),
        error=function(x) {})
    if (is.null(env)) return(NULL)
    name <- environmentName(env)
    if (name == "R_GlobalEnv") return(NULL)
    if (name == "") return(environmentName(parent.env(env)))
    name
}

getVersion <- function(func)
{
    funcName <- deparse(substitute(func))
    tryCatch(packageDescription(getPackage(func))$Version,
        error=function(x) NULL)
}

