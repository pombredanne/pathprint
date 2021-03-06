\name{customCDFAnn}
\alias{customCDFAnn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map probes to Entrez Gene IDs
}
\description{
Annotates an expression array with entrez gene IDs, averaging to resolve redundancies

}
\usage{
customCDFAnn(data, ann)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
expression dataframe
}
  \item{ann}{
annotation dataframe
}
}
\details{
Maps array probes to a unique list of Entrez Gene IDs. Rhe mean expression value is used for mutiple probes mapping to the same gene. 
}
\value{
Returns a dataframe with a column for each column of the input data and rownames as unique entrez IDs.
 
}
\references{
Altschuler, G. M., O. Hofmann, I. Kalatskaya, R. Payne, S. J. Ho Sui, U. Saxena, A. V. Krivtsov, S. A. Armstrong, T. Cai, L. Stein and W. A. Hide (2013). "Pathprinting: An integrative approach to understand the functional basis of disease." Genome Med 5(7): 68.
}
\author{
Gabriel Altschuler
}
\seealso{
\code{\link{chipframe}}, \code{\link{single.chip.enrichment}}
}
\examples{
require(pathprintGEOData)

# load ALL dataset
require(ALL)
data(ALL)
annotation(ALL)
library(SummarizedExperiment)

# load  the data
data(compressed_result)

ds = c("chipframe", "genesets","pathprint.Hs.gs",
  "platform.thresholds","pluripotents.frame")
data(list = ds)

# extract GEO.fingerprint.matrix and GEO.metadata.matrix
GEO.fingerprint.matrix = assays(result)$fingerprint
GEO.metadata.matrix = colData(result)

# The chip used was the Affymetrix Human Genome U95 Version 2 Array
# The correspending GEO ID is GPL8300

# Extract portion of the expression matrix
ALL.exprs<-exprs(ALL)
ALL.exprs.sub<-ALL.exprs[,1:5]

# Annotate with Entrez Gene IDs, 
ALL.exprs.sub.entrez<-customCDFAnn(ALL.exprs.sub, chipframe$GPL8300$ann)
head(ALL.exprs.sub.entrez)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
