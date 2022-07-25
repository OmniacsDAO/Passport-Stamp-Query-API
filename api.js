const sdkreader = require('@gitcoinco/passport-sdk-reader');
const reader = new sdkreader.PassportReader('https://ceramic-clay.3boxlabs.com', '1');
const sdkverifier = require('@gitcoinco/passport-sdk-verifier');
const verifier = new sdkverifier.PassportVerifier();
var express = require("express");
var app = express();

async function verify(add) {    
    const passport = await reader.getPassport(add);
    const verified = await verifier.verifyPassport(add, passport);
    return(verified)
}

app.get("/verify", async (req, res) => {
 const result = await verify(req.query.address)
 res.json(result)
});

app.listen(3000,'0.0.0.0', () => {
 console.log("Server running on port 3000");
});