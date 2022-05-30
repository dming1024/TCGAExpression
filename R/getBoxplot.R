
#' getBoxplot
#'
#' @param df the data.frame returned by `getExpression('TP53','TCGA-LUAD')`
#'
#' @return Boxplot figure
#' @export
#'
#' @examples
#' library(TCGAExpression)
#' df=getExpression('TP53','TCGA-LUAD')
#' getBoxplot(df)
getBoxplot<-function(df){
  p=ggplot2::ggplot(data=df,ggplot2::aes(x=Group,y=log2(as.numeric(gene))))+
    ggplot2::geom_boxplot(ggplot2::aes(fill=Group))+
    ggplot2::geom_jitter()+
    ggplot2::theme_bw(base_size = 20)+
    ggplot2::theme(legend.position = "none")+
    ggplot2::xlab("")+ggplot2::ylab("Log2(TPM+1)")
  return(p)
}
