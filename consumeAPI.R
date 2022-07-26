library(httr)
library(jsonlite)
library(lubridate)

## Credential Issuer Data
CredIssuer <- data.frame(
							Issuer = c("Gitcoin Passport"),
							IssuerDID = c("did:key:z6MkghvGHLobLEdj1bgRLhS4LPGJAvbMA1tn2zcRyqmYU5LC")
				)

## Function to get the passport
gtc_passport <- function(add,CredIssuer)
{
	req <- GET(paste0("http://127.0.0.1:3000/verify?address=",add))
	result <- content(req)
	if(identical(result,FALSE)) return(data.frame())
	res <- data.frame(
						Address = add,
						PassportOrigin = as_datetime(result$issuanceDate),
						CredentialOrigin = as_datetime(sapply(result$stamps,function(x) x$credential$proof$created)),
						CredentialProvider = sapply(result$stamps,function(x) x$provider),
						CredentialIssuer = sapply(result$stamps,function(x) x$credential$issuer),
						CredentialIssuerResolved = CredIssuer$Issuer[match(sapply(result$stamps,function(x) x$credential$issuer),CredIssuer$IssuerDID)],
						CredentialVerified = sapply(result$stamps,function(x) x$verified)
					)
	res$CredentialIssuerResolved <- ifelse(is.na(res$CredentialIssuerResolved),"Not Recognized",res$CredentialIssuerResolved)
	return(res)
}
gtc_passport("0x4cff229ef59e9615d12196a4ceff3f0f663e652d",CredIssuer)
gtc_passport("0xdaEbb0DeD5205606Fd61F6D30FDa718839060B8b",CredIssuer)
