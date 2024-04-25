#' @import Rsamtools
#' @import taxize
#' @import data.table



bam_to_dt <- function(bamfile) {
  table <- data.table()
  bam <- scanBam(bamfile)
  table[, sequence_names := bam[[1]]$qname]
  table[, flag := bam[[1]]$flag]
  rname <- gsub(".*\\|(.*?)\\|.*", "\\1", bam[[1]]$rname) #extracts just taxaID
  table[, rname := rname]
  table[, strand := bam[[1]]$strand]
  table[, pos := bam[[1]]$pos]
  table[, qwidth := bam[[1]]$qwidth]
  table[, mapq := bam[[1]]$mapq]
  table[, cigar := bam[[1]]$cigar]
  table[, mrnm := bam[[1]]$mrnm]
  return(table)
}