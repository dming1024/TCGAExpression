
#' getExpression
#'
#' @param gene Offical Gene Symbol: `TP53`
#' @param Project TCGA projects: `TCGA-LUAD`,`TCGA-OV`
#'
#' @return Gene's Expression across TCGA-patients
#' @export
#'
#' @examples
#' library(TCGAExpression)#'
#' inputToken("yJ0eXAiOiJKV1QiLCJhbGciOiJI...xNjUzODMyOTAyLjM4NTU3MzksImlzcyI6Inl4d")#update your token
#' getExpression('TP53','TCGA-LUAD')
getExpression<-function(gene,Project){
  token=getToken()
  if(length(token)==0){
    warning("Token已过期!请先使用: inputToken(yourToken) 更新token\n")
    df=data.frame()
  }else{
    url=sprintf("http://yixuetongji.top:8000/Gene/%s/%s?Project=%s",
                gene,as.character(token),Project)
    raw_result <- httr::GET(url)
    my_content <- httr::content(raw_result,type="application/json")
    if(length(my_content)>2){
      df<-data.frame("gene"=unlist(my_content$TPM),
                     "Group"=unlist(my_content$Group))
    }else{
      warning("Token已过期!请先使用: inputToken(yourToken) 更新token\n")
      df=data.frame()
    }
  }

  return(df)
}
