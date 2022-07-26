var express = require("express");
var app = express();

async function verify(add,node) {    
    const sdkreader = require('@gitcoinco/passport-sdk-reader');
    const reader = new sdkreader.PassportReader(node, '1');
    const sdkverifier = require('@gitcoinco/passport-sdk-verifier');
    const verifier = new sdkverifier.PassportVerifier();
    const passport = await reader.getPassport(add);
    const verified = await verifier.verifyPassport(add, passport);
    return(verified)
}

app.get("/verify", async (req, res) => {
    var address = req.query.address;
    var node = req.query.node || 'https://ceramic-clay.3boxlabs.com';
    const result = await verify(address,node);
    res.json(result)
});

app.listen(3000,'0.0.0.0', () => {
 console.log("Server running on port 3000");
});