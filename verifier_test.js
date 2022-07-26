const args = process.argv.slice(2);
const sdkreader = require('@gitcoinco/passport-sdk-reader');
const reader = new sdkreader.PassportReader('https://ceramic-clay.3boxlabs.com', '1');
const sdkverifier = require('@gitcoinco/passport-sdk-verifier');
const verifier = new sdkverifier.PassportVerifier();

async function verify(add) {	
	const passport = await reader.getPassport(add);
	const verified = await verifier.verifyPassport(add, passport);
	return(verified)
}
verify(args[0]).then(pass => {console.log(pass);}).catch(err => {console.log(err);});
